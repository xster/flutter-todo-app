import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  final bool isExpanded;
  final String title;
  final bool done;
  final String description;
  TodoListItem(
      {this.title, this.description, this.done, this.isExpanded: false, key})
      : super(key: key);

  @override
  _TodoListItemState createState() {
    return new _TodoListItemState(done, isExpanded);
  }
}

class _TodoListItemState extends State<TodoListItem> {
  bool _isExpanded;
  bool _done;

  _TodoListItemState(this._done, this._isExpanded);

  TextStyle getTitleStyle() => new TextStyle(
        color: _done ? Colors.grey[500] : Colors.black,
        fontFamily: "Rubik",
        fontSize: 18.0,
        decoration: _done ? TextDecoration.lineThrough : TextDecoration.none,
        decorationColor: Colors.grey[500],
      );

  IconButton getLeadingIcon() => new IconButton(
        icon: new Icon(
          _done ? Icons.check_circle : Icons.radio_button_unchecked,
          color: Colors.amber[500],
        ),
        onPressed: toggleDone,
      );

  void toggleDone() {
    setState(() {
      _done = !_done;
    });
  }

  void toggleExpandedIcon(bool isExpanded) {
    setState(() {
      _isExpanded = !isExpanded;
    });
  }

  Widget buildCollapsed() => new ListItem(
        leading: getLeadingIcon(),
        title: new Text(config.title, style: getTitleStyle()),
        trailing: new ExpandIcon(
          isExpanded: false,
          onPressed: this.toggleExpandedIcon,
          padding: const EdgeInsets.all(0.0),
        ),
      );

  Widget buildExpanded(BuildContext context) => new Container(
        decoration: new BoxDecoration(
          backgroundColor: Colors.white,
          border: new Border(
            top: new BorderSide(color: Theme.of(context).dividerColor),
            bottom: new BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(config.title, style: getTitleStyle()),
                  new ExpandIcon(
                    isExpanded: true,
                    onPressed: this.toggleExpandedIcon,
                    padding: const EdgeInsets.all(0.0),
                  ),
                ],
              ),
              new Container(height: 16.0),
              new Text(
                config.description,
                style: new TextStyle(fontFamily: 'Rubik'),
              ),
              new Container(height: 16.0),
              new Row(
                children: [
                  new Icon(Icons.calendar_today),
                  new Container(width: 8.0),
                  new Text("Today",
                      style:
                          new TextStyle(fontFamily: 'Rubik', fontSize: 18.0)),
                ],
              ),
            ]),
      );

  @override
  Widget build(BuildContext context) {
    return _isExpanded ? buildExpanded(context) : buildCollapsed();
  }
}
