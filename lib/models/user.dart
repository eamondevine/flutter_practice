class UserOne {
  final String uid;

  UserOne({required this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String dish;
  final int price;

  UserData({
    required this.uid,
    required this.dish,
    required this.name,
    required this.price,
  });
}
