import 'package:flutter/material.dart';

class JoInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
    
      body: Column(
        children: <Widget>[
          headerCard(context, 2, 'Roadstar', 'WMDC'),
          
          infoCard(context, 2, 'Joborder', '12345'),
          infoCard(context, 2, 'Date Start', '2019-02-23'),
          infoCard(context, 2, 'Date Target', '2019-02-23'),
          infoCard(context, 2, 'Status', 'Completed'),

          surveyRatingCard(context),
        ],
      ),
    );
  }
}

Widget divider() {
  return Divider(
    color: Colors.black38,
  );
}

Widget headerCard(BuildContext context, int index, String key, String value) {

  return ListTile(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 50.0,
      vertical: 50.0,
    ),

    leading: Container(
      alignment: Alignment.center,

      child: Column(
        children: <Widget>[

          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://www.globalgiving.org/pfil/organ/45300/orglogo.jpg'
                ),
              )
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),

          Text(
            key,
            style:TextStyle(
              color: Colors.black54,
              fontSize: 22.0,
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ),

        ],
      ),

    ),
  );

  /*
  return Card(
    elevation: 8.0,

    margin: EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 15.0,
    ),

    child: ListTile(

      contentPadding: EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 50.0,
      ),

      leading: Container(
        alignment: Alignment.center,

        child: Column(
          children: <Widget>[

            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://www.globalgiving.org/pfil/organ/45300/orglogo.jpg'
                  ),
                )
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),

            Text(
              key,
              style:TextStyle(
                color: Colors.black54,
                fontSize: 22.0,
              ),
            ),

            Text(
              value,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.0,
              ),
            ),

          ],
        ),

      ),

    ),
  );*/
}

Widget surveyRatingCard(BuildContext context) {

  /*
  return Card(
    elevation: 8.0,
    margin: EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 3.0,
    ),

    child: ListTile(
      title: Center(
        child: Text(
          'Survey/Rating',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
        ),
      ),
    ),

  );*/

  return RaisedButton(
    child: const Text(
      'Survey/Rating',
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

Widget infoCard(BuildContext context, int index, String key, String value) {

  return ListTile(
    title: Text(
      key,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.blue,
      ),
    ),
    subtitle: Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    ),
  );

  /*
  return Card(
    elevation: 8.0,

    margin: EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 3.0,
    ),

    child: ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),

      title: Text(
        key,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
        ),
      ),

      subtitle: Text(
        value,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14.0,
        ),
      ),

    ),

  );
  */
}