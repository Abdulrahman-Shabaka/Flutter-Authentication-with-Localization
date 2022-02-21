import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:auth_with_localization/shared/components/variables/variables.dart';
import 'package:auth_with_localization/shared/styles/colors/colors.dart';

Widget customTextField({
  @required String? hint,
  @required TextInputType? keyboardType,
  @required TextEditingController? controller,
  bool isPassword = false,
  Widget? sufIcon,
  String Function(String? value)? validate,
}) =>
    TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: mainDColor),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: mainLColor),
          suffixIcon: sufIcon,
          suffixIconColor: mainLColor),
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      validator: validate,
    );

Widget mainText({@required String? text}) => Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        text!,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: mainDColor,
            letterSpacing: 1.0),
      ),
    );

Widget lableText({@required String? text}) => Text(
      text!,
      style: TextStyle(color: mainDColor),
    );

Widget customtMaterialButton({
  required Function()? onPressed,
  @required String? text,
  bool withIcon = false,
  required Color? color,
  required Color? textColor,
  required BuildContext? context,
}) =>
    Center(
      child: SizedBox(
        height: MediaQuery.of(context!).size.height * .06,
        width: MediaQuery.of(context).size.width * .6,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [mainDColor, mainLColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: color!.withOpacity(.4),
                  offset: const Offset(10.0, 10.0),
                  blurRadius: 10.0),
            ],
          ),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: onPressed,
            child: withIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          text!,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.height * .02),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .04,
                        width: MediaQuery.of(context).size.height * .04,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                          Icons.arrow_forward,
                          color: mainDColor,
                          size: MediaQuery.of(context).size.height * .035,
                        ),
                      ),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      text!,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * .025,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );

Widget customTextButton(
        {@required String? text, required Function() onPressed}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(color: mainDColor),
      ),
    );

Widget customImgWithText({required String? imgUrl, required String? text}) =>
    Column(
      children: <Widget>[
        Container(
          width: 270,
          height: 380,
          margin: const EdgeInsets.only(top: 100.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: mainLColor.withOpacity(.4),
                  offset: const Offset(6.0, 10.0),
                  blurRadius: 20.0),
            ],
            image: DecorationImage(
              image: NetworkImage(imgUrl!),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: const Alignment(0.1, 1.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blueGrey.withOpacity(0.8),
              ),
              child: Text(
                text!,
                style: TextStyle(
                    color: white, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );

Widget backGroundTop({required BuildContext context}) {
  return Positioned(
    right: MediaQuery.of(context).size.width / 4,
    top: MediaQuery.of(context).size.width / 4,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [mainDColor, mainLColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ),
  );
}

Widget backGroundBottom({required BuildContext context}) {
  return Positioned(
    left: MediaQuery.of(context).size.height / 4,
    top: MediaQuery.of(context).size.height / 4,
    child: Container(
      child: const Center(),
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [mainDColor, mainLColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ),
  );
}

Widget sideMenu(
    {required BuildContext context,
    required Widget sideMenuItems,
    required String sideMenuLable}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            sideMenuLable,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [mainDColor, mainLColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        sideMenuItems,
      ],
    ),
  );
}

Widget testCard({required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width * .3,
    height: MediaQuery.of(context).size.width * .3,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [mainDColor, mainLColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage('lib/shared/images/liver.jpeg'),
            width: 80,
          ),
        ),
        Column(
          children: [
            Text(
              'liver test',
              style: TextStyle(color: white, fontWeight: FontWeight.w800),
            ),
            Text('price: 80 LE',
                style: TextStyle(color: white, fontWeight: FontWeight.w800))
          ],
        )
      ],
    ),
  );
}

PreferredSizeWidget customAppBar(
    {required String previousPageName, required String title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(130.0),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [mainDColor, mainLColor]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(previousPageName),
            centerTitle: false,
            titleSpacing: -10,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              title,
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget searchBar(
    {required BuildContext context,
    required TextEditingController searchController,
    required String hintText}) {
  return AnimSearchBar(
    onSuffixTap: null,
    width: MediaQuery.of(context).size.width,
    textController: searchController,
    rtl: isRtl,
    helpText: hintText,
  );
}
