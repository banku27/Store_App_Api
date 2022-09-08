import 'package:flutter/material.dart';
import 'package:store_api_app/widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Users',
            ),
          ),
          body: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const UserWidget();
              })),
    );
  }
}
