# StringProcessingTask
Please follow the following link before you proceed further.(https://flutter.dev/docs/get-started/install/)

**You will need to have the followings installed or downloaded:**
* Flutter SDK
* Android Studio/VScode (Web App)

**Run the following commands to use the latest version of the Flutter SDK from the beta channel and enable web support:**
* flutter channel beta
* flutter upgrade
* flutter config --enable-web

**Steps to run the Web App:**
1. Download/Clone the wordDefinitionTask github repo
1. Open the folder in VSCode/Android Studio
1. Open the flutter_app folder and from this folder, run 'flutter pub get' on the Terminal
1. Run and Debug the project (F5 on vs code)(Ignore the warning about build errors if it shows up)
1. You'll land in the Home Page with two buttons - Open Text(text is input directly as a variable) and Open Text From .Docx Asset(Text is loaded from a .docx file in the assets folder)
1. You can click either button and it'll display a screen with text.
1. Double tap on any word for a definition
1. If the word is part of the sample json, a definition and an example are displayed
1. Otherwise the text 'Not Defined' shows up 

**Time Spent On the Project:**

Approximately 8 hrs. It took me a while to try the various options of loading text from .pdf and .docx files

**Improvements/Areas I'd like to work on further:**
1. Add some unit, widget and integration tests
1. Add the functionality to load text from URL in addition to local asset
1. Instead of loading the .json everytime a word is clicked, I would like to explore the option of loading it just once per build/querying it from a cloud Database collection instead of a local .json
