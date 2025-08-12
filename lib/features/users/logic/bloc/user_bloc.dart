import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list_app/features/users/logic/bloc/user_event.dart';
import 'package:user_list_app/features/users/logic/bloc/user_state.dart';

import '../../data/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await repository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}