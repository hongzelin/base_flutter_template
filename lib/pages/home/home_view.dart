/*
 * Author: lin.zehong 
 * Date: 2020-07-22 17:41:03 
 * Desc: home view，注入 viewmodel
 */
import 'package:base_flutter_template/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import './home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        return HomePage(viewModel);
      },
    );
  }
}
