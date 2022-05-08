import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/widgets/border_container.dart';

class BuyProModeView extends StatelessWidget {
  BuyProModeView({Key? key}) : super(key: key);

  String backgroundImageLink =
      'https://firebasestorage.googleapis.com/v0/b/wallpapers-cde00.appspot.com/o/20467774.jpg?alt=media&token=e2a97b35-18a0-4d72-b215-d7edc4cd9f7e';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: getBackgrounDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                child: buildBackButton(context),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 35),
              buildText(),
              const SizedBox(height: 50),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration getBackgrounDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(backgroundImageLink),
      ),
    );
  }

  Widget buildText() {
    return Text(
      'Buy pro mode for a better and ad-free experience.',
      style: GoogleFonts.ubuntu(
        fontSize: 35,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () =>
          LaunchReview.launch(androidAppId: 'com.amongus.wallpapers'),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          'Buy For a Little Price',
          style: GoogleFonts.ubuntu(fontSize: 22),
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return BorderContainer.all(
      radius: 15,
      margin: const EdgeInsets.only(top: 25, left: 10),
      color: Colors.black.withOpacity(.3),
      child: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => context.pop,
      ),
    );
  }
}
