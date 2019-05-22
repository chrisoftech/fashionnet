import 'package:flutter/material.dart';

class CategoryNavBar extends StatefulWidget {
  final Function(String) onActiveCategoryChange;

  const CategoryNavBar({Key key, @required this.onActiveCategoryChange})
      : super(key: key);

  @override
  _CategoryNavBarState createState() => _CategoryNavBarState();
}

class _CategoryNavBarState extends State<CategoryNavBar> {
  String _activeCategoryId;

  @override
  void initState() {
    _activeCategoryId = '0';
    super.initState();
  }

  Function(String) get _onActiveCategoryChange => widget.onActiveCategoryChange;

  List<String> _categories = <String>[
    'Latest',
    'Wears',
    'Shoes',
    'Jeweries',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final String categoryTitle = _categories[index];

          return _buildCategoryItem(
              categoryIndex: index,
              categoryId: index.toString(),
              categoryTitle: categoryTitle);
        },
      ),
    );
  }

  double _getItemSize({@required String categoryId}) {
    return categoryId == _activeCategoryId ? 22.0 : 20.0;
  }

  Color _getItemColor({@required String categoryId}) {
    return categoryId == _activeCategoryId ? Colors.black54 : Colors.grey[300];
  }

  Widget _buildCategoryItem(
      {@required int categoryIndex,
      @required String categoryId,
      @required String categoryTitle}) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _spacerWidth =
        _deviceWidth / (double.parse((_categories.length * 2).toString()));

    return Row(
      children: <Widget>[
        categoryIndex == 0 ? SizedBox(width: 20.0) : Container(),
        InkWell(
          onTap: () {
            if (_activeCategoryId != categoryId) {
              setState(() {
                _activeCategoryId = categoryId;
                _onActiveCategoryChange(categoryId);
              });
            }
          },
          child: Column(
            children: <Widget>[
              Text(
                '$categoryTitle',
                style: TextStyle(
                    color: _getItemColor(categoryId: categoryId),
                    fontSize: _getItemSize(categoryId: categoryId),
                    fontWeight: FontWeight.bold),
              ),
              Visibility(
                visible: _activeCategoryId == categoryId,
                child: Container(
                  height: 5.0,
                  width: _spacerWidth,
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )),
                ),
              )
            ],
          ),
        ),
        SizedBox(width: _spacerWidth)
      ],
    );
  }
}
