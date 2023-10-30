import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_app_test/features/currency/presentation/bloc/user_bloc.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({Key? key}) : super(key: key);

  void _refreshArticleList(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(const GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _refreshArticleList(context);
      },
      child: const Center(child: Icon(Icons.refresh)),
    );
  }
}