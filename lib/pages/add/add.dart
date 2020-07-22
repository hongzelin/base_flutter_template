part of add_view;

class AddPage extends StatefulWidget {
  final HomeViewModel model;
  AddPage(this.model, {Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState(this.model);
}

class _AddPageState extends State<AddPage> {
  final HomeViewModel model;
  _AddPageState(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('${this.model.list.length}'),
        ],
      ),
    );
  }
}
