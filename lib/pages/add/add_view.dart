library add_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import '../home/home_view_model.dart';

part 'add.dart';

class AddView extends StatefulWidget {
  AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();

    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModelBuilder: () => viewModel, // Take note here
      disposeViewModel: false, // Take note here
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return AddPage(viewModel);
      },
    );
  }
}
