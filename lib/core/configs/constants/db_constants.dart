class DbConstants {
  static int versionNumber = 1;
  static String dbName = "data.db";
}

class UserDB {
  static const String id = "id";
  static const String name = "name";
  static const String tableName = "user";
  static const List<String> columns = [id, name];
  static String tableCreationQuery =
      "CREATE TABLE user($id TEXT PRIMARY KEY,$name TEXT)";
  static String add = "INSERT INTO $tableName VALUES(?)";
}
