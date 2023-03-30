import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Agri"),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.height - 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),
              cardTrial(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox( width:300 ,child: TextField()),
            ),
            IconButton(
              onPressed: (){}, icon: const Icon(Icons.send_rounded),
              
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardTrial(){
  return const Card(
    color:  Colors.greenAccent,
    child: SizedBox(
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:Text("test"),
      ),
    ),
  );
}