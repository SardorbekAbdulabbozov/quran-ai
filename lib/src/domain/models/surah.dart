import 'package:quran_ai/src/utils/constants/strings.dart';
import 'package:floor/floor.dart';
import 'package:equatable/equatable.dart';

@Entity(tableName: surahTableName)
class Surah extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  const Surah(
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  );

  @override
  List<Object?> get props => [
        number,
        name,
        englishName,
        englishNameTranslation,
        numberOfAyahs,
        revelationType,
      ];
}
