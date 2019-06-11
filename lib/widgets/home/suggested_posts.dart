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
                  child: Row(
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
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        child: InkWell(
                          onTap: _toggleSuggestedPostsView,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                // color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0))),
                            child: Row(
                              children: <Widget>[
                                Text(
                                    _isExpandedMode ? 'Show Less' : 'Show More',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Icon(
                                    _isExpandedMode
                                        ? Icons.arrow_drop_down
                                        : Icons.arrow_drop_up,
                                    size: 30.0,
                                    color: Theme.of(context).accentColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
}
