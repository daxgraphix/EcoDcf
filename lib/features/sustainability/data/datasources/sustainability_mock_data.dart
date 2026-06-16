import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';

class SustainabilityMockData {
  static List<Lesson> getExtendedLessons() {
    return [
      ..._getFoundationsLessons(),
      ..._getDeviceCareLessons(),
      ..._getCloudComputingLessons(),
      ..._getAIEthicsLessons(),
      ..._getStreamingMediaLessons(),
    ];
  }

  static List<Lesson> _getFoundationsLessons() {
    return [
      Lesson(
        id: 'found-1',
        title: 'Digital Carbon 101',
        description: 'The physical reality of the virtual world.',
        category: 'Foundations',
        durationMinutes: 5,
        icon: 'lightbulb',
        content: 'Digital carbon is the CO2 emitted by the ICT sector.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'ICT currently accounts for 3-4% of global greenhouse gas emissions. If it were a country, it would be the 3rd largest consumer of electricity.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Emissions come from three main sources: Data Centers (the cloud), Networks (the cables), and User Devices (the phone in your hand). Data centers alone consume ~200 TWh of energy per year.'),
          LessonSection(
              title: 'Field',
              content:
                  'Take a moment to look at your surroundings. How many devices are currently connected to your Wi-Fi? Each one is a gateway to this global energy-hungry network.'),
        ],
        quizzes: [
          Quiz(
            id: 'found-q1',
            question:
                'If the ICT sector were a country, it would rank as the ____ largest electricity consumer.',
            options: [
              QuizOption(text: '1st'),
              QuizOption(text: '3rd', isCorrect: true),
              QuizOption(text: '10th')
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      Lesson(
        id: 'found-2',
        title: 'The Power of Dark Mode',
        description: 'Visual choices that save battery and planet.',
        category: 'Foundations',
        durationMinutes: 4,
        icon: 'dark_mode',
        content: 'Dark mode is more than just an aesthetic preference.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'OLED and AMOLED screens light up individual pixels. This means displaying black requires zero energy.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Switching to dark mode at 100% brightness can save up to 60% of screen energy consumption on OLED devices compared to light mode. For standard LCDs, the difference is negligible, but OLED is now the standard for high-end phones.'),
          LessonSection(
              title: 'Field',
              content:
                  'Switch this app to Dark Mode in settings. Notice the deep blacks—on an OLED screen, those pixels are physically turned off.'),
        ],
        quizzes: [
          Quiz(
            id: 'found-q2',
            question:
                'On which screen technology does Dark Mode save the most energy?',
            options: [
              QuizOption(text: 'LCD'),
              QuizOption(text: 'OLED', isCorrect: true),
              QuizOption(text: 'Plasma')
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      Lesson(
        id: 'found-3',
        title: 'Renewable Energy & The Grid',
        description:
            'How your electricity choice impacts your digital footprint.',
        category: 'Foundations',
        durationMinutes: 6,
        icon: 'wb_sunny',
        content: 'Your internet is only as green as the grid powering it.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'The electricity powering your devices comes from various sources: coal, gas, nuclear, wind, and solar. The mix is called the "Grid Intensity."'),
          LessonSection(
              title: 'Learn',
              content:
                  'In countries with high renewable adoption (like Norway or Iceland), digital activities have a near-zero carbon footprint. In countries reliant on coal, the same activity is significantly more polluting.'),
          LessonSection(
              title: 'Field',
              content:
                  'Check if your utility provider offers a "Green Energy" plan. Switching to 100% renewable electricity at home is the single biggest way to green your digital life.'),
        ],
        quizzes: [
          Quiz(
            id: 'found-q3',
            question: 'What does "Grid Intensity" measure?',
            options: [
              QuizOption(text: 'Electricity voltage'),
              QuizOption(
                  text: 'Carbon per unit of electricity', isCorrect: true),
              QuizOption(text: 'Number of power plants')
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      Lesson(
        id: 'found-4',
        title: 'Video Streaming',
        description: 'The hidden energy cost of digital entertainment.',
        category: 'Foundations',
        durationMinutes: 6,
        icon: 'play_circle',
        content:
            'Video streaming is one of the largest sources of internet traffic.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'Video streaming accounts for 60% of global internet traffic. A single hour of HD video generates approximately 3.2kg of CO2.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Streaming in 4K uses 7GB of data per hour, while Standard Definition uses only 0.7GB. On a small smartphone screen, the human eye often cannot distinguish between 1080p and 4K.'),
          LessonSection(
              title: 'Field',
              content:
                  'Open your YouTube or Netflix settings. Change the mobile data streaming quality to "Data Saver" or "Standard Definition."'),
        ],
        quizzes: [
          Quiz(
            id: 'found-q4',
            question:
                'What percentage of global internet traffic is video streaming?',
            options: [
              QuizOption(text: '10%'),
              QuizOption(text: '30%'),
              QuizOption(text: '60%', isCorrect: true)
            ],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      Lesson(
        id: 'found-5',
        title: 'Remote Work',
        description: 'How digital meetings change your carbon footprint.',
        category: 'Foundations',
        durationMinutes: 6,
        icon: 'video_call',
        content:
            'Remote work can reduce commuting emissions, but video calls still consume energy.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'Remote work with video calls can consume 2-3x more energy than in-person meetings due to device and network usage. However, it eliminates commuting emissions.'),
          LessonSection(
              title: 'Learn',
              content:
                  'A 50km round-trip commute can produce about 20kg CO2, while audio-only calls use far less network and device energy than HD video meetings.'),
          LessonSection(
              title: 'Field',
              content:
                  'For your next meeting, try audio-only when video is not essential. Turn off your camera during large calls where you are not presenting.'),
        ],
        quizzes: [
          Quiz(
            id: 'found-q5',
            question:
                'Which option usually uses the least energy during a digital meeting?',
            options: [
              QuizOption(text: 'HD video on'),
              QuizOption(text: 'Audio-only call', isCorrect: true),
              QuizOption(text: 'Camera on with virtual background')
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
    ];
  }

  static List<Lesson> _getDeviceCareLessons() {
    return [
      Lesson(
        id: 'device-1',
        title: 'Repair vs Replace',
        description: 'The most sustainable phone is the one you already own.',
        category: 'Device Care',
        durationMinutes: 8,
        icon: 'smartphone',
        content: 'Hardware longevity is the key to digital sustainability.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  '80% of a smartphone\'s carbon footprint is "embodied"—it happens before you even turn it on for the first time.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Manufacturing a new phone requires mining 30kg of raw materials. By using your phone for 4 years instead of 2, you reduce its annual carbon footprint by nearly 50%.'),
          LessonSection(
              title: 'Field',
              content:
                  'Check your battery health in settings. If it\'s below 80%, consider a battery replacement instead of buying a new phone next year.'),
        ],
        quizzes: [
          Quiz(
            id: 'device-q1',
            question:
                'What percentage of a phone\'s total carbon footprint comes from its manufacturing?',
            options: [
              QuizOption(text: '20%'),
              QuizOption(text: '50%'),
              QuizOption(text: '80%', isCorrect: true)
            ],
            correctAnswerIndex: 2,
          ),
        ],
      ),
    ];
  }

  static List<Lesson> _getCloudComputingLessons() {
    return [
      Lesson(
        id: 'cloud-1',
        title: 'Green Cloud Storage',
        description: 'Choosing where your data lives.',
        category: 'Cloud Computing',
        durationMinutes: 6,
        icon: 'cloud',
        content: 'Not all clouds are created equal.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'Cloud providers vary wildly in their use of renewable energy. Some are powered by coal, others by 100% wind and solar.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Look for providers with "Carbon Free Energy" (CFE) scores. Google and Azure are leaders in 24/7 renewable matching, while some smaller providers rely heavily on carbon offsets which are less effective.'),
          LessonSection(
              title: 'Field',
              content:
                  'Research if your current cloud storage provider (iCloud, Google Drive, Dropbox) has a "Net Zero" target. Knowledge is power.'),
        ],
        quizzes: [
          Quiz(
            id: 'cloud-q1',
            question:
                'What is more effective than carbon offsets for data centers?',
            options: [
              QuizOption(text: '24/7 Renewable Matching', isCorrect: true),
              QuizOption(text: 'Buying more land'),
              QuizOption(text: 'Shutting down at night')
            ],
            correctAnswerIndex: 0,
          ),
        ],
      ),
    ];
  }

  static List<Lesson> _getAIEthicsLessons() {
    return [
      Lesson(
        id: 'ai-1',
        title: 'AI & Sustainability',
        description: 'The environmental cost of intelligence.',
        category: 'AI Ethics',
        durationMinutes: 9,
        icon: 'psychology',
        content: 'Large Language Models require massive training runs.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'Training a model like GPT-4 consumes enough energy to power thousands of homes for months.'),
          LessonSection(
              title: 'Learn',
              content:
                  'Inference (asking AI a question) also has a cost. Generating one AI image uses as much power as charging your smartphone to 100%. Efficiency in model architecture is a new ethical frontier.'),
          LessonSection(
              title: 'Field',
              content:
                  'Next time you use an AI tool, consider: "Could I have found this with a simple search?" If yes, choose the simpler path.'),
        ],
        quizzes: [
          Quiz(
            id: 'ai-q1',
            question: 'Generating ONE AI image uses as much energy as:',
            options: [
              QuizOption(text: 'Sending a text'),
              QuizOption(text: 'Charging a smartphone', isCorrect: true),
              QuizOption(text: 'A lightbulb for a year')
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
    ];
  }

  static List<Lesson> _getStreamingMediaLessons() {
    return [
      Lesson(
        id: 'media-1',
        title: 'Video Streaming Optimization',
        description: 'Lowering resolution to save the planet.',
        category: 'Streaming & Media',
        durationMinutes: 5,
        icon: 'play_circle',
        content: 'Video streaming accounts for 60% of all internet traffic.',
        sections: [
          LessonSection(
              title: 'Briefing',
              content:
                  'Streaming in 4K uses 7GB of data per hour. Streaming in Standard Definition (480p) uses only 0.7GB.'),
          LessonSection(
              title: 'Learn',
              content:
                  'On a small smartphone screen, the human eye often cannot distinguish between 1080p and 4K. By choosing 1080p, you reduce the network and server load by 4x.'),
          LessonSection(
              title: 'Field',
              content:
                  'Open your YouTube or Netflix settings. Change the mobile data streaming quality to "Data Saver" or "Standard Definition."'),
        ],
        quizzes: [
          Quiz(
            id: 'media-q1',
            question:
                'What percentage of global internet traffic is video streaming?',
            options: [
              QuizOption(text: '10%'),
              QuizOption(text: '30%'),
              QuizOption(text: '60%', isCorrect: true)
            ],
            correctAnswerIndex: 2,
          ),
        ],
      ),
    ];
  }
}
