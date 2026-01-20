import 'package:demo/presentation/academy_record/academy_record_screen.dart';
import 'package:demo/presentation/signup/choose_year_of_birth/choose_year_screen.dart';
import 'package:demo/presentation/signup/create_password/create_password_screen.dart';
import 'package:demo/presentation/signup/enter_phone_number/enter_phone_number_screen.dart';
import 'package:demo/presentation/signup/entername/enter_name_screen.dart';
import 'package:demo/presentation/signup/greet_monkey/greet_monkey_screen.dart';
import 'package:demo/presentation/login/login_screen.dart';
import 'package:demo/presentation/signup/select_level_english/select_level_english_screen.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/update_learning_data/update_learning_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  static const updateLearningData = '/updatelearningdata';
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
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(create: (_) => SignupCubit(), child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.enterName,
          builder: (context, state) => const EnterNameScreen(),
        ),
        GoRoute(
          path: AppRoutes.selectSkillEnglish,
          builder: (context, state) => const SelectLevelEnglishScreen(),
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
          path: AppRoutes.chooseYearOfBirth,
          builder: (context, state) => const ChooseYearScreen(),
        ),
        GoRoute(
          path: AppRoutes.greetMonkey,
          builder: (context, state) => const GreetMonkey(),
        ),
        GoRoute(
          path: AppRoutes.updateLearningData,
          builder: (context, state) => const UpdateLearningData(),
        ),
      ],
    ),
  ],
);
