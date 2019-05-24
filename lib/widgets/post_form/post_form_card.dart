import 'package:flutter/material.dart';

class PostFormCard extends StatefulWidget {
  const PostFormCard({
    Key key,
    @required this.context,
    @required this.deviceHeight,
    @required this.deviceWidth,
  }) : super(key: key);

  final BuildContext context;
  final double deviceHeight;
  final double deviceWidth;

  @override
  _PostFormCardState createState() => _PostFormCardState();
}

class _PostFormCardState extends State<PostFormCard> {
  final _availabilityController = TextEditingController();
  final List<int> _selectedCategories = [];

  bool isItemAvailable = false;

  @override
  Widget build(BuildContext context) {
    final double _formContainerWidth =
        widget.deviceWidth > 550.0 ? 550.0 : widget.deviceWidth;

    final double _formContainerPaddingValue =
        (widget.deviceWidth > _formContainerWidth)
            ? (widget.deviceWidth - _formContainerWidth)
            : 0.0;

    return Padding(
      padding: EdgeInsets.only(top: 220.0),
      child: Material(
        elevation: 8.0,
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: _formContainerPaddingValue / 2),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          _buildSectionLabel(sectionTitle: 'Details Section'),
                          _buildTitleTextFormField(),
                          _buildDescriptionTextFormField(),
                          _buildPriceTextFormField(),
                          _buildAvailabilityFormField(),
                          _buildSectionLabel(sectionTitle: 'Category Section'),
                          _buildCategoryList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel({@required sectionTitle, bool addDivider = true}) {
    return Column(
      children: <Widget>[
        addDivider ? Divider(color: Colors.black54, height: 0.0) : Container(),
        Material(
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              '$sectionTitle',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildTitleTextFormField() {
    return Column(
      children: <Widget>[
        TextFormField(
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              labelText: 'Title', hintText: 'Post Title', filled: true),
        ),
      ],
    );
  }

  Widget _buildDescriptionTextFormField() {
    return Column(
      children: <Widget>[
        TextFormField(
          maxLines: 2,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Enter description',
              filled: true),
        ),
      ],
    );
  }

  Widget _buildPriceTextFormField() {
    return Column(
      children: <Widget>[
        TextFormField(
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              labelText: 'Price', hintText: 'Enter price', filled: true),
        ),
      ],
    );
  }

  Widget _buildAvailabilityFormField() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 12.0),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isItemAvailable = !isItemAvailable;
                    _availabilityController.text =
                        isItemAvailable ? 'YES' : 'NO';
                  });
                },
                child: IgnorePointer(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20.0),
                    controller: _availabilityController,
                    decoration: InputDecoration(
                        labelText: 'Is this item available?',
                        hintText: 'Item availability',
                        filled: false),
                  ),
                ),
              ),
            ),
            Switch(
              value: isItemAvailable,
              onChanged: (bool value) {
                setState(() {
                  isItemAvailable = value;
                  _availabilityController.text = value ? 'YES' : 'NO';
                });
              },
            ),
          ],
        ),
        Divider(color: Colors.black, height: 0.0),
      ],
    );
  }

  Widget _buildCategorySynopsis({@required int categoryIndex}) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'John Doe $categoryIndex',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            elevation: 10.0,
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedCategories.contains(index)
                      ? _selectedCategories.removeWhere((int item) {
                          return item == index;
                        })
                      : _selectedCategories.add(index);
                });
                print(_selectedCategories.length);
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/temp$index.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _buildCategorySynopsis(categoryIndex: index),
                  !_selectedCategories.contains(index)
                      ? Container()
                      : Positioned(
                          top: 10.0,
                          left: 15.0,
                          child: Container(
                            height: 80.0,
                            width: 90.0,
                            color: Colors.black38,
                            child: Center(
                              child: Icon(
                                Icons.check,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
