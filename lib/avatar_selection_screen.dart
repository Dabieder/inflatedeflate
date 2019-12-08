import 'package:flutter/material.dart';
import 'package:inflatedeflate/breathing_screen.dart';

class AvatarSelectionScreen extends StatefulWidget {
  AvatarSelectionScreen({Key key}) : super(key: key);

  @override
  _AvatarSelectionScreenState createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  buildAvatarSelectionTile(String avatarName) {
    return Card(
      elevation: 5.0,
      color: Colors.orange[900],
      child: Container(
        width: 90,
        height: 90,
        // margin: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            onAvatarTap(avatarName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (avatarName.isEmpty)
                Text(
                  "?",
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
              if (avatarName.isNotEmpty)
                Image.asset(
                  'assets/$avatarName/0001.png',
                  width: 64,
                  height: 64,
                ),
              Text(
                avatarName,
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  onAvatarTap(String avatarName) {
    if (avatarName.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BreathingScreen(
                    avatarName: avatarName,
                  )));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("Noch nicht freigeschaltet"),
                content: Text(
                    "Du brauchst noch 100 Punkte um deine Übungen mit diesem Begleiter durchführen zu können"),
                actions: [
                  FlatButton(
                    child: Text("Schließen"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar auswählen"),
      ),
      body: Container(
        child: Wrap(
          children: <Widget>[
            buildAvatarSelectionTile("pig"),
            buildAvatarSelectionTile("elephant"),
            buildAvatarSelectionTile(""),
            buildAvatarSelectionTile(""),
            buildAvatarSelectionTile(""),
            buildAvatarSelectionTile(""),
            buildAvatarSelectionTile(""),
            buildAvatarSelectionTile(""),
          ],
        ),
      ),
    );
  }
}
