import 'package:flutter/material.dart';
import 'package:i_scan/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Container();
  }
}
