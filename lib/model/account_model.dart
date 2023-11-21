import '../resources/constants/image_constant.dart';
import '../resources/constants/string_constants.dart';

class Account {
  final String accountName;
  final String accountId;
  final String currencyLogo;
  final String currencyName;

  Account(
      {required this.accountName,
      required this.accountId,
      required this.currencyLogo,
      required this.currencyName});
}

final List<Account> accounts = [
  Account(
      accountName: "Nelson Mojolaoluwa",
      accountId: "IBAN: GB93MOCK00000070803104",
      currencyLogo: euroIcon,
      currencyName: euro)
];
