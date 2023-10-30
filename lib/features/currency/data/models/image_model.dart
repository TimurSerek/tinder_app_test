import 'package:tinder_app_test/features/currency/domain/entities/image.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) : super(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
