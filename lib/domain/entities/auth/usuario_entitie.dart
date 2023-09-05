class Usuario {
  final String username;
  final String password;

  Usuario(this.username, this.password);
  
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
