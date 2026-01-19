import 'package:demo/presentation/academy_record/academy_record_screen.dart';
import 'package:demo/presentation/choose_year_of_birth/choose_year_screen.dart';
import 'package:demo/presentation/create_password/create_password_screen.dart';
import 'package:demo/presentation/enter_phone_number/enter_phone_number_screen.dart';
import 'package:demo/presentation/entername/enter_name_screen.dart';
import 'package:demo/presentation/greet_monkey/greet_monkey_screen.dart';
import 'package:demo/presentation/login/login_screen.dart';
import 'package:demo/presentation/select_skill_english/select_skill_english_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const academyRecord = '/academyrecord';
  static const createPassword = '/createpassword';
  static const enterPhoneNumber = '/enterphonenumber';
  static const chooseYearOfBirth = '/chooseyearofbirth';
  static const selectSkillEnglish = '/selectskillenglish';
  static const greetMonkey = '/greetmonkey';
  static const enterName = '/entername';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.academyRecord,
      builder: (context, state) => const AcademyRecordScreen(),
    ),
    GoRoute(
      path: AppRoutes.createPassword,
      builder: (context, state) => const CreatePasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.enterPhoneNumber,
      builder: (context, state) => const EnterPhoneNumberScreen(),
    ),
    GoRoute(
      path: '${AppRoutes.chooseYearOfBirth}/:name',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? '';
        return ChooseYearScreen(name: name);
      },
    ),
    GoRoute(
      path: AppRoutes.selectSkillEnglish,
      builder: (context, state) => const SelectSkillEnglishScreen(),
    ),
    GoRoute(
      path: AppRoutes.greetMonkey,
      builder: (context, state) => const GreetMonkey(),
    ),
    GoRoute(
      path: AppRoutes.enterName,
      builder: (context, state) => const EnterNameScreen(),
    ),
  ],
);
