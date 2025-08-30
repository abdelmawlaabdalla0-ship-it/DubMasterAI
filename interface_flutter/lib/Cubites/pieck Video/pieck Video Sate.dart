abstract class pieckVideoStates{}
class pieckinitialState extends pieckVideoStates{}
 class pieckVideoloading extends pieckVideoStates{}
 class pieckVideosuccees extends pieckVideoStates{}
 class pieckVideofalier extends pieckVideoStates{}
class UplodVideoLoadingState extends pieckVideoStates {}
class UplodVideosucessState extends pieckVideoStates {
 String VideoUrl;
 UplodVideosucessState({required this.VideoUrl});
}
class UplidVideoFalierstate extends pieckVideoStates{
 String errmasge;
 UplidVideoFalierstate({required this.errmasge});

}


