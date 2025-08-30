import 'package:dubmasterai/Cubites/Dlete%20Text%20to%20speeach/dlete_text__cubit.dart';
import 'package:dubmasterai/Cubites/Dlete%20Text%20to%20speeach/dlete_text__state.dart';
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/Get%20all%20txet%20to%20speech%20Cubite.dart';
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/Get%20all%20txet%20to%20speech%20States.dart';
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/audio%20Modle.dart';
import 'package:dubmasterai/Cubites/Rename/rename_cubit.dart';
import 'package:dubmasterai/Widgets/Rename%20widget.dart';
import 'package:dubmasterai/Widgets/audiuo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Speeechviwe extends StatefulWidget {
  const Speeechviwe({super.key});

  @override
  State<Speeechviwe> createState() => _SpeeechviweState();
}

class _SpeeechviweState extends State<Speeechviwe> {
  void showTransparentAudioDialog(BuildContext context, String audioUrl, String title) {
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
              title: title,
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
  void initState() {
    super.initState();
    BlocProvider.of<AudioCubit>(context).fetchAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DeleteTTSFileCubit, DeleteTTSFileState>(
        listener: (context, state) {
          if (state is DeleteTTSFileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Deleted successfully')),
            );
            context.read<AudioCubit>().fetchAudios();
          } else if (state is DeleteTTSFileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Delete failed')),
            );
          }
        },
        child: BlocBuilder<AudioCubit, AudioStates>(
          builder: (context, state) {
            if (state is AudioLoadingState) {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineScale,
                    colors: const [Colors.lightBlue],
                    strokeWidth: 2,
                  ),
                ),
              );
            } else if (state is AudioLoadedState) {
              return ListView.builder(
                itemCount: state.audioList.length,
                itemBuilder: (context, index) {
                  final AudioModel audio = state.audioList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 100,
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              audio.name,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showTransparentAudioDialog(context, audio.audioUrl, audio.name);
                                  },
                                  icon: Icon(Icons.play_arrow_outlined),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.downloading_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'Rename') {
                              showDialog(
                                context: context,
                                builder: (dialogContext) => BlocProvider.value(
                                  value: BlocProvider.of<RenameCubit>(context),
                                  child: RenameDialogWidget(
                                    audioId: audio.id,
                                    currentName: audio.name,
                                  ),
                                ),
                              );
                            } else if (value == 'Delete') {
                              context.read<DeleteTTSFileCubit>().deleteTTSFile(audio.id);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'Delete',
                              child: Text("Delete"),
                            ),
                            PopupMenuItem(
                              value: 'Rename',
                              child: Text("Rename"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is AudioErrorState) {
              return Center(child: Text("have a  Error"));
            } else {
              return Center(child: Text("No audios available."));
            }
          },
        ),
      ),
    );
  }
}
