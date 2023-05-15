import 'package:json_annotation/json_annotation.dart';

part 'HelpData.g.dart';

@JsonSerializable()
class HelpData {
  String imageLink;
  int imagePos;
  String id;

  // HelpData(this.imageLink, this.imagePos,
  //     this.id);
  HelpData({required this.id, required this.imageLink, required this.imagePos});

  factory HelpData.fromJson(Map<String, dynamic> json) =>
      _$HelpDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HelpDataToJson(this);
}
