class SpecificJuzResponse {
  int? code;
  String? status;
  Juz? juz;

  SpecificJuzResponse({this.code, this.status, this.juz});

  SpecificJuzResponse.fromMap(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    juz = json['data'] != null ? Juz.fromMap(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (juz != null) {
      data['data'] = juz!.toJson();
    }
    return data;
  }
}

class Juz {
  int? number;
  List<Ayahs>? ayahs;
  Surahs? surahs;
  Edition? edition;

  Juz({this.number, this.ayahs, this.surahs, this.edition});

  Juz.fromMap(Map<String, dynamic> json) {
    number = json['number'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromMap(v));
      });
    }
    surahs =
    json['surahs'] != null ? Surahs.fromMap(json['surahs']) : null;
    edition =
    json['edition'] != null ? Edition.fromMap(json['edition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    if (ayahs != null) {
      data['ayahs'] = ayahs!.map((v) => v.toJson()).toList();
    }
    if (surahs != null) {
      data['surahs'] = surahs!.toJson();
    }
    if (edition != null) {
      data['edition'] = edition!.toJson();
    }
    return data;
  }
}

class Ayahs {
  int? number;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
        this.text,
        this.surah,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromMap(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    surah = json['surah'] != null ? Surah.fromMap(json['surah']) : null;
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['text'] = text;
    if (surah != null) {
      data['surah'] = surah!.toJson();
    }
    data['numberInSurah'] = numberInSurah;
    data['juz'] = juz;
    data['manzil'] = manzil;
    data['page'] = page;
    data['ruku'] = ruku;
    data['hizbQuarter'] = hizbQuarter;
    data['sajda'] = sajda;
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  Surah(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.numberOfAyahs});

  Surah.fromMap(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['revelationType'] = revelationType;
    data['numberOfAyahs'] = numberOfAyahs;
    return data;
  }
}

class Surahs {
  Surah? s1;
  Surah? s2;

  Surahs({this.s1, this.s2});

  Surahs.fromMap(Map<String, dynamic> json) {
    s1 = json['1'] != null ? Surah.fromMap(json['1']) : null;
    s2 = json['2'] != null ? Surah.fromMap(json['2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (s1 != null) {
      data['1'] = s1!.toJson();
    }
    if (s2 != null) {
      data['2'] = s2!.toJson();
    }
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type,
        this.direction});

  Edition.fromMap(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['language'] = language;
    data['name'] = name;
    data['englishName'] = englishName;
    data['format'] = format;
    data['type'] = type;
    data['direction'] = direction;
    return data;
  }
}
