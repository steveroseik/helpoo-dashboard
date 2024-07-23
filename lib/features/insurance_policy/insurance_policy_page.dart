import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/util/constants.dart';
import '../../core/util/cubit/cubit.dart';
import '../../core/util/cubit/state.dart';
import '../../core/util/widgets/main_scaffold.dart';
import 'widgets/insurance_policy_main_widget.dart';

class InsurancePolicyPage extends StatefulWidget {
  const InsurancePolicyPage({super.key});

  @override
  State<InsurancePolicyPage> createState() => _InsurancePolicyPageState();
}

class _InsurancePolicyPageState extends State<InsurancePolicyPage> {
  @override
  void initState() {
    super.initState();

    // if (userRoleName == Rules.Super.name) {
    //   appBloc.getAllAdminCars();
    // } else {
    //   appBloc.getPolicies(isRefresh: false);
    // }
    appBloc.getPolicies(isRefresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return const MainScaffold(
          scaffold: Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: InsurancePolicyMainWidget(),
            ),
          ),
        );
      },
    );
  }
}