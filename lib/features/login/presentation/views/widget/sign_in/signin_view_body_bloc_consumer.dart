import 'package:weather_app/core/helper_function/build_error_bar.dart';
import 'package:weather_app/core/widgets/custom_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/views/widget/home/search_view/search_view.dart';
import 'package:weather_app/features/login/presentation/views/widget/sign_in/sign_view_body.dart';
import '../../../cubits/signin_cubit/signin_cubit.dart';
class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(
            context,
            SearchView.routeName,
          );
        }

        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        // Provide a simple default WeatherModel instance
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody()
        );
      },
    );
  }
}
