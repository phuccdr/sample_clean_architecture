import 'dart:math';

import 'package:demo/core/theme/app_colors.dart';
import 'package:demo/core/theme/app_text_style.dart';
import 'package:demo/presentation/signup/signup_cubit.dart';
import 'package:demo/presentation/signup/signup_state.dart';
import 'package:demo/presentation/signup/update_learning_data/check_list_item.dart';
import 'package:demo/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class UpdateLearningData extends StatefulWidget {
  const UpdateLearningData({super.key});

  @override
  State<UpdateLearningData> createState() => _UpdateLearningDataState();
}

class _UpdateLearningDataState extends State<UpdateLearningData>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
      context.read<SignupCubit>().onRegister();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: BlocListener<SignupCubit, SignupState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            context.go(AppRoutes.home);
          } else if (state.status == FormzSubmissionStatus.failure) {}
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 48),
                Text(
                  'Monkey đang cập nhật\ndữ liệu học tập của bé',
                  style: AppTextStyle.headerLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 108),
                _buildLoading(state.status),
                const Spacer(),
                CheckListItem(
                  content: 'Cập nhật thông tin tài khoản sử dụng',
                  isCompleted: state.status == FormzSubmissionStatus.success,
                ),
                const SizedBox(height: 12),
                CheckListItem(
                  content: 'Cập nhật hồ sơ học tập',
                  isCompleted: state.status == FormzSubmissionStatus.success,
                ),
                const SizedBox(height: 12),
                CheckListItem(
                  content: 'Cập nhật thông tin gói học',
                  isCompleted: state.status == FormzSubmissionStatus.success,
                ),
                const SizedBox(height: 160),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading(FormzSubmissionStatus status) {
    if (status == FormzSubmissionStatus.inProgress ||
        status == FormzSubmissionStatus.initial) {
      return AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, child) {
          final percent = (_progressAnimation.value * 100).toInt();
          return _CircularPercentIndicator(
            percent: percent,
            progress: _progressAnimation.value,
          );
        },
      );
    }
    if (status == FormzSubmissionStatus.success) {
      return const _CircularPercentIndicator(percent: 100, progress: 1.0);
    }
    if (status == FormzSubmissionStatus.failure) {
      return const Icon(Icons.error, color: Colors.red, size: 120);
    }
    return const SizedBox.shrink();
  }
}

class _CircularPercentIndicator extends StatelessWidget {
  final int percent;
  final double progress;

  const _CircularPercentIndicator({
    required this.percent,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    const size = 216.0;
    const strokeWidth = 16.0;
    const color = AppColors.primaryDark;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
                width: strokeWidth,
              ),
            ),
          ),
          // Progress arc
          CustomPaint(
            size: const Size(size, size),
            painter: _CircularProgressPainter(
              progress: progress,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ),
          // Percentage text
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw arc from top (-90 degrees) clockwise
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
