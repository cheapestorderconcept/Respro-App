import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/profile.dart';
import 'package:resmart/widgets/forms.dart';


class change_password_page extends StatefulWidget {
  const change_password_page({ Key? key }) : super(key: key);

  static String change_passwordRoute = '/change_password';

  @override
  _change_password_pageState createState() => _change_password_pageState();
}

class _change_password_pageState extends State<change_password_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,

        title: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10,20,10,10),
            child: Text(
                   'Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      
                      ),
              
              ),
          ),
        ),
        
        leading: GestureDetector(
            onTap: () { },
            child: Padding(
              padding:  EdgeInsets.fromLTRB(10,20,10,10),
              child: Icon(
              Icons.chevron_left_outlined,
              color: Colors.black,
              size: 30,
              ),
            ),
          ),
        actions: <Widget>[
           Padding(
             padding: EdgeInsets.fromLTRB(10,20,10,10),
             child: GestureDetector(
             child: Icon(
             Icons.settings_sharp,
             size: 30,
             color: Colors.black,
             ),
          ),
         ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'User Settings',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                   ),
                
                ),
            ),
            Container(
             width: 120,
             height: 5,
             color: Colors.black,
           ),

          

           Padding(
             padding: const EdgeInsets.fromLTRB(0,20,20,20),
             child: Column(
               
               children: <Widget>[
                 InkWell(
                   onTap: (){},
                   splashColor: Colors.grey,
                   child: Row(
                     children: <Widget>[
                            
                         CircleAvatar(
                            
                           backgroundColor: Colors.grey.shade200,
                            child: Icon(
                             Icons.phone,
                             color: Colors.black,
                             size: 30,
                           ),
                            
                         ),
                         Text(
                           '       Change Phone number',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                             ),
                         ),
                            
                            
                     ],
                   ),
                 ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){},
                    splashColor: Colors.grey,
                    child: Row(
                     children: <Widget>[
                             
                         CircleAvatar(
                             
                           backgroundColor: Colors.grey.shade200,
                            child: Icon(
                             Icons.lock_outline,
                             color: Colors.black,
                             size: 30,
                           ),
                             
                         ),
                         Text(
                           '       Change Password',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                             ),
                         ),
                             
                             
                     ],
                                   ),
                  ),
           
                     SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){},
                    splashColor: Colors.grey,
                    child: Row(
                     children: <Widget>[
                             
                         CircleAvatar(
                             
                           backgroundColor: Colors.grey.shade200,
                            child: Icon(
                             Icons.email_outlined,
                             color: Colors.black,
                             size: 30,
                           ),
                             
                         ),
                         Text(
                           '       verify Email',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                             ),
                         ),
                             
                             
                     ],
                                   ),
                  ),
           
                 SizedBox(
                   height: 100,
                   child: Divider(height: 10,
                   color: Colors.black,
                   ),
           
                 ),
           
           
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){},
                    splashColor: Colors.grey,
                    child: Row(
                     children: <Widget>[
                             
                         CircleAvatar(
                             
                           backgroundColor: Colors.grey.shade200,
                            child: Icon(
                             Icons.person_outline,
                             color: Colors.black,
                             size: 30,
                           ),
                             
                         ),
                         Text(
                           '       Contact us',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                             ),
                         ),
                             
                             
                     ],
                                   ),
                  ),
           
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){},
                    splashColor: Colors.grey,
                    child: Row(
                     children: <Widget>[
                             
                         CircleAvatar(
                             
                           backgroundColor: Colors.grey.shade200,
                            child: Icon(
                             Icons.contact_page,
                             color: Colors.black,
                             size: 30,
                           ),
                             
                         ),
                         Text(
                           '       Terms of Use',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 25,
                             ),
                         ),
                             
                             
                     ],
                                   ),
                  ),
                 
           
               ],
           
             ),
           
             
           ),


           Padding(
             padding: EdgeInsets.fromLTRB(19, 80, 0, 0),
             child: Text(
               'Exit',
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                 ),
             ),
           ),
           

         
          ],
        ),
      ),
    );
  }
}