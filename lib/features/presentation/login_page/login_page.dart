import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/custom_contact_type_field.dart';
import '../../../core/components/custom_primary_button.dart';
import '../../../core/components/custom_social_auth_button.dart';
import '../../../core/components/custom_tap_richtext.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_enums.dart';
import '../../../core/constant/app_text_theme.dart';
import '../../../core/extension/extension.dart';
import '../../../core/func/show_top_snack_bar.dart';
import '../../../core/router/router.dart';
import '../../data/providers/post/resend_otp_provider.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  ContactType contactType = ContactType.phone;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Future<void> logIn() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(resendOtpProvider.notifier);
    final isPhone = contactType == ContactType.phone;
    await notifier.resendOtp(
      phonePrefix: isPhone ? "+20" : null,
      authMethod: contactType.name,
      email: isPhone ? null : emailController.text.trim(),
      phone: isPhone ? phoneController.text.trim() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    final state = ref.watch(resendOtpProvider);
    ref.listen(resendOtpProvider, (_, state) {
      if (state is ResendOtpFailure) {
        ErrorMessage(context, message: state.errMessage);
        return;
      }
      if (state is ResendOtpSuccess) {
        SuccessMessage(context, message: local.otpverifiedsuccessfully);
        context.router.push(
          CustomVerifyOtpRoute(
            isLogin: true,
            contactType: contactType,
            emailController: emailController,
            phoneController: phoneController,
          ),
        );
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
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.024,
                horizontal: context.height * 0.024,
              ),
              children: [
                // Welcome To Invesier!
                Text(
                  textAlign: TextAlign.center,
                  local.welcometoinvesier,
                  style: AppTextTheme.kHeadlineSmall(
                    context,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                // Don't have an account?
                Center(
                  child: CustomTapRichText(
                    textSpanOne: local.donthaveanaccount,
                    textSpanTwo: local.createanaccount,
                    onTap: () {
                      context.router.replace(SignupRoute());
                    },
                  ),
                ),
                SizedBox(height: context.height * 0.024),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Email
                        CustomPrimaryButton(
                          title: local.email,
                          style: AppTextTheme.kTitleMedium(
                            context,
                            color:
                                contactType == ContactType.email
                                    ? AppColors.kWhite
                                    : AppColors.kTurquoiseBlue,
                            fontWeight: FontWeight.w600,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.001,
                            horizontal: context.height * 0.052,
                          ),
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(26),
                            bottomStart: Radius.circular(26),
                          ),
                          backGroundColor:
                              contactType == ContactType.email
                                  ? AppColors.kTurquoiseBlue
                                  : AppColors.kCodGray,
                          border: Border.all(color: AppColors.kTurquoiseBlue),
                          onTap: () {
                            setState(() {
                              contactType = ContactType.email;
                              pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        ),
                        // Phone
                        CustomPrimaryButton(
                          title: local.phone,
                          style: AppTextTheme.kTitleMedium(
                            context,
                            color:
                                contactType == ContactType.phone
                                    ? AppColors.kWhite
                                    : AppColors.kTurquoiseBlue,
                            fontWeight: FontWeight.w600,
                          ),

                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.001,
                            horizontal: context.height * 0.052,
                          ),
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(26),
                            bottomEnd: Radius.circular(26),
                          ),
                          backGroundColor:
                              contactType == ContactType.phone
                                  ? AppColors.kTurquoiseBlue
                                  : AppColors.kCodGray,
                          border: Border.all(color: AppColors.kTurquoiseBlue),
                          onTap: () {
                            setState(() {
                              contactType = ContactType.phone;
                              pageController.animateToPage(
                                1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.047),
                    // PageView
                    SizedBox(
                      height: context.height * 0.150,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          // Email
                          CustomContactTypeFieldWidget(
                            title: local.primaryemail,
                            hintText: 'name@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            tybeController: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return local.pleaseenteravalidemail;
                              } else if (!value.contains('@')) {
                                return local.emailmustcontainat;
                              }
                              return null;
                            },
                          ),
                          // Phone Number
                          CustomContactTypeFieldWidget(
                            title: local.phonenumber,
                            hintText: '+20***********',
                            keyboardType: TextInputType.phone,
                            tybeController: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return local.pleaseenteravalidphonenumber;
                              } else if (value.length < 11) {
                                return local.phonenumbermustbeatleastdigits;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.11),
                CustomSocialAuthButton(
                  onLoginWithGoogle: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                  onLoginWithApple: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
                SizedBox(height: context.height * 0.057),
                // CustomPrimaryButton
                CustomPrimaryButton(
                  title: local.login,
                  isLoading: state is ResendOtpLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.height * 0.013,
                  ),
                  borderRadius: BorderRadius.circular(60),
                  style: AppTextTheme.kTitleMedium(
                    context,
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () => logIn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
