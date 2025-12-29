class UserModel {
  final int ?id;
  final String  ?name;
  final String ?email;
  final String ?username;
  final String ?phone;
  final String ?role;
  final String ?gender;

  UserModel({
     this.id,
     this.name,
     this.email,
     this.username,
     this.phone,
     this.role,
     this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? 'N/A',
      gender: json['gender'] ?? 'N/A',
    );
  }
}
