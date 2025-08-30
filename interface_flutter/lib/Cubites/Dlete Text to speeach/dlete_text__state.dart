import 'package:flutter/material.dart';

abstract class DeleteTTSFileState {}

class DeleteTTSFileInitial extends DeleteTTSFileState {}

class DeleteTTSFileLoading extends DeleteTTSFileState {}

class DeleteTTSFileSuccess extends DeleteTTSFileState {}

class DeleteTTSFileFailure extends DeleteTTSFileState {}
