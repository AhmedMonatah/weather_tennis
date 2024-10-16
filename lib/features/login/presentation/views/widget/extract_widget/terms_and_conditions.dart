import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utiles/app_color.dart';
import 'package:weather_app/core/utiles/app_text_styles.dart';
import 'package:weather_app/core/utiles/terms_and_conditional.dart';
import 'package:weather_app/features/login/presentation/views/widget/extract_widget/custome_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: CustomCheckBox(
            onChecked: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            },
            isChecked: isTermsAccepted,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account, you agree to the ',
                  style: TextStyles.semiBold13.copyWith(
                    color:  AppColor.CondtionInSign,
                  ),
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColor.gradient2,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showDialog(context, 'Terms and Conditions',
                          TermsAndConditions.termsForApp);
                    },
                ),
                const TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13,
                ),
                TextSpan(
                  text: 'and Privacy Policy',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColor.gradient2,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _showDialog(context, 'Privacy Policy',
                          'Here is the privacy policy...');
                    },
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  // Function to show a dialog with custom content
  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Fake terms and conditions content
 
}
