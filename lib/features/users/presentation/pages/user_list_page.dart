import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list_app/core/constants/string_constants.dart';
import 'package:user_list_app/core/widgets/loading_indicator.dart';

import '../../logic/bloc/user_bloc.dart';
import '../../logic/bloc/user_event.dart';
import '../../logic/bloc/user_state.dart';
import '../widgets/user_tile.dart';

class UserListPage extends StatelessWidget{
  const UserListPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text(AppStrings.userListTitle),
      actions: [IconButton( icon: const Icon(Icons.refresh),
      onPressed: () => context.read<UserBloc>().add(FetchUsers()),
     )
   ],
  ),
  body: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(itemCount: state.users.length,
  itemBuilder: (context, index) => UserTile(user: state.users[index]),);
  } else if (state is UserError) {
          return Center(child: Text(state.message));
  }
        return const SizedBox();
  },
      ),
    );
  }
}