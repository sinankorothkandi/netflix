// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Toprateddiscribtion extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, lounch_on;

  const Toprateddiscribtion({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.lounch_on});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:ListView(
          children: [
            Container(
              height: 280,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,
                    child: Text('⭐Avarage Rating -'+ vote,)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name != null?name:'not loaded'),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('release on - '+lounch_on)
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(description),
                  ),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }
}




class populardiscribtion extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, lounch_on;

  const populardiscribtion({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.lounch_on});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:ListView(
          children: [
            Container(
height: 280,
              child: Stack(
                children: [
                  Positioned(child: Container(
                   height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,
                    child: Text('⭐Avarage Rating -'+ vote,)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name != null?name:'not loaded'),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('release on - '+lounch_on)
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(description),
                  ),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }
}




class trendingdiscribtion extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, lounch_on;

  const trendingdiscribtion({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.lounch_on});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:ListView(
          children: [
            Container(
              height: 280,
              child: Stack(
                children: [
                  Positioned(child: Container(
                   height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,
                    child: Text('⭐Avarage Rating -'+ vote,)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name != null?name:'not loaded'),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('release on - '+lounch_on)
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(description),
                  ),
                )
              ],
            )
          ],
        ) ,
      ),
    );
  }
}
