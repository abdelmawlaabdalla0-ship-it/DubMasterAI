import 'package:dubmasterai/Cubites/Get%20all%20video/Get%20all%20video%20cubite.dart';
import 'package:dubmasterai/Cubites/Rename%20Subtitle/rename_subtitle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RenameSubtitleDialog extends StatelessWidget {
  final String subtitleId;
  final String currentName;

  const RenameSubtitleDialog({
    super.key,
    required this.subtitleId,
    required this.currentName,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController renameController = TextEditingController(text: currentName);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<RenameSubtitleCubit, RenameSubtitleState>(
          listener: (context, state) {
            if (state is RenameSubtitleSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Subtitle renamed successfully")),
              );

              BlocProvider.of<SubtitledVideoCubit>(context).fetchSubtitledVideos();
            } else if (state is RenameSubtitleFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Rename failed")),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Rename Subtitle",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: renameController,
                  decoration: InputDecoration(
                    labelText: "New name",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel", style: TextStyle(color: Colors.grey[700])),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: state is RenameSubtitleLoading
                          ? null
                          : () {
                        final newName = renameController.text;
                        if (newName.isNotEmpty) {
                          BlocProvider.of<RenameSubtitleCubit>(context).renameSubtitle(id: subtitleId, newName: newName);
                        }
                      },
                      child: state is RenameSubtitleLoading
                          ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : Text("Rename"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
