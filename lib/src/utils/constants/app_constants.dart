import 'package:quran_ai/src/domain/models/juz.dart';

class AppConstants {
  static List<String> surahNamesUz = [
    'Fotiha', //1
    'Baqara', //2
    'Oli Imron', //3
    'Niso', //4
    'Moida', //5
    'An`om', //6
    'A`rof', //7
    'Anfol', //8
    'Tavba', //9
    'Yunus', //10
    'Hud', //11
    'Yusuf', //12
    'Ra`d', //13
    'Ibrohim', //14
    'Hijr', //15
    'Nahl', //16
    'Isro', //17
    'Kahf', //18
    'Maryam', //19
    'Toha', //20
    'Anbiyo', //21
    'Haj', //22
    'Mu`minun', //23
    'Nur', //24
    'Furqon', //25
    'Shuaro', //26
    'Naml', //27
    'Qosos', //28
    'Ankabut', //29
    'Rum', //30
    'Luqmon', //31
    'Sajda', //32
    'Ahzob', //33
    'Saba', //34
    'Fotir', //35
    'Yaasin', //36
    'Soffaat', //37
    'Sod', //38
    'Zumar', //39
    'G`ofir', //40
    'Fussilat', //41
    'Shuuro', //42
    'Zuxruf', //43
    'Duxon', //44
    'Josiya', //45
    'Ahqof', //46
    'Muhammad', //47
    'Fath', //48
    'Hujurot', //49
    'Qof', //50
    'Zaariyaat', //51
    'Tur', //52
    'Najm', //53
    'Qomar', //54
    'Ar-Rohman', //55
    'Voqi`a', //56
    'Hadid', //57
    'Mujodala', //58
    'Hashr', //59
    'Mumtahana', //60
    'Soff', //61
    'Juma', //62
    'Munofiqun', //63
    'Tag`obun', //64
    'Taloq', //65,
    'Tahrim', //66
    'Mulk', //67
    'Qalam', //68
    'Haaqqo', //69
    'Ma`orij', //70
    'Nuh', //71
    'Jin', //72
    'Muzammil', //73
    'Muddassir', //74
    'Qiyaama', //75
    'Inson', //76
    'Mursalaat', //77
    'Naba`', //78
    'Nazi`aat', //79
    'Abasa', //80
    'Takvir', //81
    'Infitor', //82
    'Mutoffifun', //83
    'Inshiqoq', //84
    'Buruj', //85
    'Toriq', //86
    'A`laa', //87
    'G`oshiya', //88
    'Fajr', //89
    'Balad', //90
    'Shams', //91
    'Layl', //92
    'Zuho', //93
    'Sharh', //94
    'Tiyn', //95
    'Alaq', //96
    'Qadr', //97
    'Bayyina', //98
    'Zalzala', //99
    'Adiyat', //100
    'Qori`a', //101
    'Takaasur', //102
    'Asr', //103
    'Humaza', //104
    'Fil', //105
    'Quraysh', //106
    'Maa`uun', //107
    'Kavsar', //108
    'Kaafirun', //109
    'Nasr', //110
    'Masad', //111
    'Ixlos', //112
    'Falaq', //113
    'Naas', //114
  ];

  static Map<String, String> revelation = {
    "Medinan": "Madaniy",
    "Meccan": "Makkiy"
  };

  static List<Juz> juzs = [
    Juz(startingSurahName: 'Fotiha', startingAyahNumber: '1'), //1
    Juz(startingSurahName: 'Baqara', startingAyahNumber: '142'), //2
    Juz(startingSurahName: 'Baqara', startingAyahNumber: '253'), //3
    Juz(startingSurahName: 'Oli Imron', startingAyahNumber: '92'), //4
    Juz(startingSurahName: 'Niso', startingAyahNumber: '24'), //5
    Juz(startingSurahName: 'Niso', startingAyahNumber: '148'), //6
    Juz(startingSurahName: 'Moida', startingAyahNumber: '83'), //7
    Juz(startingSurahName: 'An`om', startingAyahNumber: '111'), //8
    Juz(startingSurahName: 'A`rof', startingAyahNumber: '88'), //9
    Juz(startingSurahName: 'Anfol', startingAyahNumber: '41'), //10
    Juz(startingSurahName: 'Tavba', startingAyahNumber: '94'), //11
    Juz(startingSurahName: 'Hud', startingAyahNumber: '6'), //12
    Juz(startingSurahName: 'Yusuf', startingAyahNumber: '53'), //13
    Juz(startingSurahName: 'Hijr', startingAyahNumber: '1'), //14
    Juz(startingSurahName: 'Isro', startingAyahNumber: '1'), //15
    Juz(startingSurahName: 'Kahf', startingAyahNumber: '75'), //16
    Juz(startingSurahName: 'Anbiyo', startingAyahNumber: '1'), //17
    Juz(startingSurahName: 'Mu`minun', startingAyahNumber: '1'), //18
    Juz(startingSurahName: 'Furqon', startingAyahNumber: '21'), //19
    Juz(startingSurahName: 'Naml', startingAyahNumber: '60'), //20
    Juz(startingSurahName: 'Ankabut', startingAyahNumber: '45'), //21
    Juz(startingSurahName: 'Ahzob', startingAyahNumber: '31'), //22
    Juz(startingSurahName: 'Yaasin', startingAyahNumber: '22'), //23
    Juz(startingSurahName: 'Zumar', startingAyahNumber: '32'), //24
    Juz(startingSurahName: 'Fussilat', startingAyahNumber: '47'), //25
    Juz(startingSurahName: 'Ahqof', startingAyahNumber: '1'), //26
    Juz(startingSurahName: 'Zaariyaat', startingAyahNumber: '31'), //27
    Juz(startingSurahName: 'Mujodala', startingAyahNumber: '1'), //28
    Juz(startingSurahName: 'Mulk', startingAyahNumber: '1'), //29
    Juz(startingSurahName: 'Naba`', startingAyahNumber: '1'), //30
  ];
}
