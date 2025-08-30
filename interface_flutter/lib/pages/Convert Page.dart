import 'package:dubmasterai/Widgets/audiuo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dubmasterai/Widgets/Menu convert page.dart';
import 'package:dubmasterai/Cubites/Text to Speech/Text to Speech states.dart';
import 'package:dubmasterai/Cubites/Text to Speech/Text to Speech Cubite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class convertpage extends StatefulWidget {
  @override
  State<convertpage> createState() => _convertpageState();
}

class _convertpageState extends State<convertpage> {
  GlobalKey<FormState> fromstate = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  final controlaraudio = TextEditingController();


  String selectedLanguage = "English";

  String getLanguageCode(String lang) {
    switch (lang) {
      case "Arabic":
        return "ar";
      case "English":
        return "en";
      default:
        return "en";
    }
  }

  void showTransparentAudioDialog(BuildContext context, String audioUrl) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: AudioPlayerWidget(
              audioUrl: audioUrl,
              title: "🎧",
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromstate,
      child: BlocProvider(
        create: (context) => TexttoSpeech(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 3,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Image.asset("assets/mic logo.png"),
                  ),
                ),
                Divider(
                  thickness: 1.6,
                  indent: 55,
                  endIndent: 55,
                  color: Colors.blueGrey,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: TextFormField(
                      controller: controlaraudio,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Text is required";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: autovalidatemode,
                      maxLines: null,
                      expands: true,
                      textAlign: TextAlign.start,
                      onChanged: (_) => setState(() {}),

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        hintText: 'Enter Text',
                        labelText: "...... Text to speech",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20),

                 child:  Align(
                    alignment: Alignment.centerLeft,

                    child: controlaraudio.text.isNotEmpty
                        ? GestureDetector(
                      onTap: () {
                        setState(() {
                          controlaraudio.clear();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.close, size: 40),
                      ),
                    ) : SizedBox.shrink(),
                  ),
        ),




                Align(
                  alignment: Alignment.centerRight,
                  child: Menuconvertpage(
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),
                ),
                BlocConsumer<TexttoSpeech, TexttoSpeechStats>(
                  listener: (context, state) {
                    if (state is TexttoSpeechlOadingState) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => Center(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: LoadingIndicator(
                              indicatorType: Indicator.lineScale,
                              colors: const [Colors.lightBlue],
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      );
                    } else if (state is TexttoSpeechfalierState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.errmassge,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(16),
                        ),
                      );
                    } else if (state is TexttoSpeechSucessState) {
                      Navigator.pop(context);
                      showTransparentAudioDialog(context, state.audioUrl);
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (fromstate.currentState!.validate()) {
                          BlocProvider.of<TexttoSpeech>(context).sendiduo(
                            Speech: controlaraudio.text,
                            language: getLanguageCode(selectedLanguage),
                          );
                        } else {
                          autovalidatemode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 5, right: 60, left: 60),
                        child: Container(
                          width: 200,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xff616BE6),
                          ),
                          child: Text(
                            "Convert",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 9),
                Padding(
                  padding: const EdgeInsets.only(right: 60, left: 60),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xff9195A1),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(CupertinoIcons.play)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.download)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
