// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllSurahsResponse extends Equatable{
  int? code;
  String? status;
  List<Surah>? surahs;

  AllSurahsResponse({this.code, this.status, this.surahs});

  AllSurahsResponse.fromMap(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      surahs = <Surah>[];
      json['data'].forEach((v) {
        surahs!.add(Surah.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (surahs != null) {
      data['data'] = surahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  Surah.fromMap(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelationType'] = revelationType;
    return data;
  }
}
