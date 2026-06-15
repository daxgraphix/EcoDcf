import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';

class SustainabilityMockData {
  static const List<Lesson> lessons = [
    Lesson(
      id: 'found-1',
      title: 'Digital Carbon 101',
      description: 'The physical reality of the virtual world.',
      category: 'Foundations',
      durationMinutes: 5,
      icon: 'school',
      content: 'The internet is responsible for approximately 3.7% of global greenhouse gas emissions (Shift Project, 2019).',
      sections: [
        LessonSection(
          title: 'Energy Intensity', 
          content: 'Every byte transferred requires electricity for data centers, transmission networks, and your device. Globally, data centers consume ~200 TWh annually.'
        ),
        LessonSection(
          title: 'Embodied Carbon', 
          content: '80% of a smartphone\'s carbon footprint comes from its manufacturing process, not its usage. Extending its life is the best way to reduce impact.'
        ),
      ],
      quizzes: [
        Quiz(
          id: 'q1',
          question: 'What percentage of global emissions does the internet produce?',
          options: [
            QuizOption(text: '1.2%'),
            QuizOption(text: '3.7%', isCorrect: true),
            QuizOption(text: '10.5%'),
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),
  ];

  static List<Lesson> getExtendedLessons() {
    final List<String> categories = ['Foundations', 'Data Management', 'Device Care', 'Cloud Computing', 'AI Ethics', 'Streaming & Media'];
    final List<Lesson> allLessons = [];

    for (int i = 1; i <= 35; i++) {
      final category = categories[i % categories.length];
      allLessons.add(
        Lesson(
          id: 'lesson-$i',
          title: _getLessonTitle(i),
          description: 'Master the art of ${category.toLowerCase()} for a greener future.',
          category: category,
          durationMinutes: 5 + (i % 10),
          icon: _getIconForCategory(category),
          content: 'Detailed content for lesson $i...',
          sections: [
            LessonSection(title: 'Introduction', content: 'Explaining the basics of ${_getLessonTitle(i)}...'),
            const LessonSection(title: 'Practical Steps', content: 'How you can reduce your impact today...'),
          ],
          quizzes: [
            Quiz(
              id: 'q-$i',
              question: 'How does ${_getLessonTitle(i)} help the environment?',
              options: const [
                QuizOption(text: 'It increases energy use'),
                QuizOption(text: 'It optimizes resource consumption', isCorrect: true),
                QuizOption(text: 'It has no effect'),
              ],
              correctAnswerIndex: 1,
            ),
          ],
        ),
      );
    }
    return allLessons;
  }

  static String _getLessonTitle(int index) {
    const titles = [
      'Digital Carbon 101', 'Cleaning Your Inbox', 'The Power of Dark Mode', 'Sustainable Web Browsing',
      'AI & Sustainability', 'Green Cloud Storage', 'Video Streaming Optimization', 'App Background Refresh',
      'Social Media Hygiene', 'Electronic Waste Basics', 'Renewable Energy for Tech', 'Smart Home Efficiency',
      'Remote Work Footprint', 'Blockchain Energy Use', 'Eco-friendly Coding', 'Green Web Design',
      'Optimizing Image Sizes', 'Browser Tab Management', 'The Cost of "Always On"', 'Repair vs Replace',
      'Data Hoarding Issues', 'Unsubscribe for Good', 'Eco-friendly Search Engines', 'Low Carbon Zoom Calls',
      'Podcast Download vs Stream', 'Green Gaming Habits', 'Smart Notifications', 'Digital Minimalism',
      'Solar Powered Gadgets', 'Energy Star Ratings', 'Recycling Old Tech', 'Sustainable Procurement',
      'Carbon Offsetting 101', 'Enterprise ESG Goals', 'The Future of Green Tech'
    ];
    return titles[index % titles.length];
  }

  static String _getIconForCategory(String category) {
    switch (category) {
      case 'Foundations': return 'lightbulb';
      case 'Data Management': return 'storage';
      case 'Device Care': return 'smartphone';
      case 'Cloud Computing': return 'cloud';
      case 'AI Ethics': return 'psychology';
      case 'Streaming & Media': return 'play_circle';
      default: return 'menu_book';
    }
  }
}

