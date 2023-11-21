class CustomerModel {
  final String fullName;
  final String mobileNumber;
  final String country;
  final String state;
  final String address;

  CustomerModel(
      {required this.country,
      required this.address,
      required this.mobileNumber,
      required this.fullName,
      required this.state});
}
