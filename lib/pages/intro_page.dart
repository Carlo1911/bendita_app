import 'package:flutter/material.dart';

final introPages = [
  new IntroPageViewModel(
    Colors.blue,
    'assets/hotels.png',
    'Hotels',
    'All hotels and hostels are sorted by hospitality rating',
    'assets/key.png'
  ),
  new IntroPageViewModel(
    Colors.teal,
    'assets/banks.png',
    'Banks',
    'We carefully verify all banks before adding them into the app',
    'assets/wallet.png'
  ),
  new IntroPageViewModel(
    Colors.green,
    'assets/stores.png',
    'Stores',
    'All local stores are categorized for your convinience',
    'assets/shopping_cart.png'
  ),

];

class IntroPage extends StatelessWidget {

  final IntroPageViewModel viewModel;
  final double percentVisible;

  IntroPage({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Transform(
              transform: Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(bottom: 25.0),
                child: new Image.asset(
                  viewModel.heroAssetPath,
                  width: 200.0,
                  height: 200.0, ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Text(
                  viewModel.tittle,
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'FlamanteRoma',
                    fontSize: 34.0,
                  ),
                ),
              ),
            ),
            new Transform(
              transform: new Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(bottom: 75.0),
                child: new Text(
                  viewModel.body,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
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

class IntroPageViewModel {
  final Color color;
  final String heroAssetPath;
  final String tittle;
  final String body;
  final String iconAssetPath;

  IntroPageViewModel(
    this.color,
    this.heroAssetPath,
    this.tittle,
    this.body,
    this.iconAssetPath,
  );
}