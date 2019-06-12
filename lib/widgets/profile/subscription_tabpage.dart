import 'package:flutter/material.dart';

class SubscriptionTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/temp$index.jpg'),
                ),
                title: Text('John Doe $index',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Wednessday 22, May 2019'),
                trailing: Material(
                  elevation: 5.0,
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  child: InkWell(
                    onTap: () {
                      print('Unsubscribe');
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        'Unsubscribe',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dolor purus, isaculis ac dolor nec, laoreet imperdiet eros.',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.info_outline,
                    size: 32.0,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    print('More information on $index');
                  },
                ),
              ),
            ],
          ),
        );
      }, childCount: 10),
    );
  }
}