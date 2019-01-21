import 'package:flutter/material.dart';
import './users_edit_page.dart';
import './users_list_page.dart';
import '../scoped_models/users_model.dart';

import '../widgets/helpers/app_side_drawer.dart';

class UsersAdminPage extends StatelessWidget {

  final UsersModel usersModel;

  UsersAdminPage(this.usersModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            title: Text('Manage Users'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.list),
                  text: 'Registered Users',
                ),
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create User',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              UsersListPage(usersModel),
              UsersEditPage(),
            ],
          ),
        ));
  }
}
