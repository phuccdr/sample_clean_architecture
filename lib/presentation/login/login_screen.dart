import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/core/validator/email_validator.dart';
import 'package:demo/core/validator/password_validator.dart';
import 'package:demo/core/widget/custom_button.dart';
import 'package:demo/core/widget/custom_password_field.dart';
import 'package:demo/core/widget/custom_text_field.dart';
import 'package:demo/core/widget/error_text.dart';
import 'package:demo/presentation/login/login_cubit.dart';
import 'package:demo/presentation/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == FormzSubmissionStatus.success) {
                context.go('/academyrecord');
              }
            },
            child: Scaffold(
              appBar: _buildAppBar(),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(child: _buildBody(context)),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          //navigator back
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            children: [
              _buildIllustration(),
              const SizedBox(height: 24),
              const EmailTextField(),
              const SizedBox(height: 12),
              const PasswordTextField(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID thiết bị: 100600',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFAFAFAF),
                    ),
                  ),
                  Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF777777),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  context.read<LoginCubit>().onLogin();
                },
                text: 'Đăng nhập',
              ),
              const SizedBox(height: 24),
              TwoTextSpan(
                firstText: 'Nếu bạn có mã kích hoạt, ',
                firstTextStyle: AppTextStyle.textStyleSpanIntroActiveCode,
                secondText: 'Nhập tại đây.',
                secondTextStyle: AppTextStyle.textStyleSpanActiveCode,
              ),
              const SizedBox(height: 84),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 80, height: 1, color: Color(0xFFAFAFAF)),
                  Text(
                    ' Hoặc đăng nhập với ',
                    style: AppTextStyle.body16ExtraboldStyle,
                  ),
                  Container(width: 80, height: 1, color: Color(0xFFAFAFAF)),
                ],
              ),
              const SizedBox(height: 72),
              const BottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 116),
      child: Image.asset('assets/images/imv_monkey.png'),
    );
  }
}

class TwoTextSpan extends StatelessWidget {
  final String firstText;
  final TextStyle firstTextStyle;
  final String secondText;
  final TextStyle secondTextStyle;

  const TwoTextSpan({
    super.key,
    required this.firstText,
    required this.firstTextStyle,
    required this.secondText,
    required this.secondTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: firstTextStyle,
        children: [TextSpan(text: secondText, style: secondTextStyle)],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: _SocialButton(
                backgroundColor: Color(0xFF1877F2),
                assetPath: 'assets/images/ic_facebook.png',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                backgroundColor: Colors.white,
                assetPath: 'assets/images/ic_google.png',
                borderColor: Color(0xFFD0D5DD),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                backgroundColor: Colors.black,
                assetPath: 'assets/images/ic_apple.png',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        TwoTextSpan(
          firstText: 'Bạn chưa có tài khoản? ',
          firstTextStyle: AppTextStyle.textStyleSpanIntroActiveCode,
          secondText: 'Đăng ký',
          secondTextStyle: AppTextStyle.textStyleSpanActiveCode,
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Color backgroundColor;
  final String assetPath;
  final Color? borderColor;

  const _SocialButton({
    required this.backgroundColor,
    required this.assetPath,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null
            ? Border.all(width: 1, color: borderColor!)
            : null,
      ),
      alignment: Alignment.center,
      child: SizedBox(width: 24, height: 24, child: Image.asset(assetPath)),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          onChanged: (value) => context.read<LoginCubit>().onEmailChange(value),
          hintText: 'Số điện thoại/Tên đăng nhập,',
          errorWidget: state.email.displayError == EmailValidationError.empty
              ? const ErrorText(errorText: 'Số điện thoại cần nhập 6-15 chữ số')
              : state.email.displayError == EmailValidationError.invalid
              ? ErrorText(errorText: 'Số điện thoại không đúng')
              : null,
        );
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomPasswordField(
          onChanged: (value) =>
              context.read<LoginCubit>().onPasswordChange(value),
          hintText: 'Mật khẩu',
          errorWidget:
              state.password.displayError == PasswordValidationError.empty
              ? const ErrorText(errorText: 'Mật khẩu không được để trống')
              : state.password.displayError == PasswordValidationError.invalid
              ? const ErrorText(errorText: 'Mật khẩu phải có ít nhất 6 ký tự')
              : null,
        );
      },
    );
  }
}
