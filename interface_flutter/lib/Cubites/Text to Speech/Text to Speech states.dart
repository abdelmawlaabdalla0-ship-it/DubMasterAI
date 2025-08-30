class TexttoSpeechStats {}

class TexttoSpeechitialState extends TexttoSpeechStats {}

class TexttoSpeechlOadingState extends TexttoSpeechStats {}

class TexttoSpeechSucessState extends TexttoSpeechStats {
 final String audioUrl;
 TexttoSpeechSucessState({required this.audioUrl});
}

class TexttoSpeechfalierState extends TexttoSpeechStats {
 String errmassge;
 TexttoSpeechfalierState({required this.errmassge});
}
