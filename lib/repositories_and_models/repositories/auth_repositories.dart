class AuthRepository {
  Future<void>? signin() async {
    print("Attempting signin");
    await Future.delayed(const Duration(seconds: 3));
    print("logged in");
    throw Exception("Failed to login");
  }
}
