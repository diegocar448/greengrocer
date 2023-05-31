class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      id: map['id'],
      fullname: map['fullname'],
      password: map['password'],
      phone: map['phone'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'email': email,
      'id': id,
      'fullname': fullname,
      'password': password,
      'phone': phone,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $fullname | cpf: $cpf';
  }
}
