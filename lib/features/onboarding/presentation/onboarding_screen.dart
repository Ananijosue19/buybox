import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            children: [
              _buildPage(
                context,
                image: 'assets/image/onBoarding2.jpg',
                title: 'Welcome to ',
                highlighted: 'BuyBox',
                subtitle: 'Your one-stop shop for fresh groceries delivered to your door.',
              ),
              _buildPage(
                context,
                image: 'assets/image/onBoarding.jpg',
                title: 'Need Inspiration?',
                highlighted: '',
                subtitle: 'Discover personalized deals and recommended items just for you.',
              ),
              _buildPage(
                context,
                image: 'assets/image/onBoarding3.jpg',
                title: 'Fast Delivery',
                highlighted: 'Enjoy!',
                subtitle: 'Get your groceries straight to your doorstep in no time.',
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.primaryContainer,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                  ),
                ),
                _buildActionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(140, 50),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        onPressed: () {
          if (currentPage < 2) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.pushReplacementNamed(context, '/signIn');
          }
        },
        child: Text(
          currentPage == 2 ? 'Get Started' : 'Next',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required String image,
    required String title,
    required String highlighted,
    required String subtitle,
  }) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(text: title),
                      if (highlighted.isNotEmpty)
                        TextSpan(
                          text: highlighted,
                          style: const TextStyle(color: AppColors.primary),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
