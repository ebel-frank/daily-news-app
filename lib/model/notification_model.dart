import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotificationModel {
  var id, image, title, subtitle, url;

  NotificationModel({this.id, this.image, this.title, this.subtitle, this.url});

  Map<String, dynamic> toMap() {
    return {'image':image, 'title':title, 'subtitle':subtitle, 'url':url};
  }
}

final tableBookmarks = 'bookmarks';
final db = openDB();

Future<Database> openDB() async {
  return openDatabase(join(await getDatabasesPath(), "dailynews.db"),
      version: 1, onCreate: (db, version) async {
    return db.execute(
        'create table if not exists $tableBookmarks ( _id integer primary key autoincrement, image text not null, title text not null, subtitle text not null, url text not null)');
  });
}

Future<void> insert(NotificationModel bookmark) async {
  final database = await db;
  database.insert(
    tableBookmarks,
    bookmark.toMap(),
    conflictAlgorithm: ConflictAlgorithm.ignore,
  );
}

Future<List<NotificationModel>> allBookmarks() async {
  // Get a reference to the database.
  final database = await db;

  // Query the table for all The Bookmarks.
  final List<Map<String, dynamic>> maps = await database.query(tableBookmarks);

  // Convert the List<Map<String, dynamic> into a List<Bookmark>.
  return List.generate(
    maps.length,
    (i) {
      return NotificationModel(
          id: maps[i]['_id'],
          image: maps[i]['image'],
          title: maps[i]['title'],
          subtitle: maps[i]['subtitle'],
          url: maps[i]['url']);
    },
  );
}

Future<void> delete(int id) async {
  final database = await db;
  // Remove the Product from the database.
  // Pass the Bookmark's id as a whereArg to prevent SQL injection.
  await database.delete(tableBookmarks, where: "_id = ?", whereArgs: [id]);
}

Future close() async => (await db).close();
