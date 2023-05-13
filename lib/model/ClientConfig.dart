import 'package:flutter/material.dart';
import 'package:happifeet/model/AboutUs.dart';
import 'package:happifeet/model/Contact.dart';
import 'package:happifeet/model/HelpData.dart';
import 'package:happifeet/utils/ColorParser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ClientConfig.g.dart';

@JsonSerializable()
class ClientConfig {
  String appTitle;
  String clientId;
  String appDescription;
  String appLogo;
  Contact appContact;
  AboutUs appAboutUs;
  HelpData appHelpData;
  bool canScanQR;
  String? appPrimaryColor;
  String? appSecondaryColor;
  String? appAccentColor;
  String? appButtonColor;
  String? appIconTint;

  // ClientConfig(
  //     this.appTitle,
  //     this.clientId,
  //     this.appDescription,
  //     this.appLogo,
  //     this.appContact,
  //     this.appAboutUs,
  //     this.appHelpData,
  //     this.canScanQR,
  //     this.appPrimaryColor,
  //     this.appSecondaryColor,
  //     this.appAccentColor,
  //     this.appButtonColor,
  //     this.appIconTint);

  ClientConfig(
      {required this.appTitle,
      required this.clientId,
      required this.appDescription,
      required this.appLogo,
      required this.appContact,
      required this.appAboutUs,
      required this.appHelpData,
      required this.canScanQR});

  /// GETTER METHODS
  String get getAppTitle {
    return appTitle;
  }

  String get getClientId {
    return clientId;
  }

  String get getAppDescription {
    return appDescription;
  }

  String get getAppLogo {
    return appLogo;
  }

  Contact get getAppContact {
    return appContact;
  }

  AboutUs get getAppAboutUs {
    return appAboutUs;
  }

  HelpData get getAppHelpData {
    return appHelpData;
  }

  bool get getScanQRStatus {
    return canScanQR;
  }

  /// JSON Mapper

  factory ClientConfig.fromJson(Map<String, dynamic> json) =>
      _$ClientConfigFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ClientConfigToJson(this);

  /// Theme Generator
  getAppTheme() {
    return ThemeData(
        primarySwatch: ColorParser()
            .getMaterialColor(ColorParser().hexToColor(appPrimaryColor!)));
  }
}
