class PhotoGalleryModel {
  String? image;
  String? imgName;

  PhotoGalleryModel({this.image, this.imgName});

  factory PhotoGalleryModel.fromJson(Map<String, dynamic> json) {
    return PhotoGalleryModel(
      image: json['image'] as String?,
      imgName: json['img_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'img_name': imgName,
      };
}
