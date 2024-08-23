import 'package:flutter/material.dart';
import 'package:property_app/Details_Screen/Detail_UI.dart';
import 'package:property_app/models/personModel.dart';

class Home_UI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeui();
}

class _homeui extends State<Home_UI> {
  TextEditingController _search = TextEditingController();
  final _width=double.infinity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('Assets/profileImage/mr.jpg',
                      width: 25, height: 25, fit: BoxFit.cover)),
              const SizedBox(width: 10),
              const Text(
                'Hi Stephen',
                style: TextStyle(
                    color: Colors.black87, fontSize: 16, fontFamily: 'Sign'),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.notifications,
              color: Colors.black87,
            ),
            SizedBox(width: 10),
            Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            SizedBox(width: 10)
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Discover \nYour new Home!',
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Hund',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      color: Colors.black87,
                    ),
                    hintText: 'Search Here',
                    suffixIcon: const Icon(
                      Icons.house,
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                card(text: 'House', isActive: true),
                card(text: 'Apartment', isActive: false),
                card(text: 'Office', isActive: false),
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  viewCard(photo: 'Assets/images/p1.jpg',name:'Park Venue',location: 'Los Angeles'),
                  const SizedBox(width: 10),
                  viewCard(photo: 'Assets/images/p2.jpg',name:'Max House',location: 'California'),
                  const SizedBox(width: 10),
                  viewCard(photo: 'Assets/images/p3.jpg',name:'Garden Bage',location: 'Florida'),
                  const SizedBox(width: 10),
                  viewCard(photo: 'Assets/images/p4.jpg',name:'Master Class',location: 'Torrento'),


                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text('property NearBy',style: TextStyle(color: Colors.black87,fontFamily: 'Hund',fontSize: 28),),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  nearByCard(photo: 'Assets/images/p2.jpg',name:'Janeva',location:'Switzeland',istrue: true),
                  const SizedBox(width: 10),
                  nearByCard(photo: 'Assets/images/p6.jpg',name:'Maria',location:'London',istrue: false),
                  const SizedBox(width: 10),
                  nearByCard(photo: 'Assets/images/p3.jpg',name:'Yoko',location:'Japan',istrue: false),
                ],
              ),
            )
          ],
        ),
      ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width:_width-100,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => detai_Screen()));
                  }, icon:const Icon(Icons.house,color: Colors.white,size: 30)),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.category,color: Colors.white,size:30)),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.settings,color: Colors.white,size:30)),
                ],
              ),
            ),
          )
    ));
  }
}

// type of property
Widget card({required text, isActive}) {
  Color col = Colors.white;
  Color txtC = Colors.black87;
  if (isActive) {
    col = Colors.black87;
    txtC = Colors.white;
  }
  return Container(
    width: 80,
    height: 40,
    decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: txtC, width: 1)),
    child: Center(
      child: Text(text, style: TextStyle(color: txtC)),
    ),
  );
}

// card of Show properties

Widget viewCard({photo, name, location}) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(photo,
            fit: BoxFit.cover, width: 180, height: 210),
      ),
      Positioned(
        bottom: 1,
          left: 22,
          child: Column(
        children:  [
          Text(name,style:const TextStyle(color: Colors.white,fontSize: 26,fontWeight:FontWeight.w700),),
          Text(location,style:const TextStyle(color: Colors.white,fontSize: 18)),

  ]
  )
  )
  ]
  );
}

Widget nearByCard({photo,name,location,istrue}){
  return Container(
    width: 200,
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(photo,width: 80,height: 90)
        ),
        Text(" $name \n $location}",style:const TextStyle(color: Colors.black87),),
        const SizedBox(width: 10),
        Icon(istrue?Icons.favorite:Icons.favorite_border,color: Colors.black87,)

      ],
    ),
  );
}