import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widget/custom_abb_bar.dart';
import '../../../../generated/l10n.dart';
import '../../domain/repos/auth_repo.dart';
import '../maneger/signup_cubit/signup_cubit.dart';
import 'widget/singup_view_body.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});
  static const routeName = '/singUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(sl<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: S.of(context).sindUPAppBarTitle,
        ),
        body: const SingUpViewBody(),
      ),
    );
  }
}
