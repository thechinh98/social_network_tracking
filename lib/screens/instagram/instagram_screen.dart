import 'package:flutter/material.dart';

class InstagramLoginScreen extends StatefulWidget {
  const InstagramLoginScreen({Key? key}) : super(key: key);

  @override
  _InstagramLoginScreenState createState() => _InstagramLoginScreenState();
}

class _InstagramLoginScreenState extends State<InstagramLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 60.0),
         child: InkWell(
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             decoration: BoxDecoration(
               border: Border.all(color: Colors.black,width: 1)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 Image.asset(
                   'assets/instagram.png',
                   height: 50.0,
                   fit: BoxFit.cover,
                 ),
                 const Text('Continue with Instagram')
               ],
             ),
           ),
           onTap: (){},
         ),
       ),
     );
  }
}
