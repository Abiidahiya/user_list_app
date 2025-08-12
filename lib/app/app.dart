import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list_app/app/routes.dart';
import 'package:user_list_app/features/users/data/repositories/user_repository.dart';
import 'package:user_list_app/features/users/logic/bloc/user_event.dart';

import '../features/users/logic/bloc/user_bloc.dart';
import '../features/users/presentation/pages/user_detail_page.dart';
import '../features/users/presentation/pages/user_list_page.dart';

class MyApp extends StatelessWidget{
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.UserList,
      routes: { Routes.UserList: (context) =>
          BlocProvider(create: (_) =>
          UserBloc(userRepository)
            ..add(FetchUsers()),
            child: const UserListPage(),
          ),
        Routes.UserDetail: (context) => const UserDetailPage(),
      },
    );
  }


  }
