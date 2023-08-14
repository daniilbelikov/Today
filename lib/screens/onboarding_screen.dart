import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../models/onboarding_model.dart';
import 'package:today/screens/auth_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  OnbordingScreenState createState() => OnbordingScreenState();
}

class OnbordingScreenState extends State<OnbordingScreen> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: OnbordingModel.contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        OnbordingModel.contents[index].image!,
                        height: 300,
                      ),
                      Text(
                        OnbordingModel.contents[index].title ?? '',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        OnbordingModel.contents[index].discription ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              OnbordingModel.contents.length,
              (index) => DotWidget(
                currentIndex: currentIndex,
                index: index,
              ),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == OnbordingModel.contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AuthScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              child: Text(
                currentIndex == OnbordingModel.contents.length - 1
                    ? "Continue"
                    : "Next",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.currentIndex,
    required this.index,
  });

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
