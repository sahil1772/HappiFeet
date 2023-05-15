import 'package:json_annotation/json_annotation.dart';

part 'AboutUs.g.dart';

@JsonSerializable()
class AboutUs {
  String appAboutUsDescription;

  // AboutUs(
  //     this.appAboutUsDescription);
  AboutUs({required this.appAboutUsDescription});

  factory AboutUs.fromJson(Map<String, dynamic> json) =>
      _$AboutUsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AboutUsToJson(this);
}
