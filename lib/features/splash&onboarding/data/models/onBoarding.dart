import '../../../../../core/utilities/string.dart';

class OnBoardingContents {
  final String image;
  final String title;
  final String desc;
  final String buttonText;
  final String nextText;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
    required this.buttonText,
    required this.nextText,

  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: AppStrings.onBoardingTitle1,
    image: "assets/images/onBoardingimage.png",
    desc:AppStrings.onBoardingSubTitle1,
      buttonText: AppStrings.buttonText,
      nextText: AppStrings.next
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle2,
    image: "assets/images/onBoardingimage.png",
    desc: AppStrings.onBoardingSubTitle2,
    buttonText: AppStrings.buttonText,
    nextText: AppStrings.next
  ),
  OnBoardingContents(
    title: AppStrings.onBoardingTitle3,
    image: "assets/images/onBoardingimage.png",
    desc: AppStrings.onBoardingSubTitle3,
      buttonText: AppStrings.buttonText,
      nextText: AppStrings.next
  ),
];