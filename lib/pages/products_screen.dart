import 'package:flutter/material.dart';
import '../zoom_scaffold.dart';


List < Widget > _tiles = [
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84,
  ),
  new _ProductCard(
    headImageAssetPath: 'assets/steak_on_cooktop.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/steak_on_cooktop.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/steak_on_cooktop.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/eggs_in_skillet.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
  new _ProductCard(
    headImageAssetPath: 'assets/steak_on_cooktop.jpg',
    title: 'il domacca',
    subtitle: '78 5th AVENUE, NEW YORK',
    heartCount: 84, ),
];

final Screen productsScreen = new Screen(
  title: 'Productos',
  background: new DecorationImage(
    image: new AssetImage('assets/wood_bk.jpg'),
    fit: BoxFit.cover,
  ),
  contentBuilder: (BuildContext context) {
    return new Container(
      child: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(1.0),
          crossAxisCount: 2,
          children: _tiles,
      ),
    );
  }
);

class _ProductCard extends StatelessWidget {

  final String headImageAssetPath;
  final String title;
  final String subtitle;
  final int heartCount;

  _ProductCard({
    this.headImageAssetPath,
    this.title,
    this.subtitle,
    this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: [
          new Image.asset(
            headImageAssetPath,
            width: double.infinity,
            height: 110.0,
            fit: BoxFit.cover,
          ),
          new Row(
            children: [
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'mermaid',
                    ),
                  ),
                  new Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'bebas-neue',
                      letterSpacing: 1.0,
                      color: const Color(0xFFAAAAAA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}