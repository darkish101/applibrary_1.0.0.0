import 'package:flutter/material.dart';

class IBook extends StatefulWidget {
  const IBook({Key? key}) : super(key: key);

  @override
  _IBookState createState() => _IBookState();
}

class _IBookState extends State<IBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f6ec),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Main Book page"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text("إسم الكتاب"),
                      Text("Book Name"),
                      Text("المؤلف"),
                      Text("ِAuthor"),
                      Text("التصنيف"),
                      Text("Genre"),
                    ],
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://a-alqasim.com/wp-content/uploads/2021/04/0001AthkaarAlQasim.jpg"),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      minimumSize: Size(50, 30),
                    ),
                    child: Text("تحميل"),
                    onPressed: () => Navigator.pushNamed(context, 'BookView'),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      minimumSize: Size(50, 30),
                    ),
                    child: Text("إستماع"),
                    onPressed: () => Navigator.pushNamed(context, 'BookView'),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      minimumSize: Size(50, 30),
                    ),
                    child: Text("قراءة"),
                    onPressed: () => Navigator.pushNamed(context, 'BookView'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("عن الكتاب"),
            Text("Description"),
          ],
        ),
      ),
    );
  }
}
