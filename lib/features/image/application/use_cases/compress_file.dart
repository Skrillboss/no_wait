import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;


class CompressFile {
  static Future<File> compressAndGetFile(File file) async {
    final Directory dir = await getTemporaryDirectory();

    String targetPath = path.join(dir.path, 'compressed_${file.uri.pathSegments.last}');

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 40,
    );

    if (result != null) {
      return File(result.path);
    } else {
      throw Exception("No se pudo comprimir la imagen");
    }
  }
}
