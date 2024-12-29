import 'dart:convert';

import 'package:quran_daily/features/quran/data/models/bookmark_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookmarkLocalDataSource {
  Future<void> saveBookmark(BookmarkModel bookmark);
  Future<BookmarkModel> getLastBookmark();
}

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String LAST_BOOKMARK_KEY = 'LAST_BOOKMARK';

  BookmarkLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveBookmark(BookmarkModel bookmark) async {
    await sharedPreferences.setString(
      LAST_BOOKMARK_KEY,
      json.encode(bookmark.toJson()),
    );
  }

  @override
  Future<BookmarkModel> getLastBookmark() async {
    final jsonString = sharedPreferences.getString(LAST_BOOKMARK_KEY);
    if (jsonString != null) {
      return BookmarkModel.fromJson(json.decode(jsonString));
    } else {
      throw Exception('No bookmark found');
    }
  }
}