import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/Cubites/Theam cubite/Theam App States.dart';
class TheamCubite extends Cubit<TheamApp>{
 TheamCubite():super(Statelithg());
  bool themapp=true;
  void swtichtheam(){
emit(Statelithg() );
    themapp =  ! themapp;
    emit(Statedrak());
  }
}