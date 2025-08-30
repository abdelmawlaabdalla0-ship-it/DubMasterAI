import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/Get%20all%20txet%20to%20speech%20Cubite.dart';
import 'package:dubmasterai/Cubites/Rename/rename_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RenameDialogWidget extends StatelessWidget {
  final String audioId;
  final String currentName;

  const RenameDialogWidget({
    super.key,
    required this.audioId,
    required this.currentName,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController renameController =
    TextEditingController(text: currentName);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<RenameCubit, RenameState>(
          listener: (context, state) {
            if (state is RenameSucessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Renamed successfully")),
              );
              BlocProvider.of<AudioCubit>(context).fetchAudios();
            } else if (state is RenameFalierState) {
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
                  "Rename Audio",
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
                      onPressed: state is RenameLoadingstateState
                          ? null
                          : () {
                        final newName = renameController.text;
                        if (newName.isNotEmpty) {
                          BlocProvider.of<RenameCubit>(context)
                              .Rename(newname: newName, ID: audioId);
                        }
                      },
                      child: state is RenameLoadingstateState
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
