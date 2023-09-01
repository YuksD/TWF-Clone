import 'package:flutter/material.dart';
import 'package:twf_clone/components/custom_suffix_icon.dart';
import 'package:twf_clone/components/default_button.dart';
import 'package:twf_clone/components/form_error.dart';
import 'package:twf_clone/constans.dart';
import 'package:twf_clone/screens/forgot_password/forgot_password_screen.dart';
import 'package:twf_clone/screens/login_success/login_success_screen.dart';
import 'package:twf_clone/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFromField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFromField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value ?? false;
                      });
                    }),
                const Text("Beni hatırla"),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    "Şifremi unuttum",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
                text: "Devam",
                press: () {
                  errors.clear();
                  if (_formKey.currentState?.validate() ?? true) {
                    _formKey.currentState?.save();
                    //if all are valid then go to success screen
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                })
          ],
        ));
  }

  TextFormField buildPasswordFromField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue ?? "",
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if ((value.length) >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value?.isEmpty ?? true && !errors.contains(kPassNullError)) {
          // şifre girilmediyse ve error listesi boşsa
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if ((value?.length ?? 0) < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Şifre",
          hintText: "Şifrenizi giriniz",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffisIcon(
            svgIcon: "assets/icons/lock.svg",
          )), //11.19
    );
  }

  TextFormField buildEmailFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue ?? "",
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },

      validator: (value) {
        if (value?.isEmpty ?? true && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value ?? "") &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
          // labelStyle: TextStyle(color: kPrimaryColor),
          labelText: "Eposta",
          hintText: "Eposta adresinizi giriniz",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffisIcon(
            svgIcon: "assets/icons/mail.svg",
          )), //11.19
    );
  }
}
