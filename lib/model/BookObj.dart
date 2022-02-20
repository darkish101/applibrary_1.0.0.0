class BookObj {
  final Book_ID;
  final Book_Name;
  final Book_Description;
  final Author_Name;
  final Genre;
  final Book_img;
  final Pdf_URL;
  final has_Audio;

  BookObj(
      {required this.Book_ID,
      required this.Book_Name,
      required this.Book_Description,
      required this.Book_img,
      required this.Author_Name,
      required this.Genre,
      required this.Pdf_URL,
      required this.has_Audio});

  factory BookObj.fromjson(Map<String, dynamic> parsedjson) {
    return BookObj(
      Book_ID: parsedjson["Book_ID"],
      Book_Name: parsedjson["Book_Name"],
      Book_Description: parsedjson["Book_Description"],
      Author_Name: parsedjson["Author_Name"],
      Genre: parsedjson["Genre"],
      Book_img: parsedjson["Book_img"],
      Pdf_URL: parsedjson["Pdf_URL"],
      has_Audio: parsedjson["has_Audio"],
    );
  }
}
