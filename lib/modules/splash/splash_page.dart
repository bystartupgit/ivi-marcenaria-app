import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marcenaria/modules/splash/stores/splash_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final SplashStore store = SplashStore();

  final String logo = "assets/logo/logo.svg";

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(
        logo,
        width: MediaQuery.of(context).size.width * 0.6,
      ),),
      backgroundColor: const Color(0xFFECB157),
    );
  }
}
