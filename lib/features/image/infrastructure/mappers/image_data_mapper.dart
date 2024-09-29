import '../../domain/entities/image_data.dart';

class ImageDataMapper {
  static ImageData fromJson(Map<String, dynamic> json) {
    return ImageData(
        displayUrl: json['display_url'],
        updateUrl: json['url_viewer'],
        deleteUrl: json['delete_url']);
  }
}
