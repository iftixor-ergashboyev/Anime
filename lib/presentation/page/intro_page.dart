import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_page.dart';

class IntroPage extends StatelessWidget {
   IntroPage({super.key});

  final _repo = LocalRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity,
            opacity: AlwaysStoppedAnimation(.7),
          ),
          Positioned(
            bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                Text("zeto", style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40))),
                const Gap(20),
                Text("Embark on animated journey like\n never before,"
                    "your gateway to the\n ultimate anime experience", textAlign: TextAlign.center, style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white
                    )
                )),
                Gap(20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                      onPressed: () => _onStart(context),
                      child: Text("Watch anime", style: GoogleFonts.poppins())
                  ),
                )],
                ),
              ))
        ],
      ),
    );
  }
  void _onStart(BuildContext context) {
    _repo.saveIntro(true).then((value) {
      Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context)
          => MainPage()), (route) => false);
    });
  }
}
