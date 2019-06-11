import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SuggestedPosts extends StatefulWidget {
  final bool isExpandedMode;
  final Function(bool) onExpandSuggestedPostsToggle;

  const SuggestedPosts(
      {Key key,
      this.isExpandedMode,
      @required this.onExpandSuggestedPostsToggle})
      : super(key: key);

  @override
  _SuggestedPostsState createState() => _SuggestedPostsState();
}

class _SuggestedPostsState extends State<SuggestedPosts> {
  bool _isExpandedMode;

  Function(bool) get _onExpandSuggestedPostsToggle =>
      widget.onExpandSuggestedPostsToggle;

  @override
  void initState() {
    _isExpandedMode = widget.isExpandedMode;
    super.initState();
  }

  void _toggleSuggestedPostsView() {
    setState(() {
      _isExpandedMode = !_isExpandedMode;
      _onExpandSuggestedPostsToggle(_isExpandedMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildSuggestedPostsTitleRow(context: context),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      final int postIndex = index == 0 ? 9 : index;

                      return PostItemCardSmall(postIndex: postIndex);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestedPostsTitleRow({@required BuildContext context}) {
    return Row(
      children: <Widget>[
        Text(
          'Suggested',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Material(
          elevation: 5.0,
          color: Colors.black38,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                      _isExpandedMode
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      size: 40.0,
                      color: Theme.of(context).accentColor),
                  onPressed: _toggleSuggestedPostsView,
                ),
                Container(
                  height: 30.0,
                  width: 2.0,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    // size: 30.0,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    print('favorite clicked');
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.0),
      ],
    );
  }
}
