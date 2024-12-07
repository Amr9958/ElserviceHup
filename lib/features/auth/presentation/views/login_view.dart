import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widget/custom_abb_bar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/repos/auth_repo.dart';
import '../maneger/login_cubit/login_cubit.dart';
import 'widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: S.of(context).loginAppBarTitle),
        body: const LoginViewBody(),
      ),
    );
  }
}
