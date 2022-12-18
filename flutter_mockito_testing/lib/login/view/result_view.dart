import 'package:flutter/material.dart';

import '../model/login_model.dart';

class ResultView extends StatelessWidget {
  final LoginModel model;
  ResultView({required this.model});
  final _appBarText = 'Successful';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: _buildResultAppBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: _buildResultColumn(),
      ),
    ));
  }

  AppBar _buildResultAppBar() => AppBar(title: _buildAppBarText());

  Text _buildAppBarText() => Text(_appBarText);

  Column _buildResultColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(model.firstName ?? "", style: TextStyle(fontSize: 22)),
        Text(model.lastName ?? "", style: TextStyle(fontSize: 22)),
        Text(model.email ?? "", style: TextStyle(fontSize: 22)),
        Text(model.password ?? "", style: TextStyle(fontSize: 22)),
      ],
    );
  }
}
