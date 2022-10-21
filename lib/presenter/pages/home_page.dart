import 'package:flutter/material.dart';
import 'package:portifolio_vitor/core/navigator/app_navigator.dart';
import 'package:portifolio_vitor/core/services/device_information_service.dart';
import 'package:portifolio_vitor/presenter/app_widgets/header.dart';
import 'package:portifolio_vitor/shared/themes/app_styles.dart';
import 'package:portifolio_vitor/shared/themes/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double screenPerimeter;
  late DeviceType device;
  double messageOpacity = 0;
  double imageOpacity = 0;

  @override
  Widget build(BuildContext context) {
    screenPerimeter = DeviceInformationService.screenPerimeter(context);
    device = DeviceInformationService.getDevice(context);
    print(device);
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
                        MediaQuery.of(context).size.width * 0.85
                    : device == DeviceType.tablet
                        ? -350
                        : screenPerimeter * 0.13,
              ),
              duration: const Duration(milliseconds: 2500),
              builder: (context, value, child) {
                return Positioned(
                  left: value,
                  height: device == DeviceType.mobile
                      ? screenPerimeter * 0.48
                      : device == DeviceType.tablet
                          ? screenPerimeter * 0.46
                          : screenPerimeter * 0.25,
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
                end: device == DeviceType.mobile
                    ? screenPerimeter * 0.01
                    : device == DeviceType.tablet
                        ? screenPerimeter * 0.01
                        : screenPerimeter * 0.01,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Positioned(
                  top: device == DeviceType.mobile
                      ? 50
                      : device == DeviceType.tablet
                          ? value
                          : value + 50,
                  left: value,
                  child: Column(
                    children: [
                      Text(
                        "Vitor Brussolo Zerbato",
                        style: AppTheme.textStyles.styleText(
                          TypeFont.monospaceRegular,
                          AppTheme.colors.white,
                          device == DeviceType.mobile
                              ? screenPerimeter * 0.005
                              : device == DeviceType.tablet
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
                          device == DeviceType.mobile
                              ? screenPerimeter * 0.004
                              : device == DeviceType.tablet
                                  ? screenPerimeter * 0.004
                                  : screenPerimeter * 0.004,
                          FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: device == DeviceType.mobile
                            ? screenPerimeter * 0.1
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.1,
                        child: AnimatedOpacity(
                          opacity: messageOpacity,
                          duration: const Duration(seconds: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: device == DeviceType.mobile
                                      ? screenPerimeter * 0.0095
                                      : device == DeviceType.tablet
                                          ? screenPerimeter * 0.0085
                                          : screenPerimeter * 0.0035,
                                ),
                                child: Text(
                                  "'A persistência supera o talento'",
                                  textAlign: TextAlign.start,
                                  style: AppTheme.textStyles.styleText(
                                    TypeFont.monospaceRegular,
                                    AppTheme.colors.white,
                                    device == DeviceType.mobile
                                        ? screenPerimeter * 0.0032
                                        : device == DeviceType.tablet
                                            ? screenPerimeter * 0.0032
                                            : screenPerimeter * 0.0035,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: device == DeviceType.mobile
                            ? screenPerimeter * 0.005
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.01,
                      ),
                      SizedBox(
                        width: device == DeviceType.mobile
                            ? screenPerimeter * 0.1
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.15,
                        child: AnimatedOpacity(
                          opacity: messageOpacity,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: device == DeviceType.mobile
                                      ? screenPerimeter * 0.0
                                      : device == DeviceType.tablet
                                          ? screenPerimeter * 0.0085
                                          : screenPerimeter * 0.0035,
                                ),
                                child: Text(
                                  "Quero um dia aprender sobre tudo que existe na programação, de pouco em pouco vou atingindo meu objetivo. Gosto de estudar todos os dias, pois quando perco um dia, eu perco muita coisa de estudo... Tento não focar somente em uma linguagem de programação e meu objetivo é não trabalhar por salário um dia, mais sim por projetos que mude o mundo para melhor!",
                                  textAlign: TextAlign.start,
                                  style: AppTheme.textStyles.styleText(
                                    TypeFont.monospaceRegular,
                                    AppTheme.colors.white,
                                    device == DeviceType.mobile
                                        ? screenPerimeter * 0.004
                                        : device == DeviceType.tablet
                                            ? screenPerimeter * 0.0032
                                            : screenPerimeter * 0.0035,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: device == DeviceType.mobile
                            ? screenPerimeter * 0.005
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.01,
                      ),
                      SizedBox(
                        width: device == DeviceType.mobile
                            ? screenPerimeter * 0.1
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.15,
                        child: AnimatedOpacity(
                          opacity: messageOpacity,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: device == DeviceType.mobile
                                      ? screenPerimeter * 0.0
                                      : device == DeviceType.tablet
                                          ? screenPerimeter * 0.0085
                                          : screenPerimeter * 0.0035,
                                ),
                                child: Text(
                                  "Atualmente trabalho com Dart / Flutter e um pouco de react(Pois preciso fazer manutenção no site da startup que tarabalho hoje) porém estou estudando JAVA(backend) e GOLANG (backend) e inglês.",
                                  textAlign: TextAlign.start,
                                  style: AppTheme.textStyles.styleText(
                                    TypeFont.monospaceRegular,
                                    AppTheme.colors.white,
                                    device == DeviceType.mobile
                                        ? screenPerimeter * 0.004
                                        : device == DeviceType.tablet
                                            ? screenPerimeter * 0.0032
                                            : screenPerimeter * 0.0035,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: device == DeviceType.mobile
                            ? screenPerimeter * 0.005
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.01,
                      ),
                      SizedBox(
                        width: device == DeviceType.mobile
                            ? screenPerimeter * 0.1
                            : device == DeviceType.tablet
                                ? screenPerimeter * 0.1
                                : screenPerimeter * 0.15,
                        child: AnimatedOpacity(
                          opacity: messageOpacity,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: device == DeviceType.mobile
                                      ? screenPerimeter * 0.0
                                      : device == DeviceType.tablet
                                          ? screenPerimeter * 0.0085
                                          : screenPerimeter * 0.0035,
                                ),
                                child: Text(
                                  "No inicio eu estudava por conta própria, porém agora eu estou fazendo faculdade, Ciências da computação na Cruzeiro do Sul.",
                                  textAlign: TextAlign.start,
                                  style: AppTheme.textStyles.styleText(
                                    TypeFont.monospaceRegular,
                                    AppTheme.colors.white,
                                    device == DeviceType.mobile
                                        ? screenPerimeter * 0.004
                                        : device == DeviceType.tablet
                                            ? screenPerimeter * 0.0032
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
