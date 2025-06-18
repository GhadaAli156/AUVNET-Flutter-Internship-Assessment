import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship/core/colors/colors.dart';
import 'package:flutter_internship/core/utilities/string.dart';
import 'package:flutter_internship/features/home/presentation/view/home_view.dart';
import 'package:flutter_internship/features/splash&onboarding/presentation/widgets/main_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/main_image.dart';
import '../widgets/main_text_form_field.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;
  bool hideConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.light,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              showDialog(
                context: context,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            } else if (state is AuthSuccess) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            } else if (state is AuthFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const MainImage(width: 300, height: 300),
                    const SizedBox(height: 50),
                    MainTextFormField(
                      max: 1,
                      labelText: AppStrings.mail,
                      hintText: AppStrings.mail,
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) return AppStrings.mailEmpty;
                        if (!value.contains('@')) return AppStrings.invalidmail;
                        return null;
                      },
                      isPassword: false,
                      prefix: const Icon(Icons.email_outlined),
                      borderRadius: 16,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    MainTextFormField(
                      max: 1,
                      labelText: AppStrings.password,
                      hintText: AppStrings.password,
                      controller: passController,
                      validate: (value) {
                        if (value!.isEmpty) return AppStrings.passwordEmpty;
                        if (value.length < 6) return AppStrings.passwordError;
                        return null;
                      },
                      isPassword: hidePass,
                      prefix: const Icon(Icons.lock_outline),
                      suffix: IconButton(
                        icon: Icon(hidePass ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => hidePass = !hidePass),
                        color: ColorManager.buttonColor,
                      ),
                      borderRadius: 16,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    MainTextFormField(
                      max: 1,
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.confirmPassword,
                      controller: confirmPassController,
                      validate: (value) {
                        if (value!.isEmpty) return AppStrings.passwordEmpty;
                        if (value != passController.text) return 'Passwords do not match';
                        return null;
                      },
                      isPassword: hideConfirmPass,
                      prefix: const Icon(Icons.lock_outline),
                      suffix: IconButton(
                        icon: Icon(hideConfirmPass ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => hideConfirmPass = !hideConfirmPass),
                        color: ColorManager.buttonColor,
                      ),
                      borderRadius: 16,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignUpRequested(
                              emailController.text.trim(),
                              passController.text.trim(),
                            ),
                          );
                        }
                      },
                      width: 400,
                    ),
                    Row(
                      children: [
                        const Text(AppStrings.haveAccount),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const Login()),
                            );
                          },
                          child: const Text(
                            AppStrings.login,
                            style: TextStyle(color: ColorManager.buttonColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
