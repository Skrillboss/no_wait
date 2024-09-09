import 'package:flutter/material.dart';
import 'package:todo_turno/presentation/widgets/count_douwn_timer.dart';
import '../../features/shift/domain/entities/shift.dart';

class CardInformation extends StatefulWidget {
  final Shift shift;

  const CardInformation({super.key, required this.shift});

  @override
  CardInformationState createState() => CardInformationState();
}

class CardInformationState extends State<CardInformation> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Card(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    _getIconForStatus(widget.shift.status),
                    color: _getColorForStatus(widget.shift.status),
                  ),
                  title: Text(widget.shift.itemName),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CountdownTimer(
                            initialDuration: widget.shift.currentWaitingDuration,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColorDark
                            ),
                          ),
                          Text(widget.shift.businessName),
                        ],
                      ),
                      if (_isExpanded) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tiempo del turno'),
                            Text(widget.shift.shiftTime.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tiempo estimado para llegar'),
                            Text(widget.shift.estimatedArrivalTime.toString())
                          ],
                        ),
                        // Agrega más filas según sea necesario
                      ],
                    ],
                  ),
                ),
                if (_isExpanded)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Posponer'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Detalles'),
                        onPressed: () {
                          /* ... */
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForStatus(ShiftStatus status) {
    switch (status) {
      case ShiftStatus.active:
        return Icons.check_circle;
      case ShiftStatus.inactive:
        return Icons.pause_circle_filled;
      case ShiftStatus.expired:
        return Icons.error;
      case ShiftStatus.postponed:
        return Icons.schedule;
      case ShiftStatus.error:
        return Icons.refresh;
    }
  }

  Color _getColorForStatus(ShiftStatus status) {
    switch (status) {
      case ShiftStatus.active:
        return Colors.green;
      case ShiftStatus.inactive:
        return Colors.orange;
      case ShiftStatus.expired:
        return Colors.red;
      case ShiftStatus.postponed:
        return Colors.blue;
      case ShiftStatus.error:
        return Colors.red;
    }
  }
}
