class FirestorePath {
  static String card(String uid, String cardId) => 'users/$uid/card/$cardId';
  static String cards(String uid) => 'users/$uid/card';
}