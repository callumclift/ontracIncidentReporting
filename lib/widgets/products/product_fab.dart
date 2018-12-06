import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/product.dart';
import '../../models/product1.dart';
import '../../scoped_models/main.dart';

class ProductFAB extends StatefulWidget {
  final Product1 product;

  ProductFAB(this.product);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductFABState();
  }
}

class _ProductFABState extends State<ProductFAB> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () async {
                  final url = 'mailto:${widget.product.userEmail}';
                  //final url = 'https://www.google.com';

                  if (await canLaunch(url)) {
                    launch(url);
                  } else {
                    throw 'Could not launch!';
                  }
                },
                heroTag: null,
                mini: true,
                child: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Container(
            height: 60.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () async {
                  final url = 'tel:+1 555 010 999';
                  //final url = 'https://www.google.com';

                  if (await canLaunch(url)) {
                    launch(url);
                  } else {
                    throw 'Could not launch!';
                  }
                },
                heroTag: null,
                mini: true,
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Container(
            height: 60.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _controller,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () async {
                  final url = 'sms:5550101234';
                  //final url = 'https://www.google.com';

                  if (await canLaunch(url)) {
                    launch(url);
                  } else {
                    throw 'Could not launch!';
                  }
                },
                heroTag: null,
                mini: true,
                child: Icon(
                  Icons.textsms,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Container(
              height: 60.0,
              width: 56.0,
              alignment: FractionalOffset.topCenter,
              child: ScaleTransition(
                scale: CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.0, 0.5, curve: Curves.easeOut)),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).cardColor,
                  heroTag: null,
                  mini: true,
                  onPressed: () {
                    model.toggleProductFavoriteStatus(model.selectedProduct); // pass model.selectedProduct
                  },
                  child: Icon(
                    model.selectedProduct1.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              )),
          FloatingActionButton(
            heroTag: 'options',
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                    child: Icon(_controller.isDismissed ? Icons.more_vert: Icons.close),
                  );
                }),
          ),
        ],
      );
    });
  }
}
