// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    Key? key,
    required this.onboardingItemData,
  }) : super(key: key);
  final OnboardingItemData onboardingItemData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(onboardingItemData.image),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(onboardingItemData.title,
                    style: theme.textTheme.headlineSmall!.apply(
                        fontSizeDelta: 2,
                        fontWeightDelta: 3,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(onboardingItemData.subTitle,
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.button!.apply(color: Colors.white70)),
              ),
              const Spacer()
            ]),
          )),
    );
  }
}

class OnboardingItemData {
  final String title;
  final String subTitle;
  final String image;

  OnboardingItemData({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
