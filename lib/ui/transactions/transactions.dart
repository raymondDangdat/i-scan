import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';

import '../../Utils/functions.dart';
import '../../Widgets/components.dart';
import '../../resources/color_manager.dart';

class TransactionScreen extends StatelessWidget {
  static const routeName = 'transaction';
  final Map data;
  const TransactionScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDebit = data['type'] == 'debit';
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Text(
                  (isDebit ? '-' : '+') +
                      formatCurrency(
                        double.parse(data['amount']),
                        symbol: 'NGN',
                      ),
                  style: TextStyle(
                    color: isDebit
                        ? const Color(0xFFFB5C00)
                        : const Color(0xFF31B75E),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  Jiffy.parse(data['created_at']).format(
                    pattern: 'dd MMM, yyyy hh:mm a',
                  ),
                  style: TextStyle(
                    color: ColorManager.grey60,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            margin: const EdgeInsets.symmetric(vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Column(
              children: [
                buildRow(
                  title: 'From',
                  value: 'NGN Wallet',
                ),
                buildRow(
                  title: 'To',
                  value: data['recipient_name'] +
                      '\n' +
                      data['recipient_account_number'],
                ),
                buildRow(
                  title: 'Narration',
                  value: data['description'],
                ),
                buildRow(
                  title: 'Fee',
                  value: formatCurrency(
                    double.parse(data['fee']),
                    symbol: 'NGN',
                  ),
                ),
                buildRow(
                  title: 'Reference',
                  value: data['reference'],
                  canCopy: true,
                ),
                buildRow(
                  title: 'Status',
                  value: data['status'],
                  isStatus: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MainButton(
              'Report Transaction',
              () {},
              color: const Color(0x26FF784B),
              textColor: const Color(0xFFFF784B),
            ),
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MainButton('View receipt', () {}),
          ),
        ],
      ),
    );
  }

  Widget buildRow({
    required String title,
    required String value,
    bool canCopy = false,
    bool isStatus = false,
  }) {
    bool isSuccess = value.toLowerCase() == 'success';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(.05),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isStatus ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorManager.grey60,
              fontSize: 12,
            ),
          ),
          isStatus
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSuccess ? Color(0x2131B75E) : const Color(0x26657B9A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    value.capitalizeFirst!,
                    style: TextStyle(
                      color: isSuccess
                          ? const Color(0xFF31B75E)
                          : const Color(0xFF657B9A),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Expanded(
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF292929),
                      fontSize: 12,
                      fontWeight: canCopy ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ),
          if (canCopy)
            InkWell(
              onTap: () {
                copyToClipboard(value);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Iconsax.copy, size: 16),
              ),
            ),
        ],
      ),
    );
  }
}
