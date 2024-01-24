import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  String selectedOption = '';
  bool quizStarted = false; // Add this variable

  List<Question> questions = [
    Question(
      questionText: 'Your compatible friend says they are stuck in another country and tells you to send money home and promises to pay you what will you say ?',
      options: ['I can help', 'Are you sure'],
      correctOptionIndex: 1,
      feedback: 'Definitely no no no never send money no matter what the situation is if anyone ever asks you to send money please tell us immediately',
    ),
    Question(
      questionText: 'You and your compatible friend live near each other they ask for your address to see how close you live to each other?',
      options: ['what will you do refuse you dont give the address to a stranger ', 'Tell them its no big deal'],
      correctOptionIndex: 1,
      feedback: 'Refuse You do not give your address to strangers Do not give personal information to people you do not know well',
    ),
     Question(
      questionText: 'You guys are talking about your love of gaming, you think you saw your match at the gym and want to ask where they practice, what would you say?',
      options: ['Ask them maybe you will meet just let it be', 'Its so vague, theres no need to be curious about it'],
      correctOptionIndex: 1,
      feedback: 'Its their business. Be careful when asking someone you havent met about their daily routine. Respect their privacy!',
    ),
     
     Question(
      questionText: 'After a great date, youre thinking of sending an intimate selfie to your match even though you two have never talked about nudity ?',
      options: ['send now in You are great', 'Lets talk about it slowly first'],
      correctOptionIndex: 1,
      feedback: 'Dont send messages outside the app. We take harassment very seriously. If you send inappropriate content, you may be reported or banned.',

    ),
    
     Question(
      questionText: 'Person you are chatting with abroad asks if they can meet you No how will you respond',
      options: ['Sure', 'theres no way we need to video chat first'],
      correctOptionIndex: 1,
      feedback: 'You need to meet by video chat first. If you are compatible in a foreign country, meeting in real life without going over the phone first is a red flag.',

    ),
     Question(
      questionText: 'If you happen to see a profile with sexually explicit language in the bio, what will you do if it makes you feel uncomfortable?',
      options: ['Scan that file left and continue to ignore it', 'Report it to them as unacceptable'],
      correctOptionIndex: 1,
      feedback: 'Always Report offensive behavior reporting is confidential and keeps the app safer for everyone',
    
    ),
     Question(
      questionText: 'You accidentally see the profile and the person in the photo is clearly not 18 What will you do?',
      options: ['Report them minors are not allowed to participate', 'Burn that file and continue to pay no attention'],
      correctOptionIndex: 1,
      feedback: 'you must be 18 years or older to use Hapind end we want Hapind for adults only if encounter someone under 18 Report immediately',
    ),
     Question(
      questionText: 'If you are compatible, what will you do if you offer sex-for-money services?',
      options: ['Cancel the match and report it against the rules', 'Ignoring that is not worth talking about'],
      correctOptionIndex: 1,
      feedback: 'Report them whether selling or buying solicitation in any form is strictly prohibited and we want to know about this immediately',
    ),
    // Add more questions...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety test when dating online', style: TextStyle(color: const Color.fromARGB(255, 255, 7, 7)),),
          automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!quizStarted) // Show "Start" button if quiz not started
            Column(
              children: [
                Text(
                  'Safety is our top priority. And to keep a safer environment for our community, we need everyone to know how to behave appropriately. In case you need it, here are some test questions to help remind you of some of the How to put safety first ?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, 
                    color: const Color.fromARGB(255, 5, 5, 5), 
                    fontStyle: FontStyle.italic, 
                    letterSpacing: 1, 
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      quizStarted = true;
                    });
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 226, 113, 47)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 244, 245, 246)),
                  ),
                ),
              ],
            ),
          if (quizStarted)
            Column(
              children: [
                Text(
                  questions[currentQuestionIndex].questionText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 178, 90, 55),
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.4,
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  children:
                      questions[currentQuestionIndex].options.map((option) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          showAnswerDialog(
                              questions[currentQuestionIndex].feedback);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedOption == option
                              ? Color.fromARGB(255, 173, 240, 223)
                              : Colors.transparent,
                          border: Border.all(
                            color: selectedOption == option
                                ? Color.fromARGB(255, 149, 240, 217)
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void moveToNextQuestion() {
    setState(() {
      selectedOption = ''; // Reset selected option for the next question
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Show quiz results or navigate to a different screen
        // In this case, navigate back to the home screen
        Navigator.pop(context);
      }
    });
  }

  void showAnswerDialog(String feedback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informed about the answer'),
          content: Column(
            children: [
              Text('You selected: $selectedOption'),
              SizedBox(height: 16),
              Text(feedback),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                moveToNextQuestion();
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}

class Question {
  String questionText;
  List<String> options;
  int correctOptionIndex;
  String feedback;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.feedback,
  });
}
