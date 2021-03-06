import 'package:flutter/material.dart';
import 'package:auth_with_localization/modules/login/login.dart';
import 'package:auth_with_localization/shared/components/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auth_with_localization/provider/local_provider.dart';
import 'package:auth_with_localization/shared/components/variables/variables.dart';
import 'package:auth_with_localization/shared/styles/colors/colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegistrationScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Locale langEn = const Locale('en');
  Locale langAr = const Locale('ar');

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(90, 97, 117, 1),
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainText(
                    text: l10n.letMeGetToKnowYou,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  lableText(text: l10n.name),
                  customTextField(
                    sufIcon: Icon(
                      Icons.person_outline,
                      color: mainLColor,
                    ),
                    hint: l10n.whatShouldICallYou,
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return l10n.nameConNotBeEmptyPleaseEnterYourName;
                      }
                      return '';
                    },
                  ),
                  const SizedBox(height: 40),
                  lableText(text: l10n.email),
                  customTextField(
                    sufIcon: Icon(Icons.alternate_email, color: mainLColor),
                    hint: l10n.itIsMeatMailDotCom,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return l10n
                            .emailCanNotBeEmptyPleaseEnterYourEmailAddress;
                      }
                      return '';
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  lableText(text: l10n.password),
                  customTextField(
                    hint: l10n.ourLitleSecret,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    isPassword: true,
                    sufIcon: Icon(Icons.lock_outline, color: mainLColor),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return l10n
                            .passwordCanNotBeEmptyPleaseEnterYourPassword;
                      }
                      return '';
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  customtMaterialButton(
                    text: l10n.createAccount,
                    withIcon: true,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // ignore: avoid_print
                        print(emailController.text);
                        // ignore: avoid_print
                        print(passwordController.text);
                      }
                    },
                    color: mainDColor,
                    textColor: white,
                    context: context,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      lableText(text: l10n.alreadyHaveAccount),
                      customTextButton(
                          text: l10n.login,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTextButton(
                        onPressed: () {
                          final provider = Provider.of<LocalProvideer>(context,
                              listen: false);
                          provider.setlocale(langEn);
                          isRtl = false;
                        },
                        text: ('English'),
                      ),
                      customTextButton(
                        onPressed: () {
                          final provider = Provider.of<LocalProvideer>(context,
                              listen: false);
                          provider.setlocale(langAr);
                          isRtl = true;
                        },
                        text: ('????????'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
