
import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'widgets/idea_card.dart';

void main() => runApp(ArtMuseApp());

class ArtMuseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArtMuse Agent',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.deepPurple.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: IdeaScreen(),
    );
  }
}

class IdeaScreen extends StatefulWidget {
  @override
  _IdeaScreenState createState() => _IdeaScreenState();
}

class _IdeaScreenState extends State<IdeaScreen> {
  final moodController = TextEditingController();
  final styleController = TextEditingController();
  String idea = '';
  bool loading = false;

  void getIdea() async {
    setState(() => loading = true);
    try {
      final result = await fetchIdea(moodController.text, styleController.text);
      setState(() => idea = result);
    } catch (e) {
      setState(() => idea = 'Error: ${e.toString()}');
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ArtMuse Agent',style: TextStyle(color:Colors.deepPurple,),
        ),
        centerTitle: true,
        ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: moodController, decoration: InputDecoration(labelText: 'what is your Mood today?')),
            SizedBox(height: 10),
            TextField(controller: styleController, decoration: InputDecoration(labelText: 'idea Style you want')),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: getIdea,
              child: Text(' Generate Idea', style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
            SizedBox(height: 30),
            loading
                ? CircularProgressIndicator()
                : idea.isNotEmpty
                    ? IdeaCard(idea: idea)
                    : Container(),
          ],
        ),
      ),
    );
  }
}