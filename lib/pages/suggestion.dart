import 'package:flutter/material.dart';
import 'package:iedc_submit_agri/chat-api.dart';
import 'package:iedc_submit_agri/datamodel.dart';

class SuggestionPage extends StatefulWidget {
  late CropModel data;
  SuggestionPage({required this.data,Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState(data: data);
}

class _SuggestionPageState extends State<SuggestionPage> {


  final  List<CardInfo> suggistionList= [];
  late CropModel data;
  _SuggestionPageState({required this.data});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Agri"),
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height - 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                CardInfo(ans: data.apiChatAns,),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: SizedBox( width:300 ,child: TextField()),
      //       ),
      //       IconButton(
      //         onPressed: (){}, icon: const Icon(Icons.send_rounded),
      //
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class CardInfo extends StatelessWidget {
  late String ans;
  CardInfo({required this.ans,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child:Text('suggestions : ${ans}'),
          ),
        ),
      ),
    );
  }
}

