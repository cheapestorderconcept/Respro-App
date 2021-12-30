import 'package:flutter/material.dart';

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
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(120)),
              color: Colors.yellow,
              //image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gettyimages.com%2Fphotos%2Fall-the-fine-boys&psig=AOvVaw1dK9ztga7O1tG1RvUQG02O&ust=1640953093929000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNjxi-TAi_UCFQAAAAAdAAAAABAD'),
              
              ),
                  
          ),

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
                Container(
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

              Container(
                    
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
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


                Container(
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
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 40,
                    ),
              ),

              Container(
                    
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
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

                Container(
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
                    Icons.location_on,
                    color: Colors.black,
                    size: 40,
                    ),
              ),

              Container(
                    
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
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

                Container(
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
                    Icons.privacy_tip_rounded,
                    color: Colors.black,
                    size: 40,
                    ),
              ),

              Container(
                    
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
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
                
                Container(
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
                    Icons.settings_sharp,
                    color: Colors.black,
                    size: 40,
                    ),
              ),

              Container(
                    
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
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

          Container(

            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                
                children: [
                  Container(
                      child: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                    size: 40,
                    ),


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
