import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/TextViewPage.dart';

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
                        String contentsDoc = 'The researchers found that word recall was greatest when the participants read aloud to themselves.\n\n"This study confirms that learning and memory benefit from active involvement," says study author Colin M. MacLeod, a professor and chair of the Department of Psychology at the University of Waterloo.';
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
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TextViewPage(contents:contentsDoc)),
                        );
                      },
                    ),
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