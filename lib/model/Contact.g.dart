// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      appContactURL: json['appContactURL'] as String,
      appContactAddress: json['appContactAddress'] as String,
      appContactDescription: json['appContactDescription'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'appContactURL': instance.appContactURL,
      'appContactDescription': instance.appContactDescription,
      'appContactAddress': instance.appContactAddress,
    };
