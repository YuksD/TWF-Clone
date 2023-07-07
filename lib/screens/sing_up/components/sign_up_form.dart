import 'package:flutter/material.dart';
import 'package:twf_clone/screens/complete_profile/complete_profile_screen.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constans.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirm_password = "";
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
      child: Column(children: [
        buildEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildConfPasswordFormField(),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(40)),
        DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState?.validate() ?? true) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            })
      ]),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue ?? "",
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
        return;
        // if (value.isNotEmpty && errors.contains(kPassNullError)) {
        //   setState(() {
        //     errors.remove(kPassNullError);
        //   });
        // } else if ((value.length) >= 8 && errors.contains(kShortPassError)) {
        //   setState(() {
        //     errors.remove(kShortPassError);
        //   });
        // }
        // return;
      },
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "";
        } else if (password != confirm_password) {
          addError(error: kMatchPassError);
          return "";
        }
        // if (value?.isEmpty ?? true && !errors.contains(kPassNullError)) {
        //   // şifre girilmediyse ve error listesi boşsa
        //   setState(() {
        //     errors.add(kPassNullError);
        //   });
        //   return "";
        // } else if ((value?.length ?? 0) < 8 && !errors.contains(kShortPassError)) {
        //   setState(() {
        //     errors.add(kShortPassError);
        //   });
        //   return "";
        // }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffisIcon(
            svgIcon: "assets/icons/lock.svg",
          )), //11.19
    );
  }

  TextFormField buildPasswordFormField() {
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
        password = value;
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
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffisIcon(
            svgIcon: "assets/icons/lock.svg",
          )), //11.19
    );
  }

  TextFormField buildEmailFormField() {
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
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffisIcon(
            svgIcon: "assets/icons/mail.svg",
          )), //11.19
    );
  }
}
