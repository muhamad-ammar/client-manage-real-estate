// import 'dart:convert';
// import 'package:mvvm_pro/data/models/user_account.dart';
// import 'package:mvvm_pro/data/utils.dart';

// class AccountLocalStorage {
//   List<Account> getAccountLocal() {
//     try {
//       List<String>? cached = preferences?.getStringList('accountLocal');
//       cached ??= [];

//       return cached.map((json) => Account.fromJson(jsonDecode(json))).toList();
//     } catch (e) {
//       throw Exception();
//     }
//   }

//   void saveAccountLocal(Account account) {
//     String json = jsonEncode(account.toJson());

//     List<String>? cached = preferences?.getStringList('accountLocal');

//     cached ??= [];

//     cached = [];
//     cached.add(json);

//     preferences?.setStringList('accountLocal', cached);
//   }
// }
