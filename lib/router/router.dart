import 'package:con_cards/features/history/history.dart';
import 'package:con_cards/features/home_page/home_page.dart';
import 'package:con_cards/features/login/login.dart';
import 'package:con_cards/features/main/main.dart';
import 'package:con_cards/features/product_list/product_list.dart';
import 'package:con_cards/features/profile/profile.dart';
import 'package:con_cards/features/sign_up/sign_up.dart';
import 'package:con_cards/features/welcome/welcome.dart';

final routes = {
  '/': (context) => const WelcomeScrean(),
  '/main': (context) => const MainScrean(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/home': (context) => const HomePageScrean(),
  '/profile': (context) => const ProfileScrean(),
  '/history': (context) => const HistoryScrean(),
  '/productsList': (context) => const ProductListScrean(),
};
