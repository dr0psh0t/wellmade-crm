import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joborders'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.all(1.0),
          itemBuilder: getJoCard,
        ),
      ),
    );
  }
}

Widget getJoCard(BuildContext context, int index) {
  return new Container(
    child: new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(
                  '12345',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage('https://images.rallysportdirect.com/image/private/s--BTSophVj--/f_auto,t_auto_rsd_product/v1436916986/product_images/sub_12200aa430_1'),
                //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/BMW_S65_Engine_Model.JPG/220px-BMW_S65_Engine_Model.JPG'),
                //image: NetworkImage('https://clubrunner.blob.core.windows.net/00000050176/Images/Rotary-at-Work-Day-3(1).png'),
                //image: NetworkImage('https://clubrunner.blob.core.windows.net/00000050143/Images/Are-you-using-the-right-Rotary-logo-.png'),
              ),
            ),
          ),

          //  message & emails
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    child: ButtonTheme.bar(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Icon(Icons.message),
                            onPressed: () {
                              
                            },
                          ),
                        ],
                      ),
                    ),

                  ),
                  onPressed: () {},
                ),
              ),

              Container(
                height: 40.0,
                width: 2.0,
                color: Colors.blue,
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              ),

              Expanded(
                child: FlatButton(
                  color: Colors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    child: ButtonTheme.bar(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center, 
                        children: <Widget>[
                          FlatButton(
                            child: Icon(Icons.email),
                            onPressed: () {
                              
                            },
                          ),
                        ],
                      ),
                    ),

                  ),
                  onPressed: () {},
                ),
              ),

            ],
          ),

        ],
      ),
    ),
  );
}