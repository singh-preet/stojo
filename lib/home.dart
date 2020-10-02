import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stojo/data.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25,25,25,0),
                child: Row(
                  children: [
                    Image.asset('assets/menuicon.png', height: 25,),
                    Expanded(child: Container(),),
                    FaIcon(FontAwesomeIcons.search),
                    SizedBox(width: 25,),
                    Image.asset('assets/shopping-bag-outline.png', height: 25,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trending', style: TextStyle(fontWeight:FontWeight.w500, fontSize: 22),),
                    Text('See All', style: TextStyle(fontWeight:FontWeight.w500, fontSize: 15),)

                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0,0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.73
                      ),
                      itemCount: 4,
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width:double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(data[index]['color']),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.white,
                                      ),
                                      Image.network(data[index]['image'],
                                      height: 160,)

                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(data[index]['name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                            Text(r'$'+data[index]['price'],style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),)
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
