import 'package:flutter/material.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _availabilityController = TextEditingController();

  final List<int> _selectedCategories = [];
  bool isItemAvailable = false;

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _formContainerWidth =
        _deviceWidth > 550.0 ? 550.0 : _deviceWidth;

    final double _formContainerPaddingValue =
        (_deviceWidth > _formContainerWidth)
            ? (_deviceWidth - _formContainerWidth)
            : 0.0;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 350.0,
          pinned: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black87,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: _buildFlexibleSpaceBackground(),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Material(
              child: Container(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera_alt, size: 20.0),
                            SizedBox(width: 5.0),
                            Text('Camera')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.image, size: 20.0),
                            SizedBox(width: 5.0),
                            Text('Gallery')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: _formContainerPaddingValue / 2),
              child: Column(
                children: <Widget>[
                  _buildSectionLabel(
                      sectionTitle: 'Details Section',
                      sectionDetails: 'Enter post details'),
                  _buildTitleTextFormField(),
                  _buildDescriptionTextFormField(),
                  _buildPriceTextFormField(),
                  _buildIsProductAvailableFormField(),
                  _buildSectionLabel(
                      sectionTitle: 'Category Section',
                      sectionDetails:
                          'You can select up to 4 categories for a post'),
                  _buildCategoryList(),
                  // SizedBox(height: 70.0),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _buildFlexibleSpaceBackground() {
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: <Widget>[
          Material(
            elevation: 5.0,
            child: Container(
              height: 150.0,
              width: _deviceWidth,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle),
                    child: Icon(Icons.camera_alt,
                        size: 30.0, color: Colors.white70),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Add photo(s)',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'You can take or choose up to 5 images.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.0,
            width: _deviceWidth,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black54),
            child: InkWell(
              // radius: 50.0,
              borderRadius: BorderRadius.circular(50.0),
              onTap: () {
                print('Add Images clicked!');
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 70.0,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(
      {@required sectionTitle, @required sectionDetails}) {
    return Column(
      children: <Widget>[
        // addDivider ? Divider(color: Colors.black54, height: 0.0) : Container(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 10.0),
            Text('$sectionDetails'),
          ],
        ),
        // Divider(color: Colors.black54, height: 0.0)
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

  Widget _buildIsProductAvailableFormField() {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              isItemAvailable = !isItemAvailable;
              _availabilityController.text = isItemAvailable ? 'YES' : 'NO';
            });
          },
          child: IgnorePointer(
            child: TextFormField(
              style: TextStyle(fontSize: 20.0),
              controller: _availabilityController,
              decoration: InputDecoration(
                  labelText: 'Is this item available?',
                  hintText: 'Item availability',
                  filled: true),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Switch(
            value: isItemAvailable,
            onChanged: (bool value) {
              setState(() {
                isItemAvailable = value;
                _availabilityController.text = value ? 'YES' : 'NO';
              });
            },
          ),
        ),
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
