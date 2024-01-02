import 'package:flutter/material.dart';
import 'package:lavoro/app/modules/home/views/home_view.dart';

import '../../../global_widgets/custom_textformfield.dart';

class JobBody extends StatefulWidget {
  const JobBody({super.key});
  @override
  State<JobBody> createState() => _JobPageCreate();
}

class _JobPageCreate extends State<JobBody> {
  List<String> selectedLanguages = [];
  List<String> languageOptions = [
    'Python',
    'Java',
    'JavaScript',
    'C#',
    'C++',
    'Ruby',
    'PHP',
    'Swift',
    'Kotlin',
    'Dart',
    'Go',
    'Rust',
    'TypeScript',
    'SQL',
    'HTML/CSS',
    'Perl',
    'Scala',
    'Objective-C',
    'Lua',
    'Haskell',
    'COBOL',
    'Fortran',
    'Prolog'
  ];

  String selectedProgrammingLanguage = 'Dart';
  int selectedLanguageIndex = 0;
  String selectedExperience = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              // ignore: prefer_const_constructors
              CustomTextFormField(
                label: 'Job Title',
                prefixIcon: const Icon(Icons.work),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                label: 'Job Discription',
                prefixIcon: Icon(Icons.work),
              ),

              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the expansion state
                    selectedLanguages = [];
                  });
                },
                child: const Row(
                  children: [
                    Text(
                      'Programming Languages :\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: languageOptions.length,
                  itemBuilder: (context, index) {
                    String language = languageOptions[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedLanguages.contains(language)) {
                            selectedLanguages.remove(language);
                          } else {
                            selectedLanguages.add(language);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedLanguages.contains(language)
                                ? Colors.purple
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            language,
                            style: TextStyle(
                              color: selectedLanguages.contains(language)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                ' Select Experience',
                textAlign: TextAlign.end,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> categories = [
                      'Trainer',
                      '0',
                      '1-5',
                      '5-10',
                      'Over 10'
                    ];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedExperience = categories[index];
                        });
                      },
                      child: Container(
                        width: 70, // Adjust the width as needed
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: selectedExperience == categories[index]
                              ? Colors.purple
                              : Colors.grey, // Default color is grey
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            maxLines: 1,
                            style: TextStyle(
                              color: selectedExperience == categories[index]
                                  ? Colors.white
                                  : Colors
                                      .black, // Adjust text color accordingly
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 26.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(600, 10),
                  padding: const EdgeInsets.all(8),
                ),
                child: const Text(
                  'Create Job',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
