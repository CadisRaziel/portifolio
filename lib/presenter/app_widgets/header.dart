import 'package:flutter/material.dart';
import 'package:portifolio_vitor/core/navigator/app_navigator.dart';
import 'package:portifolio_vitor/core/navigator/page_injector.dart';
import 'package:portifolio_vitor/core/services/device_information_service.dart';
import 'package:portifolio_vitor/shared/extensions_header_widget/extension.dart';
import 'package:portifolio_vitor/shared/themes/app_styles.dart';
import 'package:portifolio_vitor/shared/themes/app_theme.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.page,
  }) : super(key: key);
  final Widget? page;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Map<String, dynamic>>? pages;
  @override
  void initState() {
    pages = PageInjector.pages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenPerimeter = DeviceInformationService.screenPerimeter(context);
    DeviceType device = DeviceInformationService.getDevice(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colors.black,
        centerTitle: true,
        title: TweenAnimationBuilder<double>(
          curve: Curves.easeInOutQuart,
          tween: Tween(
            begin: 0,
            end: device == DeviceType.web
                ? screenPerimeter * 0.004
                : screenPerimeter * 0.007,
          ),
          duration: const Duration(seconds: 1),
          builder: (context, tweenValue, child) {
            return Wrap(
              children: pages!
                  .map(
                    (e) => InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        AppNavigator.navigateToNamed(
                          context,
                          e["route"],
                          NavigationType.pushNamedAndRemoveUntil,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(
                          device == DeviceType.web
                              ? tweenValue + tweenValue * 0.5
                              : screenPerimeter * 0.003,
                        ),
                        child: Text(
                          e["pageName"],
                          style: AppTheme.textStyles.styleText(
                            TypeFont.monospaceRegular,
                            AppTheme.colors.white,
                            device == DeviceType.web
                                ? screenPerimeter * 0.005
                                : screenPerimeter * 0.005,
                            FontWeight.w400,
                          ),
                        ).showCursorOnHover.moveUpOnHover,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: widget.page,
    );
  }
}
