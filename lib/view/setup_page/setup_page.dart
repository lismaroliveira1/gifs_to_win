import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:gifs_to_win/presenter/presenter.dart';

import '../view.dart';

class SetupPage extends StatelessWidget {
  final GetXSetupPresenter presenter;
  SetupPage({@required this.presenter});
  @override
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  Widget build(BuildContext context) {
    return buildCustomDrawer(
      key: _innerDrawerKey,
      scaffold: Scaffold(
        body: Container(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              _innerDrawerKey.currentState
                  .toggle(direction: InnerDrawerDirection.start);
            },
          ),
        ),
      ),
    );
  }
}
