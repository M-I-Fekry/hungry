class UserModel {
  final String name;
  final String email;
  final String? image;
  final String? token;
  final String? visa;
  final String? adsress;

  UserModel({
    required this.name,
    required this.email,
    this.image,
    this.token,
    this.visa,
    this.adsress,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('🔍 Parsing user data - token field: ${json['token']}');
    return UserModel(
      name: json['name'].toString(),
      email: json['email'].toString(),
      image: json['image'].toString(),
      token: json['token'],
      adsress: json['address'].toString(),
      visa: json['Visa'].toString(),
    );
  }
}
