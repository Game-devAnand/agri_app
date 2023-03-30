import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getAnswer(String question) async {
  const endpoint = 'https://api.openai.com/v1/engines/davinci-codex/completions';
  const apiKey = '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'; // Replace with your OpenAI API key

  final response = await http.post(Uri.parse(endpoint),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $apiKey'},
      body: jsonEncode({
        'prompt': '$question\nAnswer:',
        'temperature': 0.5,
        'max_tokens': 200,
        'top_p': 1,
        'n': 1,
        'stop': ['\n']
      }));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final answer = data['choices'][0]['text'].toString();
    return answer;
  } else {
    const answer = "Failed to get suggestion sever is busy,Try another time";
    return answer;
    //throw Exception('Failed to get answer');
  }
}