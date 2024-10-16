import 'package:weather_app/core/widgets/custom_text_field.dart';
import 'package:weather_app/core/widgets/custome_button.dart';
import 'package:weather_app/core/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/login/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/dont_have_account_widget.dart';

class SigninViewBody extends StatefulWidget {

  const SigninViewBody({super.key}); // Constructor

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 70.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 75),
              CustomTextFormField(
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  onSaved: (value) {
                    email = value!;
                  }),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Sign In',
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
