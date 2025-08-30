import 'package:dubmasterai/Cubites/Delete/delete_subtitle_cubit.dart';
import 'package:dubmasterai/Cubites/Rename%20Subtitle/rename_subtitle_cubit.dart';
import 'package:dubmasterai/Widgets/VideoDialogWidget.dart';
import 'package:dubmasterai/Widgets/rename%20subtitle%20widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:dubmasterai/Cubites/Get all video/Get all video cubite.dart';
import 'package:dubmasterai/Cubites/Get all video/Get all video states.dart';


class SubtitleView extends StatefulWidget {
  @override
  State<SubtitleView> createState() => _SubtitleViewState();
}

class _SubtitleViewState extends State<SubtitleView> {
  @override
  void initState() {
    super.initState();
    context.read<SubtitledVideoCubit>().fetchSubtitledVideos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteSubtitleCubit, DeleteSubtitleState>(
      listener: (context, state) {
        if (state is DeleteSubtitleSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Subtitle deleted successfully")));
          context.read<SubtitledVideoCubit>().fetchSubtitledVideos();
        } else if (state is DeleteSubtitleFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete subtitle")));
        }
      },
      child: BlocBuilder<SubtitledVideoCubit, SubtitledVideoState>(
        builder: (context, state) {
          if (state is SubtitledVideoLoading) {
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
          } else if (state is SubtitledVideoSuccess) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.videos.length,
                  itemBuilder: (context, index) {
                    final video = state.videos[index];
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
                                video.name,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: VideoDialogWidget(videoUrl: video.videoUrl),
                                      ),
                                    ),
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
                              if (value == 'delete') {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Confirm Deletion"),
                                    content: Text("Are you sure you want to delete this subtitle?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.read<DeleteSubtitleCubit>().deleteSubtitle(id: video.id);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Delete", style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (value == 'rename') {
                                showDialog(
                                  context: context,
                                  builder: (context) => BlocProvider.value(
                                    value: context.read<RenameSubtitleCubit>(),
                                    child: RenameSubtitleDialog(
                                      subtitleId: video.id,
                                      currentName: video.name,
                                    ),
                                  ),
                                );
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(value: 'delete', child: Text("Delete")),
                              PopupMenuItem(value: 'rename', child: Text("Rename")),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(child: Text("No videos available."));
          }
        },
      ),
    );
  }
}
