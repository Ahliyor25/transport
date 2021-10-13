import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport/ui/theme/app_colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green,
                          blurRadius: 3.0,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Icon(Icons.map, color: Colors.white),
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue,
                          blurRadius: 3.0,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Icon(Icons.star, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.orange,
                          blurRadius: 3.0,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Text(
                    "Show Ticket",
                    style: Theme.of(context).textTheme.button,
                    // .apply(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
