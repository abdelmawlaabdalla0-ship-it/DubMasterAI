class Dleteprofilestates {}
class Dleteprofileinitlstate extends Dleteprofilestates {}
class DleteprofileLoadingstate extends   Dleteprofilestates{}
class DleteprofilesSucessStates extends  Dleteprofilestates{}
class DleteprofileFailerStates extends   Dleteprofilestates{
  String errmassge;
  DleteprofileFailerStates({required this.errmassge });
}