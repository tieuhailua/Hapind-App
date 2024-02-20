import 'package:flutter/material.dart';

class HapindApp extends StatefulWidget {
  @override
  _HapindAppState createState() => _HapindAppState();
}

class _HapindAppState extends State<HapindApp> {
  int currentQuestionIndex = 0;
  String selectedOption = '';
  bool quizStarted = false; // Add this variable

  List<Question> questions = [
    Question(
      questionText:
          'You were looking to make some money while dating so you asked your match if he wanted a Suga Baby. Thats cool, it ?',
      options: [
        'Certainly sounds reasonable',
        'Youve come to the wrong place for this type of date'
      ],
      correctOptionIndex: 1,
      feedback:
          'Exactly Hapind does not accept solicitations of any kind. If we see any exchange of money, we will find it and stop it immediately.',
    ),
    Question(
      questionText:
          'You want to add a little Provocation in your profile. Should you add some raunchy photos?',
      options: [
        'No problem updating your profile ',
        'Its better to be insecure than to leave room for your imagination to flourish'
      ],
      correctOptionIndex: 1,
      feedback:
          'Dont do that we support body confidence but battery drain does not accept nudity',
    ),
    Question(
      questionText:
          'You dont usually log in on Hapind. Is it okay to leave your phone number in your bio so people can contact you??',
      options: [
        'Sure, adding this information will save everyone time',
        'You should not only share social network accounts'
      ],
      correctOptionIndex: 1,
      feedback:
          'It is not allowed to share private messaging information, phone, email in profile. Only share that information when you are compatible and feel comfortable.!',
    ),

    Question(
      questionText:
          'You have some sexual habits and want to make them public to find suitable friends, you add that information to your profile ?',
      options: ['send now in You are great', 'Lets talk about it slowly first'],
      correctOptionIndex: 1,
      feedback:
          'Dont send messages outside the app. We take harassment very seriously. If you send inappropriate content, you may be reported or banned.',
    ),

    Question(
      questionText:
          'Do you like a particular ethnicity, body shape, religion or just a specific gender so you show it in your profile so you know how compatible you are ?',
      options: [
        'Sure, everyone has their own taste',
        'Take your time, you can always say no'
      ],
      correctOptionIndex: 1,
      feedback:
          'Everyone is welcome to take a break. Taste can change and even if it doesnt, racism can get you banned!',
    ), //6
    Question(
      questionText:
          'Your compatibility is perfect and you cant believe youre compatible so should you send a Rude Proposal to stand out ?',
      options: [
        'If not, you should still maintain a serious attitude',
        'If not, you should still maintain a serious attitude'
      ],
      correctOptionIndex: 1,
      feedback:
          'Everything should be transparent, the important thing is to respect your compatibility and dont assume and remember to agree before giving money.',
    ), //7
    Question(
      questionText:
          'You have a slightly dark sense of humor and you include a few of your favorite jokes and violence in your bio?',
      options: [
        'Yes, its just another part of your personality',
        'No, its not suitable for everyone'
      ],
      correctOptionIndex: 1,
      feedback:
          'Dont take risks. A few jokes are fine, but dont harm others with violent sexual content or violate our community rules.',
    ),
    Question(
      questionText:
          'If your partner wants to try adding a third person to your sex life, you will create a Hapind account for them?',
      options: ['Sure, thats how you meet new people', 'not on Hapind'],
      correctOptionIndex: 1,
      feedback:
          'three people is too much we want Hapind to be the best place to meet new people but shared accounts violate Hapinds community rules',
    ),
    // Add more questions...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz about community rules on Hapind',
          style: TextStyle(color: Color.fromARGB(255, 255, 128, 0)),
        ),
          automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!quizStarted) // Show "Start" button if quiz not started
            Column(
              children: [
                Text(
                  'Safety is our top priority and you can help us make Hapind a safe place to meet new people by following our policies. we Yes do we have those rules vs. what is acceptable Take the quiz below to see the results?',
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
                        fontSize: 30, color: Color.fromARGB(255, 226, 113, 47)),
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
                              ? Color.fromARGB(255, 83, 242, 202)
                              : Colors.transparent,
                          border: Border.all(
                            color: selectedOption == option
                                ? Color.fromARGB(255, 83, 242, 202)
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
