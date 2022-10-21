import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portifolio_vitor/core/navigator/app_navigator.dart';
import 'package:portifolio_vitor/core/services/device_information_service.dart';
import 'package:portifolio_vitor/shared/themes/app_styles.dart';
import 'package:portifolio_vitor/shared/themes/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late double screenPerimeter;

  @override
  Widget build(BuildContext context) {
    screenPerimeter = DeviceInformationService.screenPerimeter(context);
    return Scaffold(
      body: BodySplashPage(
        screenPermiter: screenPerimeter,
      ),
    );
  }
}

class BodySplashPage extends StatefulWidget {
  final double screenPermiter;
  const BodySplashPage({Key? key, required this.screenPermiter})
      : super(key: key);

  @override
  State<BodySplashPage> createState() => _BodySplashPageState();
}

class _BodySplashPageState extends State<BodySplashPage> {
  double opacity = 0;
  late double screenPerimeter;
  late DeviceType device;

  @override
  void initState() {
    changePage();
    super.initState();
  }

  void changePage() async {
    await Future.delayed(const Duration(seconds: 4)).then((value) {
      AppNavigator.navigateToNamed(
        context,
        "/home",
        NavigationType.pushNamedAndRemoveUntil,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    screenPerimeter = DeviceInformationService.screenPerimeter(context);
    device = DeviceInformationService.getDevice(context);
    return SingleChildScrollView(
      child: Container(
        color: AppTheme.colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.screenPermiter * 0.15,
                child: Lottie.asset(AppTheme.animations.splashscreen,
                    height: screenPerimeter * 0.08,
                    filterQuality: FilterQuality.medium),
              ),
              Text(
                "Bem vindo",
                style: AppTheme.textStyles.styleText(
                  TypeFont.monospaceRegular,
                  AppTheme.colors.white,
                  device == DeviceType.web
                      ? screenPerimeter * 0.01
                      : screenPerimeter * 0.01,
                  FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
