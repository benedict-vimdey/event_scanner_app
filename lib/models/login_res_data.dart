class Data{
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool isSuperuser;
  final bool isActive;
  final String dateJoined;

  Data({required this.username, required this.firstName, required this.lastName, required this.email, required this.phone, required this.isSuperuser, required this.isActive, required this.dateJoined, required this.id});
}