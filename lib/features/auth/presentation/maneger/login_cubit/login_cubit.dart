import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
        (l) => emit(LoginError(l.message)), (r) => emit(LoginSuccess(r)));
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
        (l) => emit(LoginError(l.message)), (r) => emit(LoginSuccess(r)));
  }
  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
        (l) => emit(LoginError(l.message)), (r) => emit(LoginSuccess(r)));
  }
}



