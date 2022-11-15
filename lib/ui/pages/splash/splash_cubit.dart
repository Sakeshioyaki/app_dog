import 'package:dog_app/ui/pages/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  void direcToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const HomePage());
  }
}
