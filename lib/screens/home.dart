import 'package:flutter/material.dart';





class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        // ++++++++++++++++++++++++++++++++ navbar of application +++++++++++++++++++++++++++++++++++++++++++++
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          iconTheme:const IconThemeData(
            color: Colors.blue,
          ),
          elevation: 0.4,
          title: Image.asset(
            'assets/Shopclues_logo.jpg',
            scale: 1,
          ),

          
          
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notification_add_outlined,
                  size: 26.0,
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/cart");
                },
                child:const Icon(
                    Icons.shopping_cart_outlined
                ),
              )
            ),
          ],
          
        ),


      //  +++++++++++++++++++++++++++++++++++++++++++++ body +++++++++++++++++++++++++++++++++++++++++++++++++

      body: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 3
          )
        ),  
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        
          children:List.generate(10, (index){
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: GestureDetector(
                onTap: (){
                  print(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                      "assets/product/mobileglass.jpeg",
                      height: 100,
                    ),
                    ),
                    

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                      children: [
                        Text(
                            "Alvera",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100
                            ),
                          ),
                        Text(
                            "300\$",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),

                      ],
                      
                    ),
                    )
                    
                  ],
                ),
              ),
            );
          }),
        )
      ),
        // ++++++++++++++++++++++++++++++++ drawer of application +++++++++++++++++++++++++++++++++++++++++++++
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:const  BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    radius: 35,
                    child: Text(
                      "R",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Riyaz Ahmad",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Wrap(
                        children: [
                          Text(
                            "riyazik0709@gmail.com",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text(
                'Profile' ,
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pushNamed(context, "/profile");
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: const Text(
                'Login',
              style: TextStyle(
                  fontSize: 18
                ),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.pushNamed(context, '/login');  
                
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text(
                'Logout',
              style: TextStyle(
                  fontSize: 18
                ),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.of(context).popAndPushNamed("/login");
              },
            ),
          ],
        ),
      ),

        // ++++++++++++++++++++++++++++++++++++ bottom navbar ++++++++++++++++++++++++++++++++++++++++++++++++++


        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
      ),
    );
  }
}