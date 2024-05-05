import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmer extends StatelessWidget {
  const MainShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, v) => SizedBox(
                height: 300,
                width: 150,
                child: _shimmerCard(context),
              ),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.3,
                aspectRatio: 1.8,
              ),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Shimmer.fromColors(
                  highlightColor: const Color(0xffFFFFFF),
                  baseColor: const Color(0xff727272) ,
                  child: Container(
                    width: 150,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey
                    ),
                  )),
            ),
          ),
          const Gap(20),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemBuilder: (context, index) => SizedBox(
                height: 160,
                width: 120,
                child: _shimmerCard(context),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Shimmer.fromColors(
                  highlightColor: const Color(0xffFFFFFF),
                  baseColor: const Color(0xff727272) ,
                  child: Container(
                    width: 150,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey
                    ),
                  )),
            ),
          ),
          const Gap(20),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemBuilder: (context, index) => SizedBox(
                height: 160,
                width: 120,
                child: _shimmerCard(context),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
  // const bgColor = Color(0xff1F212C);
  // const whiteColor = Color(0xffFFFFFF);
  _shimmerCard(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: const Color(0xffFFFFFF),
      baseColor: const Color(0xff727272) ,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}