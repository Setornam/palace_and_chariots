import 'package:flutter/material.dart';
import 'package:palace_and_chariots/shared/data/image_assets.dart';
import 'package:palace_and_chariots/src/sign_in/presentation/pages/sign_in_page.dart';

import '../widgets/indicator.dart';
import '../widgets/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _pageIndex = 0;
  List<OnboardingItemData> onboardingItems = [
    OnboardingItemData(
      title: 'Travel and Tourism',
      subTitle:
          'Lorem ipsum dolor sit amet consectetur. Urna sapien magna eu justo ullamcorper velit. Proin aliquam risus sed netus facilisi.',
      image: ImageAssets.onBoardingImageOne,
    ),
    OnboardingItemData(
        title: 'Events Services',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur. Urna sapien magna eu justo ullamcorper velit. Proin aliquam risus sed netus facilisi.',
        image: ImageAssets.onBoardingImageTwo),
    OnboardingItemData(
        title: 'Security',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur. Urna sapien magna eu justo ullamcorper velit. Proin aliquam risus sed netus facilisi.',
        image: ImageAssets.onBoardingImageThree),
    OnboardingItemData(
        title: 'Rentals',
        subTitle:
            'Lorem ipsum dolor sit amet consectetur. Urna sapien magna eu justo ullamcorper velit. Proin aliquam risus sed netus facilisi.',
        image: ImageAssets.onBoardingImageFour),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(children: [
        PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingItem(onboardingItemData: onboardingItems[index]);
            }),
        Positioned(
          bottom: 150,
          left: 180,
          child: Column(
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(onboardingItems.length, (index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Indicator(
                              isActive: index == _pageIndex,
                              onTap: () {
                                // implement moving onboarding page to the selected dot
                              }));
                    })
                  ]),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text(
                    'Skip',
                    style: theme.textTheme.bodyLarge!.apply(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
