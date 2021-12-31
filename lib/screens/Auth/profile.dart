import 'package:flutter/material.dart';
import 'package:resmart/screens/Auth/change_password.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

         backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        
        leading: GestureDetector(
            onTap: () { },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,
                    )
                  ),
                child: Icon(
                Icons.chevron_left_outlined,
                color: Colors.black,
                size: 25,
                ),
              ),
            ),
          ),
        actions: <Widget>[
           Padding(
             padding: EdgeInsets.all(20),
             child: GestureDetector(
             onTap: (){},
             child: Icon(
             Icons.more_horiz,
             size: 25,
             color: Colors.black,
             ),
          ),
         ),
        ],
      ),
      body: Column(
        
        children: <Widget>[

          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                
                children: [
                  Text(
                    'Komolafe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                         ),
                    ),

                    Text(
                      'Lorem Ipsum dollor sit ametLorem Ipsum dolor sit amet',
                      style: TextStyle(
                        fontSize: 20
                      ),
                      
                      ),
                ],
              ),

                    
            ),
          ),

          Container(
            child: Column(
              children: <Widget>[
           InkWell(
                  onTap: () {
                   ;
                  },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 40,
                      ),
                            ),
                
                   Text(
                        'Wishlist',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                    ),
                        
                      ],
                    ),
                  ),
                ),


               InkWell(
                  onTap: () {
                    
                  },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                            ),
                
                   Text(
                        'Notification',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                    ),
                        
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                   
                  },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                            ),
                
                   Text(
                        'Location',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                    ),
                        
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    
                  },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.privacy_tip_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                            ),
                
                   Text(
                        'Privacy',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                    ),
                        
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, change_password_page.change_passwordRoute);
                  },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                            ),
                
                   Text(
                        'Settings',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                        )
                      ),
                      child: Icon(
                      Icons.chevron_right_outlined,
                      color: Colors.black,
                      size: 40,
                      ),
                    ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            )
          ),

          SizedBox(
            height: 90,
          ),

          InkWell(
            onTap: (){},
            splashColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10,10,0,0),
              child: Row(
                
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                    size: 40,
                    ),
          
              SizedBox(
                width: 20,
              ),
          
              Container(
                    
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
              ),
                  
                ],
              ),
              
              ),
          ),

      ],
      ),
    );
  }
}
