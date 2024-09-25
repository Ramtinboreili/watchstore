import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';

//TODO: fake image List data
final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/mainpage-desk5.jpg',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/mainpage-desk1.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/kenneth-cole-final_.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/orient-final.jpg'
];

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    required this.imagList
  });

  final List<String> imagList ;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {

  final CarouselSliderController _controller = CarouselSliderController();
  final List<Widget> items = imgList
      .map(
        (e) => Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.medium),
              child: Image.network(
                e,
                fit: BoxFit.cover,
              )),
        ),
      )
      .toList();

int _current = 0 ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
              items: items,
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                    setState(() {
                      _current = index ; 
                    });
                },
              )),
              AppDimens.small.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: () => _controller.animateToPage(e.key),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle,
                       color: _current==e.key?  Colors.black : Colors.grey),
                  ),
                ),
              ),
            ).toList()
          )
        ],
      ),
    );
  }
}
