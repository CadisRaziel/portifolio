import 'package:flutter/material.dart';
import 'package:portifolio_vitor/core/services/device_information_service.dart';
import 'package:portifolio_vitor/presenter/app_widgets/header.dart';
import 'package:portifolio_vitor/shared/themes/app_styles.dart';
import 'package:portifolio_vitor/shared/themes/app_theme.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  late double screenPerimeter;
  late DeviceType device;
  double messageOpacity = 0;
  double imageOpacity = 0;

  @override
  Widget build(BuildContext context) {
    screenPerimeter = DeviceInformationService.screenPerimeter(context);
    device = DeviceInformationService.getDevice(context);

    return Header(
      page: Container(
        color: AppTheme.colors.black,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            TweenAnimationBuilder<double>(
              curve: Curves.easeInOutQuart,
              tween: Tween(
                begin: 0,
                //Tentar colocar ternario dentro de ternario !!
                end: device == DeviceType.mobile
                    ? screenPerimeter * 0.0 -
                        MediaQuery.of(context).size.width * 0.8
                    : device == DeviceType.tablet
                        ? screenPerimeter * 0.06
                        : screenPerimeter * 0.16, // WEB
              ),
              duration: const Duration(milliseconds: 2500),
              builder: (context, value, child) {
                return Positioned(
                  left: value,
                  height: device == DeviceType.mobile
                      ? MediaQuery.of(context).size.height + 300
                      : device == DeviceType.tablet
                          ? screenPerimeter * 0.33
                          : screenPerimeter * 0.25, // WEB
                  child: AnimatedOpacity(
                    opacity: imageOpacity,
                    duration: const Duration(seconds: 1),
                    child: SizedBox(
                      child: Image(
                        image: AssetImage(AppTheme.images.vitor),
                      ),
                    ),
                    onEnd: () {
                      setState(() {
                        messageOpacity = 1;
                      });
                    },
                  ),
                );
              },
            ),
            TweenAnimationBuilder<double>(
              curve: Curves.easeInOutQuart,
              tween: Tween(
                begin: 0,
                end: device == DeviceType.web
                    ? screenPerimeter * 0.01
                    : screenPerimeter * 0.01,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Positioned(
                  top: device == DeviceType.web
                      ? value
                      : value + screenPerimeter * 0.01,
                  left: value,
                  child: Column(
                    children: [
                      Text(
                        "Vitor Brussolo Zerbato",
                        style: AppTheme.textStyles.styleText(
                          TypeFont.monospaceRegular,
                          AppTheme.colors.white,
                          device == DeviceType.web
                              ? screenPerimeter * 0.005
                              : screenPerimeter * 0.005,
                          FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Software Developer",
                        style: AppTheme.textStyles.styleText(
                          TypeFont.monospaceRegular,
                          AppTheme.colors.white,
                          device == DeviceType.web
                              ? screenPerimeter * 0.005
                              : screenPerimeter * 0.005,
                          FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: device == DeviceType.web
                            ? screenPerimeter * 0.08
                            : screenPerimeter * 0.1,
                        child: AnimatedOpacity(
                          opacity: messageOpacity,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: device == DeviceType.mobile
                                      ? MediaQuery.of(context).size.height + 300
                                      : device == DeviceType.tablet
                                          ? screenPerimeter * 0.33
                                          : screenPerimeter * 0.015, // WE)
                                ),
                                child: Text(
                                  "'A persistencia supera o talento'",
                                  textAlign: TextAlign.start,
                                  style: AppTheme.textStyles.styleText(
                                    TypeFont.monospaceRegular,
                                    AppTheme.colors.white,
                                    device == DeviceType.web
                                        ? screenPerimeter * 0.0018
                                        : screenPerimeter * 0.0035,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onEnd: () {
                setState(() {
                  imageOpacity = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
