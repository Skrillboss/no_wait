import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class NumberSelection extends StatefulWidget {
  const NumberSelection({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onOutOfConstraints,
    this.enableOnOutOfConstraintsAnimation = true,
    this.direction = Axis.horizontal,
    this.withSpring = true,
    this.maxValue = 14,
    this.minValue = 1,
    this.theme,
  });

  final Axis direction;
  final int? initialValue;
  final ValueChanged<int>? onChanged;
  final Function? onOutOfConstraints;
  final bool enableOnOutOfConstraintsAnimation;
  final bool withSpring;
  final int minValue;
  final int maxValue;
  final NumberSelectionTheme? theme;

  @override
  _NumberSelectionState createState() => _NumberSelectionState();
}

class _NumberSelectionState extends State<NumberSelection>
    with TickerProviderStateMixin {
  late bool _isHorizontal = widget.direction == Axis.horizontal;
  late AnimationController _controller = AnimationController(
      vsync: this, lowerBound: -0.5, upperBound: 0.5, value: 0);
  late Animation _animation = _isHorizontal
      ? Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(1.0, 0.0))
      .animate(_controller)
      : Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 1.0))
      .animate(_controller);
  late int _value = widget.initialValue ?? widget.minValue;

  late AnimationController _backgroundColorController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 250), value: 0)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _backgroundColorController.animateTo(0, curve: Curves.easeIn);
      }
    });
  final ColorTween _backgroundColorTween = ColorTween();
  late Animation<Color?> _backgroundColor = _backgroundColorController.drive(
      _backgroundColorTween.chain(CurveTween(curve: Curves.fastOutSlowIn)));

  late NumberSelectionTheme _theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _backgroundColorController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _getTheme();
    _isHorizontal = widget.direction == Axis.horizontal;
    _backgroundColorTween
      ..begin = _theme.backgroundColor
      ..end = _theme.outOfConstraintsColor;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    _getTheme();
    _backgroundColorTween
      ..begin = _theme.backgroundColor
      ..end = _theme.outOfConstraintsColor;
    super.didChangeDependencies();
  }

  void _getTheme() {
    if(widget.theme == null){
      _theme = NumberSelectionTheme(
          draggableCircleColor: Colors.white,
          numberColor: Colors.black,
          iconsColor: Colors.green[900],
          backgroundColor: Colors.green,
          outOfConstraintsColor: Colors.red);
    }else{
      _theme = widget.theme!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: _isHorizontal ? 140.0 : 60.0,
        height: _isHorizontal ? 40.0 : 90.0,
        child: AnimatedBuilder(
          animation: _backgroundColorController,
          builder: (BuildContext context, Widget? child) => Material(
            type: MaterialType.canvas,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(30.0),
            color: _backgroundColor.value,
            child: child,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: _isHorizontal ? 7 : 0,
                right: _isHorizontal ? null : 0,
                bottom: _isHorizontal ? 0 : 7,
                top: _isHorizontal ? 0 : null,
                child: IconButton(
                  icon: Icon(Icons.remove, size: 20, color: _theme.iconsColor),
                  onPressed: () =>
                      _changeValue(adding: false, fromButtons: true),
                ),
              ),
              Positioned(
                left: _isHorizontal ? null : 0,
                right: _isHorizontal ? 7 : 0,
                top: _isHorizontal ? 0 : 7,
                bottom: _isHorizontal ? 0 : null,
                child: IconButton(
                  icon: Icon(Icons.add, size: 20, color: _theme.iconsColor),
                  onPressed: () => _changeValue(adding: true, fromButtons: true),
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: _animation as Animation<Offset>,
                  child: Material(
                    color: _theme.draggableCircleColor,
                    shape: const CircleBorder(),
                    elevation: 5.0,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation,
                              child: child);
                        },
                        child: Text(
                          '$_value',
                          key: ValueKey<int>(_value),
                          style: TextStyle(
                              color: _theme.numberColor, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = _offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = _offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.20) {
      _isHorizontal ? _changeValue(adding: false) : _changeValue(adding: true);
    } else if (_controller.value >= 0.20) {
      _isHorizontal ? _changeValue(adding: true) : _changeValue(adding: false);
    }
  }

  double _offsetFromGlobalPos(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    double dx = ((local.dx * 0.75) / box.size.width) - 0.4;
    double dy = ((local.dy * 0.75) / box.size.height) - 0.4;

    return _isHorizontal ? dx : dy;
  }

  void _changeValue({required bool adding, bool fromButtons = false}) {
    bool valueOutOfConstraints = false;
    if (adding && _value + 1 <= widget.maxValue) {
      setState(() => _value++);
    } else if (!adding && _value - 1 >= widget.minValue) {
      setState(() => _value--);
    } else {
      valueOutOfConstraints = true;
    }

    if (widget.withSpring) {
      final SpringDescription _springDesc = SpringDescription.withDampingRatio(
        mass: valueOutOfConstraints && widget.enableOnOutOfConstraintsAnimation
            ? 0.4
            : 0.9,
        stiffness:
        valueOutOfConstraints && widget.enableOnOutOfConstraintsAnimation
            ? 1000
            : 250.0,
        ratio: 0.6,
      );
      _controller.animateWith(SpringSimulation(
        _springDesc,
        _controller.value,
        0.0,
        0.0,
      ));
    } else {
      _controller.animateTo(0.0,
          curve: Curves.bounceOut, duration: const Duration(milliseconds: 250));
    }

    if (valueOutOfConstraints) {
      widget.onOutOfConstraints?.call();
      if (widget.enableOnOutOfConstraintsAnimation) {
        _backgroundColorController.forward();
      }
    } else {
      widget.onChanged?.call(_value);
    }
  }
}

class NumberSelectionTheme {
  Color? draggableCircleColor;
  Color? numberColor;
  Color? iconsColor;
  Color? backgroundColor;
  Color? outOfConstraintsColor;

  NumberSelectionTheme({
    this.draggableCircleColor = Colors.green,
    this.numberColor = Colors.green,
    this.iconsColor = Colors.green,
    this.backgroundColor = Colors.green,
    this.outOfConstraintsColor = Colors.green,
  });
}
