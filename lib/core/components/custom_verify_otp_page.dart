import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../features/data/providers/post/resend_otp_provider.dart';
import '../../features/data/providers/post/verify_otp_provider.dart';
import '../../features/presentation/signup_page/widget/signup_rich_text_widget.dart';
import '../constant/app_colors.dart';
import '../constant/app_enums.dart';
import '../extension/extension.dart';
import '../func/show_top_snack_bar.dart';
import '../router/router.dart';
import 'custom_appbar_title.dart';
import 'custom_icon_button.dart';
import 'custom_otp_code_field.dart';
import 'custom_primary_button.dart';

@RoutePage()
class CustomVerifyOtpPage extends ConsumerStatefulWidget {
  final TextEditingController phoneController, emailController;
  final bool isLogin;
  final ContactType contactType;
  const CustomVerifyOtpPage(
    this.phoneController,
    this.emailController,
    this.contactType, {
    required this.isLogin,
    super.key,
  });
  @override
  ConsumerState<CustomVerifyOtpPage> createState() =>
      _CustomConfirmOtpPageState();
}

class _CustomConfirmOtpPageState extends ConsumerState<CustomVerifyOtpPage> {
  Timer? timer;
  int secondsRemaining = 60;
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendCode() async {
    final isEmail = widget.contactType == ContactType.email;
    final notifier = ref.read(resendOtpProvider.notifier);
    await notifier.resendOtp(
      phonePrefix: isEmail ? null : "+20",
      authMethod: widget.contactType.name,
      email: isEmail ? widget.emailController.text : null,
      phone: isEmail ? null : widget.phoneController.text,
    );
    SuccessMessage(
      context,
      message: context.kAppLocalizations.anewcodehasbeensent,
    );
    startTimer();
  }

  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(verifyOtpProvider.notifier);
    final isEmail = widget.contactType == ContactType.email;
    await notifier.verifyOtp(
      phonePrefix: isEmail ? null : "+20",
      authMethod: widget.contactType.name,
      otp: otpController.text,
      email: isEmail ? widget.emailController.text : null,
      phone: isEmail ? null : widget.phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    final state = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (_, state) {
      if (state is VerifyOtpFailure) {
        ErrorMessage(context, message: state.errMessage);
        return;
      }
      if (state is VerifyOtpSuccess) {
        final isLogin = widget.isLogin;
        if (isLogin == true) {
          context.router.replace(MainNavigationRoute());
          SuccessMessage(context, message: local.otpverifiedsuccessfully);
        } else {
          context.router.push(CompleteProfileRoute());
          SuccessMessage(context, message: local.authenticationsuccessful);
        }
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: context.height * 0.020),
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // CustomTitelAppBar
                    CustomAppBarTitle(title: local.verifyyourphonenumber),
                    // Custom Icon Back
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: CustomIconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.kWhite,
                        ),
                        onPressed: () {
                          context.router.maybePop();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.020),
                // Enter the OTP code sent your phone number
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: local.entertheotpcodesent,
                        style: AppTextTheme.kTitleSmall(
                          context,
                          color: AppColors.kBoulder,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            widget.contactType == ContactType.email
                                ? widget.emailController.text
                                : widget.phoneController.text,
                        style: AppTextTheme.kTitleMedium(
                          context,
                          fontWeight: FontWeight.w900,
                          color: AppColors.kBoulder,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.040),
                // Signup Pinput Widget
                CustomOtpCodeField(
                  onChanged: (value) async {
                    if (value.length == 6) {
                      final notifier = ref.read(verifyOtpProvider.notifier);
                      await notifier.verifyOtp(
                        authMethod: widget.contactType.name,
                        otp: value,
                      );
                    }
                  },
                  pinPutController: otpController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return local.pleaseentertheotp;
                    } else if (value.length < 6) {
                      return local.otpmustbedigits;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.196),
                // IF
                secondsRemaining > 0
                    ? Text(
                      textAlign: TextAlign.center,
                      '${local.resendotpseconds} $secondsRemaining )',
                      style: AppTextTheme.kTitleMedium(
                        context,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    : TextButton(
                      onPressed: resendCode,
                      child: Text(
                        local.resend,
                        style: AppTextTheme.kTitleMedium(
                          context,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                SizedBox(height: context.height * 0.015),
                // Verify code
                CustomPrimaryButton(
                  title: local.verifycode,
                  isLoading: state is VerifyOtpLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  border: Border.all(color: AppColors.kTurquoiseBlue),
                  borderRadius: BorderRadius.circular(60),
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.height * 0.013,
                  ),
                  style: AppTextTheme.kTitleMedium(
                    context,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                  onTap: verifyOtp,
                ),
                SizedBox(height: context.height * 0.015),
                // SignUp Rich Text
                SignUpRichTextWidget(
                  termsOfUseOnTap: () {},
                  privacyPolicyOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
