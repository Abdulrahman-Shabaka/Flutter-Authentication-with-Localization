import 'package:flutter/material.dart';
import 'package:auth_with_localization/modules/login/login.dart';
import 'package:auth_with_localization/modules/registration/registration.dart';
import 'package:auth_with_localization/provider/local_provider.dart';
import 'package:auth_with_localization/shared/components/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auth_with_localization/shared/components/variables/variables.dart';
import 'package:auth_with_localization/shared/styles/colors/colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class IntroScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  IntroScreen({Key? key}) : super(key: key);
  Locale langEn = const Locale('en');
  Locale langAr = const Locale('ar');
  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: customImgWithText(
                      imgUrl:
                          'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg',
                      text: l10n.welcomeToBo3lozCompany),
                ),
                const SizedBox(
                  height: 100,
                ),
                customtMaterialButton(
                  text: l10n.createAccount,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                  },
                  color: mainDColor,
                  textColor: white,
                  context: context,
                ),
                const SizedBox(
                  height: 30,
                ),
                customtMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  text: l10n.login,
                  color: white,
                  textColor: white,
                  context: context,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextButton(
                      onPressed: () {
                        final provider =
                            Provider.of<LocalProvideer>(context, listen: false);
                        provider.setlocale(langEn);
                        isRtl = false;
                      },
                      text: ('English'),
                    ),
                    customTextButton(
                      onPressed: () {
                        final provider =
                            Provider.of<LocalProvideer>(context, listen: false);
                        provider.setlocale(langAr);
                        isRtl = true;
                      },
                      text: ('عربي'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
