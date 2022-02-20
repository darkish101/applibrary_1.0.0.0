class AudioObj {
  final Audio_ID;
  final Audio_Name;
  final Audio_URL;
  final Section_Name;
  final Description;

  AudioObj(
      {required this.Audio_ID,
      required this.Audio_Name,
      required this.Audio_URL,
      required this.Section_Name,
      required this.Description});

  factory AudioObj.fromjson(Map<String, dynamic> parsedjson) {
    return AudioObj(
      Audio_ID: parsedjson["Audio_ID"],
      Audio_Name: parsedjson["Audio_Name"],
      Audio_URL: parsedjson["Audio_URL"],
      Section_Name: parsedjson["Section_Name"],
      Description: parsedjson["Description"],
    );
  }
}
