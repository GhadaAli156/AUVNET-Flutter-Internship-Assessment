import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../auth/presentation/views/signup.dart';
import '../../data/models/onBoarding.dart';
import '../widgets/main_button.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.light,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          contents[i].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.onBoardingTitleColor
                            )
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].desc,
                            style: const TextStyle(
                              fontSize: 14,
                              color: ColorManager.onBoardingSubTitleColor,
                              fontWeight: FontWeight.w200
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: MainButton(
                              text: contents[i].buttonText,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                              width: 200,
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              contents[i].nextText,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorManager.onBoardingSubTitleColor,
                                  fontWeight: FontWeight.w200
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),]
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}