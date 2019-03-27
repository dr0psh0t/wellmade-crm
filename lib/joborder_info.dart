import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'key_value.dart';
import 'package:photo_view/photo_view.dart';
//import 'photo_widget.dart';

class JoborderInfoWidget extends StatelessWidget {
  List<KeyValue> joborders = new List();

  String joNo;
  String imgSrc;
  String model;
  String make;
  String category;
  String serial;
  String csa;

  JoborderInfoWidget(
    String joNo,
    String imgSrc,
    String model,
    String make,
    String category,
    String serial,
    String csa
  ) {
    this.joNo =joNo;
    this.imgSrc =imgSrc;
    this.model =model;
    this.make =make;
    this.category =category;
    this.serial =serial;
    this.csa =csa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joborder Info'),
      ),
      body: Container(
        padding: EdgeInsets.all(7.0),
        child: Card(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.format_list_numbered),
                title: Text('JO Number'),
                subtitle: Text(joNo),
              ),
              ListTile(
                leading: Icon(Icons.devices),
                title: Text('Model'),
                subtitle: Text(model),
              ),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Text('Make'),
                subtitle: Text(make),
              ),
              ListTile(
                leading: Icon(Icons.developer_mode),
                title: Text('Category'),
                subtitle: Text(category),
              ),
              ListTile(
                leading: Icon(Icons.replay),
                title: Text('Serial'),
                subtitle: Text(serial),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('CSA'),
                subtitle: Text(csa),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date Received'),
                subtitle: Text('2019-3-26'),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date Committed'),
                subtitle: Text('2019-3-26'),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date Prepared'),
                subtitle: Text('2019-3-26'),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('View Image'),
                onTap: () {
                  _onTapImage(BuildContext context) {
                    return Stack(
                      children: <Widget>[
                        Center(
                          child: PhotoView(
                            imageProvider: NetworkImage(imgSrc),
                          ),
                        ),
                      ],
                    );
                  }
                  showDialog(
                    context: context, 
                    builder: (context) => _onTapImage(context)
                  ); 
                },
              ),
            ],
          ),

        ),
      ),
    );
  }

  Widget imageCard(BuildContext context) {
    return RaisedButton(
      child: const Text(
        'View Image',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blue,
      onPressed: () {

      },
    );
  }
}