class UserModel {
  final String firstName;
  final String lastName;
  final String id;
  final String email;
  final String phoneNumber;
  final String accountType;
  

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.email,
      required this.phoneNumber,
      required this.accountType,
      });

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'].toString(),
        firstName = data['first_name'].toString(),
        lastName = data['last_name'].toString(),
        email = data['email'].toString(),
        
        phoneNumber = data['phone_number'].toString(),
        accountType = data['account_type'].toString();
}