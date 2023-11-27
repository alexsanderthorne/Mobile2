import 'package:my_pets/PetModel.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    String path = 'pets_database.db'; // Use a different path as needed
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE pets(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            species TEXT,
            price INTEGER,
            picture TEXT,
            foods TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertPet(PetModel pet) async {
    await _database.insert('pets', pet.toMap());
  }
}
