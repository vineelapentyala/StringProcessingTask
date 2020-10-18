# wordDefinitionTask
Please follow the following link before you proceed further.(https://flutter.dev/docs/get-started/install/macos)
You will need to have the followings installed or downloaded:
Flutter SDK
Android Studio/VScode (Web App)

Run the following commands to use the latest version of the Flutter SDK from the beta channel and enable web support:
flutter channel beta
flutter upgrade
flutter config --enable-web

Steps to run the Web App:
Download/Clone the wordDefinitionTask github repo
Open the folder in VSCode/Android Studio
Run and Debug the project (F5 on vs code)
You'll land in the Home Page with two buttons - Open Text(text is input directly as a variable) and Open Text From .Docx(Text is loaded from a .docx file in the assets folder)
You can click either button and it'll display a screen with text.
Double tap on any word for a definition
If the word is part of the sample json, a definition and an example are displayed
Otherwise the text 'Not Defined' shows up 
