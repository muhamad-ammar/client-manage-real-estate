// import 'dart:convert';
// import '../utils.dart';

// class LocalizationLocalStorage {
//   Future<Map<String, dynamic>> getLocalization() {
//     var cached = preferences?.getString('localizationLocal');
//     return Future.value(jsonDecode(cached!));
//   }

//   void saveLocalizationLocal(Map<String, dynamic> localizationRepository) {
//     String json = jsonEncode(localizationRepository);

//     String? cachedApp = preferences?.getString('localizationLocal');

//     cachedApp ??= '';

//     cachedApp = '';

//     cachedApp = json;

//     preferences?.setString('localizationLocal', cachedApp);
//   }
// }
