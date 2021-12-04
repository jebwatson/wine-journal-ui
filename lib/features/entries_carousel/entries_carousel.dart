import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntriesCarousel extends StatelessWidget {
  const EntriesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardList = [
      Icon(Icons.one_k),
      Icon(Icons.two_k),
      Icon(Icons.three_k)
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.44,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        items: _cardList.map((card) {
          return Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      spreadRadius: 0.8,
                      blurRadius: 10,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Theme.of(context).cardColor,
                  child: card,
                ),
              ),
            );
          });
        }).toList(),
        options: CarouselOptions(
          disableCenter: true,
          viewportFraction: 0.7,
          pageSnapping: false,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
