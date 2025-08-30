import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Cubite.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dubmasterai/Widgets/FileuploadsubtitleBody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/Cubites/pieck Video/pieck Video Sate.dart';
import 'package:dubmasterai/Widgets/video OFline Body.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:dubmasterai/Widgets/Video online subtilte.dart';
class FileUploadDubbing extends StatefulWidget {


  @override
  State<FileUploadDubbing> createState() => _FileUploadsubtitleState();
}

class _FileUploadsubtitleState extends State<FileUploadDubbing> {

  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Upload files"),
              Spacer(flex: 2),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: DottedBorder(
                  dashPattern: [6, 3],
                  strokeWidth: 3,
                  color: Colors.grey,
                  borderType: BorderType.Rect,
                  radius: Radius.circular(12),
                  child:BlocConsumer<pieckvideocubite, pieckVideoStates>(
                    builder: (context, state) {
                      if (state is pieckVideosuccees) {
                        return Videopickedplay();
                      } else if (state is pieckVideofalier) {
                        return Column(
                          children: [
                            SizedBox(height: 250),
                            Text(
                              "Video not selected please select video!",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 40),
                            Center(child: FileuploadsubtitleBody()),
                          ],
                        );
                      } else if (state is UplodVideosucessState) {
                        return VideopickedplayONLine(videourl: state.VideoUrl);
                      } else if (state is UplidVideoFalierstate){
                        return Column(
                          children: [
                            SizedBox(height: 250),
                            Text(
                              "Video not selected please select video!",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 40),
                            Center(child:FileuploadsubtitleBody()),
                          ],
                        );



                      }

                      else if (state is pieckVideoloading || state is UplodVideoLoadingState) {
                        return Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballPulse,
                              colors: const [Colors.lightBlue],
                              strokeWidth: 2,
                              backgroundColor: Colors.transparent,
                              pathBackgroundColor: Colors.lightBlue,
                            ),
                          ),
                        );
                      } else {
                        return FileuploadsubtitleBody();
                      }
                    },
                    listener: (context, state) {

                    },
                  ),


                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      BlocProvider.of<pieckvideocubite>(context).uplodVideo();

                    },
                    child: Text("Video Dubbing"),
                  ),
                ],
              ),
            ],
          ),
        ),


      );
  }
}
