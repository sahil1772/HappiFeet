// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClientConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientConfig _$ClientConfigFromJson(Map<String, dynamic> json) => ClientConfig(
      appTitle: json['appTitle'] as String,
      clientId: json['clientId'] as String,
      appDescription: json['appDescription'] as String,
      appLogo: json['appLogo'] as String,
      appContact: Contact.fromJson(json['appContact'] as Map<String, dynamic>),
      appAboutUs: AboutUs.fromJson(json['appAboutUs'] as Map<String, dynamic>),
      appHelpData:
          HelpData.fromJson(json['appHelpData'] as Map<String, dynamic>),
      canScanQR: json['canScanQR'] as bool,
    )
      ..appPrimaryColor = json['appPrimaryColor'] as String?
      ..appSecondaryColor = json['appSecondaryColor'] as String?
      ..appAccentColor = json['appAccentColor'] as String?
      ..appButtonColor = json['appButtonColor'] as String?
      ..appIconTint = json['appIconTint'] as String?;

Map<String, dynamic> _$ClientConfigToJson(ClientConfig instance) =>
    <String, dynamic>{
      'appTitle': instance.appTitle,
      'clientId': instance.clientId,
      'appDescription': instance.appDescription,
      'appLogo': instance.appLogo,
      'appContact': instance.appContact,
      'appAboutUs': instance.appAboutUs,
      'appHelpData': instance.appHelpData,
      'canScanQR': instance.canScanQR,
      'appPrimaryColor': instance.appPrimaryColor,
      'appSecondaryColor': instance.appSecondaryColor,
      'appAccentColor': instance.appAccentColor,
      'appButtonColor': instance.appButtonColor,
      'appIconTint': instance.appIconTint,
    };
