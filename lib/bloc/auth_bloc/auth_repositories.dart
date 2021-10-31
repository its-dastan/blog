class AuthRepository {
  Future<void>? signin() async {
    print("Attempting signin");
    await Future.delayed(const Duration(seconds: 10));
    print("logged in");
  }
}
