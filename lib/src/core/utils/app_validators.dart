class AppValidators {
  //! Singleton
  static AppValidators get instantiate => AppValidators.init();
  AppValidators.init();

  String? Function(String?)? get email => (email) {
        if (email!.isEmpty) {
          return 'fill the gap';
        } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
          return 'Invalid email format';
        }
        return null;
      };

  String? Function(String?)? get password => (password) {
        if (password!.isEmpty) {
          return 'password is required';
        } else if (password.length < 8) {
          return 'password must contain at least 8 characters';
        } else if (password.length > 16) {
          return 'password must contain at most 16 characters';
        }
        return null;
      };

  String? Function(String?)? get name => (firstname) {
        if (firstname!.isEmpty) {
          return 'name is required';
        } else if (RegExp(r"^[0-9.!#$%&'*+-/=?^_`{|}~]+@\]").hasMatch(firstname)) {
          return "name shouldn't contain digits or symbols";
        }
        return null;
      };
}
