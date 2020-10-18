import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/TextViewPage.dart';

/*
 * This class is the Home Page Widget that shows up when the app is run
 * It has two buttons, Open Text and Open Text from .docx Asset
 * OnTap, The Open Text Button has a defualt text string assigned to it and a new widget with this text is displayed. 
 * OnTap, The Open Text from .docx Asset copies the text from a local .docx and displays this text in a new widget
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Word Definitions Demo", textAlign: TextAlign.center)
        ),
      ),
      body: Center(
        child:Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      child: Text("Open Text"),
                      onPressed: () {
                        String contentsDoc = "The researchers found that word recall was greatest when the participants read aloud to themselves.\n\“This study confirms that learning memory benefit from active involvement,\” says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.";
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TextViewPage(contents:contentsDoc)),
                        );
                      }
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.amber,
                      child: Text("Open Text from .docx Asset"),
                      onPressed: () async{
                        String contentsDoc = await rootBundle.loadString('paragraph.docx');
                        print(contentsDoc);
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TextViewPage(contents:contentsDoc)),
                        );
                      },
                    ),
                    /*
                      Below is my attempt to read the text from a .docx URL and store it to the app and display as Text
                    */
                    // SizedBox(height: 20.0),
                    // RaisedButton(
                    //   color: Colors.amber,
                    //   child: Text("Open Text from .docx URL"),
                    //   onPressed: () async{
                    //     Future<dynamic> content = HttpClient().getUrl(Uri.parse('https://drive.google.com/file/d/1ArcHLrhxJS4xNHYjzoMClRTsFTW3GDm9/view?usp=sharing')).then((HttpClientRequest request) => request.close()).then((HttpClientResponse response) => response.pipe(new File('foo.txt').openWrite()));
                    //     String contentsDoc = await content;
                    //     Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => DocViewPage(contents:contentsDoc)),
                    //     );
                    //   }
                    // ),
                  ]
          ),
        ),
      ),
    );
  }
}