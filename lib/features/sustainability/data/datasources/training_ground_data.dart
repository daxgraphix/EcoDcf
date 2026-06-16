import 'package:ecodcf/features/sustainability/domain/entities/lesson.dart';

class TrainingGroundData {
  static const String category = 'Training Ground';

  static List<Lesson> missions = [
    Lesson(
      id: 'tg-1',
      title: 'Mission 1: The Invisible Footprint',
      description:
          'Uncover the hidden energy cost of the digital world and learn to shrink your carbon footprint.',
      category: category,
      durationMinutes: 7,
      icon: 'visibility_off',
      content:
          'Digital carbon is often invisible because we don\'t see the smoke from our smartphones. However, the energy required to power networks and data centers is massive.',
      sections: [
        LessonSection(
          title: 'Briefing',
          content:
              'Your objective is to identify the main sources of digital carbon. It\'s not just the device in your hand; it\'s the entire infrastructure behind it.',
        ),
        LessonSection(
          title: 'Learn',
          content:
              'Every search query travels through miles of fiber optic cables to a data center. High-definition video streaming is the largest contributor to consumer data traffic, accounting for over 60% of internet volume.',
        ),
      ],
      quizzes: [
        Quiz(
          id: 'tg-q1',
          question:
              'What type of content accounts for the majority of internet data traffic?',
          options: [
            QuizOption(text: 'Emails'),
            QuizOption(text: 'Video Streaming', isCorrect: true),
            QuizOption(text: 'Social Media Text'),
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    Lesson(
      id: 'tg-2',
      title: 'Mission 2: The E-Waste Mountain',
      description:
          'Learn to be a responsible agent when decommissioning your gadgets.',
      category: category,
      durationMinutes: 6,
      icon: 'delete_outline',
      content:
          'Electronic waste is the fastest-growing waste stream in the world.',
      sections: [
        LessonSection(
          title: 'Briefing',
          content:
              'Millions of tons of gadgets are thrown away each year. Many contain toxic materials like lead and mercury, but also valuable gold and copper.',
        ),
        LessonSection(
          title: 'Learn',
          content:
              'Circular electronics start with you. Recycling just one million cell phones can recover 35,000 lbs of copper, 772 lbs of silver, and 75 lbs of gold.',
        ),
      ],
      quizzes: [
        Quiz(
          id: 'tg-q2',
          question: 'What is the most effective way to reduce E-waste impact?',
          options: [
            QuizOption(text: 'Throwing devices in the trash'),
            QuizOption(
                text: 'Certified recycling and life extension',
                isCorrect: true),
            QuizOption(text: 'Buying a new phone every year'),
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    Lesson(
      id: 'tg-3',
      title: 'Mission 3: The AI Power Surge',
      description:
          'Explore the massive energy requirements of Artificial Intelligence and how to use it responsibly.',
      category: category,
      durationMinutes: 10,
      icon: 'psychology',
      content:
          'Training a single large AI model can emit as much carbon as five cars over their lifetimes.',
      sections: [
        LessonSection(
          title: 'Briefing',
          content:
              'AI is a powerful tool, but its "brain" requires immense computing power and specialized cooling.',
        ),
        LessonSection(
          title: 'Learn',
          content:
              'Inference (asking AI a question) also has a cost. Generating one image with AI can use as much energy as fully charging your smartphone.',
        ),
      ],
      quizzes: [
        Quiz(
          id: 'tg-q3',
          question: 'Generating an AI image can use as much energy as:',
          options: [
            QuizOption(text: 'Sending one text'),
            QuizOption(text: 'Fully charging a smartphone', isCorrect: true),
            QuizOption(text: 'Watching a 1-second video'),
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    Lesson(
      id: 'tg-4',
      title: 'Mission 4: Digital Wellness & Mental Health',
      description:
          'Understand how digital habits affect mental wellbeing and energy consumption.',
      category: category,
      durationMinutes: 45,
      icon: 'mental_health',
      content: 'Digital wellness is a critical aspect of sustainable living.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Screen time affects sleep quality and mental health.'),
        LessonSection(
            title: 'Briefing 2',
            content: 'Digital notifications create cognitive load and stress.'),
        LessonSection(
            title: 'Briefing 3',
            content: 'Social media comparison culture impacts self-esteem.'),
        LessonSection(
            title: 'Briefing 4',
            content: 'Information overload reduces decision-making ability.'),
        LessonSection(
            title: 'Briefing 5',
            content: 'Blue light from screens disrupts circadian rhythms.'),
        LessonSection(
            title: 'Briefing 6',
            content: 'Multitasking across apps reduces productivity.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'Digital hoarding creates anxiety and clutter stress.'),
        LessonSection(
            title: 'Briefing 8',
            content: 'Constant connectivity prevents mental restoration.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Passive consumption differs from active engagement.'),
        LessonSection(
            title: 'Briefing 10',
            content: 'Digital detox improves cognitive function and mood.'),
        LessonSection(
            title: 'Learn 1',
            content:
                'Excessive screen time correlates with increased anxiety levels.'),
        LessonSection(
            title: 'Learn 2',
            content:
                'Notification frequency affects attention span and focus.'),
        LessonSection(
            title: 'Learn 3',
            content:
                'Social comparison on platforms increases depressive symptoms.'),
        LessonSection(
            title: 'Learn 4',
            content:
                'Information consumption without processing leads to fatigue.'),
        LessonSection(
            title: 'Learn 5',
            content: 'Poor sleep from screens affects emotional regulation.'),
        LessonSection(
            title: 'Learn 6',
            content: 'Task switching between apps reduces efficiency by 40%.'),
        LessonSection(
            title: 'Learn 7',
            content:
                'Digital hoarding creates psychological burden and stress.'),
        LessonSection(
            title: 'Learn 8',
            content: 'Unplugged time is essential for mental restoration.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Mindful consumption differs from mindless scrolling.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Regular breaks improve cognitive performance and mood.'),
        LessonSection(
            title: 'Learn 11',
            content: 'Quality sleep reduces digital device dependency.'),
        LessonSection(
            title: 'Learn 12',
            content:
                'Face-to-face interactions are more fulfilling than digital.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Setting boundaries prevents digital overwhelm.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Intentional usage reduces mental fatigue.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Digital minimalism promotes wellbeing and focus.'),
        LessonSection(
            title: 'Learn 16',
            content: 'Evening screen reduction improves sleep quality.'),
        LessonSection(
            title: 'Learn 17',
            content: 'Mindfulness apps can support mental health.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Digital gratitude practices enhance wellbeing.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Nature breaks reduce digital fatigue.'),
        LessonSection(
            title: 'Learn 20',
            content: 'Physical activity balances digital consumption.'),
        LessonSection(
            title: 'Field 1',
            content: 'Track your daily screen time for one week.'),
        LessonSection(
            title: 'Field 2',
            content: 'Count how many notifications you receive hourly.'),
        LessonSection(
            title: 'Field 3',
            content: 'Note moments of social comparison on social media.'),
        LessonSection(
            title: 'Field 4',
            content: 'Record how often you switch between apps.'),
        LessonSection(
            title: 'Field 5',
            content: 'Count unsaved photos, emails, or files you hoard.'),
        LessonSection(
            title: 'Field 6',
            content: 'Identify times you feel most digitally overwhelmed.'),
        LessonSection(
            title: 'Field 7', content: 'Note your bedtime phone usage.'),
        LessonSection(
            title: 'Field 8',
            content: 'Count video calls vs in-person interactions.'),
        LessonSection(
            title: 'Field 9',
            content: 'Record your biggest digital time-wasters.'),
        LessonSection(
            title: 'Field 10',
            content: 'Identify your most used app categories.'),
        LessonSection(
            title: 'Field 11',
            content: 'Note how often you check your phone first thing.'),
        LessonSection(
            title: 'Field 12',
            content: 'Count unread messages across platforms.'),
        LessonSection(
            title: 'Field 13',
            content: 'Record your weekend vs weekday digital patterns.'),
        LessonSection(
            title: 'Field 14',
            content: 'Identify apps that make you feel worse after use.'),
        LessonSection(
            title: 'Field 15',
            content: 'Count your daily playlist or video skips.'),
        LessonSection(
            title: 'Field 16',
            content: 'Note your reaction to notification sounds.'),
        LessonSection(
            title: 'Field 17',
            content: 'Record how often you multitask digitally.'),
        LessonSection(
            title: 'Field 18',
            content: 'Count unread newsletters or subscriptions.'),
        LessonSection(
            title: 'Field 19',
            content: 'Identify your peak digital consumption hours.'),
        LessonSection(
            title: 'Field 20',
            content: 'Note feelings after digital detox periods.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q4-1',
            question:
                'What percentage of users exceed 3 hours of daily screen time?',
            options: [
              QuizOption(text: '30%'),
              QuizOption(text: '50%'),
              QuizOption(text: '70%', isCorrect: true),
              QuizOption(text: '90%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-2',
            question: 'How does notification frequency affect focus?',
            options: [
              QuizOption(text: 'No effect'),
              QuizOption(text: 'Slight improvement'),
              QuizOption(text: 'Reduces by 40%', isCorrect: true),
              QuizOption(text: 'Increases productivity')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-3',
            question: 'What is the primary mental health risk of social media?',
            options: [
              QuizOption(text: 'Cyberbullying'),
              QuizOption(text: 'Social comparison', isCorrect: true),
              QuizOption(text: 'Privacy concerns'),
              QuizOption(text: 'Addiction')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q4-4',
            question: 'How does blue light affect sleep?',
            options: [
              QuizOption(text: 'No effect'),
              QuizOption(text: 'Slight delay'),
              QuizOption(text: 'Significant disruption', isCorrect: true),
              QuizOption(text: 'Improves sleep')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-5',
            question:
                'What percentage productivity loss occurs with task switching?',
            options: [
              QuizOption(text: '10%'),
              QuizOption(text: '25%'),
              QuizOption(text: '40%', isCorrect: true),
              QuizOption(text: '60%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-6',
            question: 'What is digital hoarding?',
            options: [
              QuizOption(text: 'Saving passwords'),
              QuizOption(text: 'Storing too much data'),
              QuizOption(text: 'Accumulating digital guilt', isCorrect: true),
              QuizOption(text: 'Backup management')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-7',
            question: 'How does unplugging improve wellbeing?',
            options: [
              QuizOption(text: 'No benefit'),
              QuizOption(text: 'Minor improvement'),
              QuizOption(text: 'Significant restoration', isCorrect: true),
              QuizOption(text: 'Worsens symptoms')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-8',
            question:
                'What is the difference between passive and active consumption?',
            options: [
              QuizOption(text: 'Speed'),
              QuizOption(text: 'Content type'),
              QuizOption(text: 'Engagement level', isCorrect: true),
              QuizOption(text: 'Screen size')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q4-9',
            question: 'How long should digital detox periods be?',
            options: [
              QuizOption(text: '1 hour'),
              QuizOption(text: '1 day', isCorrect: true),
              QuizOption(text: '1 week'),
              QuizOption(text: '1 month')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q4-10',
            question: 'What reduces digital fatigue most effectively?',
            options: [
              QuizOption(text: 'More screens'),
              QuizOption(text: 'Nature breaks', isCorrect: true),
              QuizOption(text: 'Energy drinks'),
              QuizOption(text: 'Extended use')
            ],
            correctAnswerIndex: 1),
      ],
    ),
    Lesson(
      id: 'tg-5',
      title: 'Mission 5: Smart Home Energy Optimization',
      description:
          'Learn to optimize your smart home for energy efficiency and sustainability.',
      category: category,
      durationMinutes: 50,
      icon: 'home',
      content:
          'Smart homes can reduce energy consumption by up to 30% when optimized.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Smart thermostats can reduce heating costs by 10-15%.'),
        LessonSection(
            title: 'Briefing 2',
            content: 'LED smart bulbs use 80% less energy than incandescent.'),
        LessonSection(
            title: 'Briefing 3',
            content: 'Smart plugs prevent phantom energy drain from devices.'),
        LessonSection(
            title: 'Briefing 4',
            content:
                'Voice assistants consume minimal energy for always-on listening.'),
        LessonSection(
            title: 'Briefing 5',
            content: 'Smart irrigation systems reduce water usage by 20-30%.'),
        LessonSection(
            title: 'Briefing 6',
            content: 'Energy monitoring reveals hidden consumption patterns.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'Smart appliances optimize cycles for energy efficiency.'),
        LessonSection(
            title: 'Briefing 8',
            content:
                'Connected thermostats learn your schedule for efficiency.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Automated lighting reduces unnecessary energy use.'),
        LessonSection(
            title: 'Briefing 10',
            content: 'Smart power strips eliminate standby power consumption.'),
        LessonSection(
            title: 'Learn 1',
            content: 'HVAC systems account for 40-50% of home energy use.'),
        LessonSection(
            title: 'Learn 2',
            content:
                'Programmable thermostats can save 10% annually on heating.'),
        LessonSection(
            title: 'Learn 3',
            content: 'Geofencing turns off devices when you leave home.'),
        LessonSection(
            title: 'Learn 4',
            content: 'Room sensors optimize heating and cooling zones.'),
        LessonSection(
            title: 'Learn 5',
            content: 'Smart windows adjust tint for solar heat gain.'),
        LessonSection(
            title: 'Learn 6',
            content:
                'Energy dashboards provide real-time consumption insights.'),
        LessonSection(
            title: 'Learn 7',
            content: 'Peak demand management reduces utility charges.'),
        LessonSection(
            title: 'Learn 8',
            content:
                'Renewable integration with smart home systems is seamless.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Battery storage optimizes renewable energy usage.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Demand response programs offer financial incentives.'),
        LessonSection(
            title: 'Learn 11',
            content: 'Occupancy sensors prevent wasted lighting and HVAC.'),
        LessonSection(
            title: 'Learn 12',
            content: 'Smart blinds adjust for natural light optimization.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Water leak detection prevents waste and damage.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Energy audits reveal optimization opportunities.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Load shifting moves usage to off-peak hours.'),
        LessonSection(
            title: 'Learn 16',
            content: 'Grid-aware appliances respond to carbon intensity.'),
        LessonSection(
            title: 'Learn 17',
            content: 'Demand forecasting improves system efficiency.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Predictive maintenance prevents energy waste.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Integration with utility programs saves money.'),
        LessonSection(
            title: 'Learn 20',
            content: 'AI optimization learns from usage patterns.'),
        LessonSection(
            title: 'Field 1',
            content: 'Audit all smart devices connected to your home network.'),
        LessonSection(
            title: 'Field 2',
            content: 'Check current thermostat settings and schedules.'),
        LessonSection(
            title: 'Field 3',
            content: 'Identify devices with phantom power draw.'),
        LessonSection(
            title: 'Field 4',
            content: 'Measure lighting energy usage room by room.'),
        LessonSection(
            title: 'Field 5',
            content: 'Monitor water heater energy consumption.'),
        LessonSection(
            title: 'Field 6', content: 'Count devices that stay powered 24/7.'),
        LessonSection(
            title: 'Field 7',
            content: 'Review monthly energy bills for patterns.'),
        LessonSection(
            title: 'Field 8',
            content: 'Test if smart plugs reduce standby power.'),
        LessonSection(
            title: 'Field 9',
            content: 'Check if geofencing is properly configured.'),
        LessonSection(
            title: 'Field 10',
            content: 'Identify rooms with inconsistent temperatures.'),
        LessonSection(
            title: 'Field 11',
            content: 'Count devices without scheduling enabled.'),
        LessonSection(
            title: 'Field 12',
            content: 'Measure energy usage during peak hours.'),
        LessonSection(
            title: 'Field 13',
            content: 'Check if HVAC filters need replacement.'),
        LessonSection(
            title: 'Field 14',
            content: 'Identify water heating cost contributors.'),
        LessonSection(
            title: 'Field 15',
            content: 'Count devices with default vs optimized settings.'),
        LessonSection(
            title: 'Field 16',
            content: 'Review if smart home integrates with utility programs.'),
        LessonSection(
            title: 'Field 17',
            content: 'Check if energy dashboard shows real-time data.'),
        LessonSection(
            title: 'Field 18',
            content: 'Identify appliances running during peak times.'),
        LessonSection(
            title: 'Field 19',
            content: 'Count motion sensors installed and functional.'),
        LessonSection(
            title: 'Field 20', content: 'Review seasonal energy usage trends.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q5-1',
            question:
                'What percentage of home energy is typically used by HVAC?',
            options: [
              QuizOption(text: '20-30%'),
              QuizOption(text: '40-50%', isCorrect: true),
              QuizOption(text: '60-70%'),
              QuizOption(text: '80-90%')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-2',
            question: 'How much can smart thermostats reduce heating costs?',
            options: [
              QuizOption(text: '5-10%'),
              QuizOption(text: '10-15%', isCorrect: true),
              QuizOption(text: '20-25%'),
              QuizOption(text: '30-35%')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-3',
            question: 'What is phantom power drain?',
            options: [
              QuizOption(text: 'Solar energy'),
              QuizOption(text: 'Standby power consumption', isCorrect: true),
              QuizOption(text: 'Battery power'),
              QuizOption(text: 'Grid power loss')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-4',
            question: 'How do smart plugs help energy efficiency?',
            options: [
              QuizOption(text: 'Generate power'),
              QuizOption(text: 'Reduce standby power', isCorrect: true),
              QuizOption(text: 'Store energy'),
              QuizOption(text: 'Create heat')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-5',
            question: 'How much energy do LEDs save vs incandescent?',
            options: [
              QuizOption(text: '50%'),
              QuizOption(text: '70%'),
              QuizOption(text: '80%', isCorrect: true),
              QuizOption(text: '90%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q5-6',
            question: 'How does geofencing save energy?',
            options: [
              QuizOption(text: 'Increases heating'),
              QuizOption(text: 'Turns off when away', isCorrect: true),
              QuizOption(text: 'Saves water'),
              QuizOption(text: 'Generates income')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-7',
            question: 'What is the primary benefit of occupancy sensors?',
            options: [
              QuizOption(text: 'Air pollution'),
              QuizOption(text: 'Energy waste', isCorrect: true),
              QuizOption(text: 'Water waste'),
              QuizOption(text: 'Noise pollution')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-8',
            question: 'How much water can smart irrigation save?',
            options: [
              QuizOption(text: '5-10%'),
              QuizOption(text: '15-25%'),
              QuizOption(text: '20-30%', isCorrect: true),
              QuizOption(text: '40-50%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q5-9',
            question: 'What is the main benefit of energy monitoring?',
            options: [
              QuizOption(text: 'Increase bills'),
              QuizOption(text: 'Reveal usage patterns', isCorrect: true),
              QuizOption(text: 'Reduce device count'),
              QuizOption(text: 'Eliminate power')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q5-10',
            question: 'What percentage of home energy waste is typical?',
            options: [
              QuizOption(text: '5-10%'),
              QuizOption(text: '10-20%'),
              QuizOption(text: '20-30%', isCorrect: true),
              QuizOption(text: '30-40%')
            ],
            correctAnswerIndex: 2),
      ],
    ),
    Lesson(
      id: 'tg-6',
      title: 'Mission 6: Sustainable Gaming & Entertainment',
      description:
          'Learn how gaming and entertainment choices impact energy consumption.',
      category: category,
      durationMinutes: 40,
      icon: 'sports_esports',
      content:
          'Gaming and entertainment have significant but often overlooked energy footprints.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Gaming consoles consume 50-150 watts during gameplay.'),
        LessonSection(
            title: 'Briefing 2',
            content:
                'Cloud gaming can use 10-15x more energy than local play.'),
        LessonSection(
            title: 'Briefing 3',
            content: 'Streaming services account for 60% of internet traffic.'),
        LessonSection(
            title: 'Briefing 4',
            content: '4K streaming uses 7GB per hour vs 0.7GB for SD.'),
        LessonSection(
            title: 'Briefing 5',
            content:
                'Gaming PCs consume 300-1000 watts during intensive games.'),
        LessonSection(
            title: 'Briefing 6',
            content:
                'VR gaming increases energy use by 20-40% over standard gaming.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'Gaming servers operate 24/7 with minimal efficiency.'),
        LessonSection(
            title: 'Briefing 8',
            content:
                'Digital game downloads replace physical production waste.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Console sleep mode still uses 10-15 watts.'),
        LessonSection(
            title: 'Briefing 10',
            content:
                'Game development servers consume massive computing resources.'),
        LessonSection(
            title: 'Learn 1',
            content: 'A gaming session uses as much energy as a refrigerator.'),
        LessonSection(
            title: 'Learn 2',
            content: 'Cloud gaming routes data through multiple servers.'),
        LessonSection(
            title: 'Learn 3',
            content:
                'Video compression affects streaming energy requirements.'),
        LessonSection(
            title: 'Learn 4',
            content: 'High refresh rates increase monitor energy consumption.'),
        LessonSection(
            title: 'Learn 5',
            content:
                'RGB lighting in gaming setups adds 10-20 watts continuously.'),
        LessonSection(
            title: 'Learn 6',
            content: 'Multiplayer servers maintain persistent connections.'),
        LessonSection(
            title: 'Learn 7',
            content: 'Game updates download massive amounts of data.'),
        LessonSection(
            title: 'Learn 8',
            content:
                'Physical game production involves plastic and packaging.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Standby mode prevents deep sleep energy savings.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Software development environments run 24/7.'),
        LessonSection(
            title: 'Learn 11',
            content:
                'Esports tournaments require massive streaming infrastructure.'),
        LessonSection(
            title: 'Learn 12',
            content: 'Indie game development uses less server resources.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Retro gaming on original hardware is energy efficient.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Mobile gaming uses less energy than console gaming.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Game subscriptions reduce need for multiple purchases.'),
        LessonSection(
            title: 'Learn 16',
            content: 'Cloud saves reduce local storage requirements.'),
        LessonSection(
            title: 'Learn 17',
            content: 'Digital libraries replace physical storage needs.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Game sharing reduces duplicate downloads.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Offline modes reduce network energy consumption.'),
        LessonSection(
            title: 'Learn 20',
            content: 'Eco-mode settings optimize gaming energy use.'),
        LessonSection(
            title: 'Field 1',
            content: 'Check your console or PC power settings.'),
        LessonSection(
            title: 'Field 2', content: 'Count how many hours you game weekly.'),
        LessonSection(
            title: 'Field 3',
            content: 'Note if you use streaming or local gaming.'),
        LessonSection(
            title: 'Field 4',
            content: 'Check streaming quality settings on your TV.'),
        LessonSection(
            title: 'Field 5',
            content: 'Identify devices that stay powered during gaming.'),
        LessonSection(
            title: 'Field 6',
            content: 'Count RGB lighting devices in your setup.'),
        LessonSection(
            title: 'Field 7',
            content: 'Note if you leave consoles in standby mode.'),
        LessonSection(
            title: 'Field 8',
            content: 'Count games downloaded vs physical copies.'),
        LessonSection(
            title: 'Field 9',
            content:
                'Identify if repair is more cost-effective than replacement.'),
        LessonSection(
            title: 'Field 10',
            content: 'Check if you use game sharing features.'),
        LessonSection(
            title: 'Field 11', content: 'Note if you use cloud saves.'),
        LessonSection(
            title: 'Field 12', content: 'Count active gaming subscriptions.'),
        LessonSection(
            title: 'Field 13',
            content: 'Identify if you watch gaming streams.'),
        LessonSection(
            title: 'Field 14', content: 'Check if you use VR gaming.'),
        LessonSection(
            title: 'Field 15', content: 'Note gaming during off-peak hours.'),
        LessonSection(
            title: 'Field 16',
            content: 'Count gaming-related devices in your home.'),
        LessonSection(
            title: 'Field 17',
            content: 'Identify if you participate in esports events.'),
        LessonSection(
            title: 'Field 18',
            content: 'Check if you use gaming-focused power strips.'),
        LessonSection(
            title: 'Field 19', content: 'Note your console update frequency.'),
        LessonSection(
            title: 'Field 20',
            content: 'Review your gaming energy cost monthly.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q6-1',
            question:
                'How much energy does a gaming console use during gameplay?',
            options: [
              QuizOption(text: '10-50W'),
              QuizOption(text: '50-150W', isCorrect: true),
              QuizOption(text: '200-300W'),
              QuizOption(text: '500W+')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q6-2',
            question: 'How much more energy does cloud gaming use vs local?',
            options: [
              QuizOption(text: '2x'),
              QuizOption(text: '5x'),
              QuizOption(text: '10-15x', isCorrect: true),
              QuizOption(text: '20x')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q6-3',
            question: 'What percentage of internet traffic is video streaming?',
            options: [
              QuizOption(text: '30%'),
              QuizOption(text: '45%'),
              QuizOption(text: '60%', isCorrect: true),
              QuizOption(text: '80%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q6-4',
            question: 'How much data does 4K streaming use per hour?',
            options: [
              QuizOption(text: '1GB'),
              QuizOption(text: '3GB'),
              QuizOption(text: '7GB', isCorrect: true),
              QuizOption(text: '15GB')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q6-5',
            question: 'What do VR games increase energy use by?',
            options: [
              QuizOption(text: '5-10%'),
              QuizOption(text: '10-20%'),
              QuizOption(text: '20-40%', isCorrect: true),
              QuizOption(text: '50-60%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q6-6',
            question: 'How much energy does RGB lighting add to gaming?',
            options: [
              QuizOption(text: '5-10W'),
              QuizOption(text: '10-20W', isCorrect: true),
              QuizOption(text: '30-40W'),
              QuizOption(text: '50W+')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q6-7',
            question: 'How much energy is wasted on standby?',
            options: [
              QuizOption(text: '5-10%'),
              QuizOption(text: '10-20%', isCorrect: true),
              QuizOption(text: '25-35%'),
              QuizOption(text: '40-50%')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q6-8',
            question:
                'How much energy does a gaming PC use during intensive games?',
            options: [
              QuizOption(text: '100-300W'),
              QuizOption(text: '300-1000W', isCorrect: true),
              QuizOption(text: '1000-2000W'),
              QuizOption(text: '2000W+')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q6-9',
            question: 'What is more energy efficient than gaming?',
            options: [
              QuizOption(text: 'Streaming movies'),
              QuizOption(text: 'Mobile gaming'),
              QuizOption(text: 'Retro gaming', isCorrect: true),
              QuizOption(text: 'VR gaming')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q6-10',
            question: 'How can game subscriptions reduce energy use?',
            options: [
              QuizOption(text: 'Reduce downloads'),
              QuizOption(text: 'Share accounts'),
              QuizOption(text: 'Reduce physical production', isCorrect: true),
              QuizOption(text: 'Lower graphics quality')
            ],
            correctAnswerIndex: 2),
      ],
    ),
    Lesson(
      id: 'tg-7',
      title: 'Mission 7: Digital Privacy & Security',
      description:
          'Understand how digital security practices protect data and energy.',
      category: category,
      durationMinutes: 45,
      icon: 'security',
      content:
          'Digital security infrastructure requires significant energy for protection.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Encryption servers operate 24/7 to secure data.'),
        LessonSection(
            title: 'Briefing 2',
            content: 'Two-factor authentication prevents account takeovers.'),
        LessonSection(
            title: 'Briefing 3',
            content:
                'Password managers generate and store secure credentials.'),
        LessonSection(
            title: 'Briefing 4',
            content: 'VPN services route traffic through encrypted tunnels.'),
        LessonSection(
            title: 'Briefing 5',
            content:
                'Blockchain verification requires massive computational work.'),
        LessonSection(
            title: 'Briefing 6',
            content: 'Cybersecurity monitoring detects threats in real-time.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'Zero-trust architecture verifies every access request.'),
        LessonSection(
            title: 'Briefing 8',
            content: 'Multi-signature wallets require multiple approvals.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Biometric scanners use AI for identity verification.'),
        LessonSection(
            title: 'Briefing 10',
            content:
                'Zero-day vulnerability patches require emergency updates.'),
        LessonSection(
            title: 'Learn 1',
            content:
                'End-to-end encryption protects data in transit and storage.'),
        LessonSection(
            title: 'Learn 2',
            content: 'Multi-factor authentication adds security layers.'),
        LessonSection(
            title: 'Learn 3',
            content: 'Password managers reduce password reuse risks.'),
        LessonSection(
            title: 'Learn 4',
            content:
                'Virtual private networks mask user location and activity.'),
        LessonSection(
            title: 'Learn 5',
            content: 'Blockchain mining consumes enormous electricity.'),
        LessonSection(
            title: 'Learn 6',
            content: 'Intrusion detection systems monitor network traffic.'),
        LessonSection(
            title: 'Learn 7',
            content: 'Certificate authorities validate website identities.'),
        LessonSection(
            title: 'Learn 8',
            content: 'Zero-knowledge proofs verify without revealing data.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Hardware security modules protect encryption keys.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Quantum computing threatens current encryption methods.'),
        LessonSection(
            title: 'Learn 11',
            content: 'Regular security audits identify vulnerabilities.'),
        LessonSection(
            title: 'Learn 12',
            content: 'Patch management prevents known exploit attacks.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Firewall rules block malicious network traffic.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Antivirus scans detect and remove malware.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Security information event management centralizes logs.'),
        LessonSection(
            title: 'Learn 16',
            content: 'Penetration testing simulates attack scenarios.'),
        LessonSection(
            title: 'Learn 17',
            content: 'Compliance frameworks standardize security practices.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Incident response plans minimize breach impact.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Backup systems protect against ransomware attacks.'),
        LessonSection(
            title: 'Learn 20',
            content: 'Security awareness training reduces human error.'),
        LessonSection(
            title: 'Field 1',
            content: 'Check your password strength and uniqueness.'),
        LessonSection(
            title: 'Field 2',
            content: 'Enable two-factor authentication on all accounts.'),
        LessonSection(
            title: 'Field 3',
            content: 'Review app permissions on your devices.'),
        LessonSection(
            title: 'Field 4',
            content: 'Update all software to latest versions.'),
        LessonSection(
            title: 'Field 5',
            content: 'Check if your VPN is properly configured.'),
        LessonSection(
            title: 'Field 6',
            content: 'Review privacy settings on social platforms.'),
        LessonSection(
            title: 'Field 7',
            content: 'Count how many accounts you share passwords for.'),
        LessonSection(
            title: 'Field 8',
            content: 'Note if you use public Wi-Fi networks.'),
        LessonSection(
            title: 'Field 9',
            content: 'Check backup status for important files.'),
        LessonSection(
            title: 'Field 10',
            content: 'Review recent security breach notifications.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q7-1',
            question:
                'What is the primary benefit of two-factor authentication?',
            options: [
              QuizOption(text: 'Faster login'),
              QuizOption(text: 'Prevents account takeovers', isCorrect: true),
              QuizOption(text: 'Saves passwords'),
              QuizOption(text: 'Reduces bandwidth')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-2',
            question:
                'How much energy does blockchain mining consume annually?',
            options: [
              QuizOption(text: '50 TWh'),
              QuizOption(text: '150 TWh'),
              QuizOption(text: '300 TWh', isCorrect: true),
              QuizOption(text: '500 TWh')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q7-3',
            question: 'What is the main energy cost in cybersecurity?',
            options: [
              QuizOption(text: 'User devices'),
              QuizOption(text: 'Data centers', isCorrect: true),
              QuizOption(text: 'Network cables'),
              QuizOption(text: 'Office lighting')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-4',
            question: 'What percentage of breaches involve weak credentials?',
            options: [
              QuizOption(text: '30%'),
              QuizOption(text: '50%'),
              QuizOption(text: '80%', isCorrect: true),
              QuizOption(text: '95%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q7-5',
            question: 'Which protocol provides end-to-end encryption?',
            options: [
              QuizOption(text: 'HTTP'),
              QuizOption(text: 'HTTPS', isCorrect: true),
              QuizOption(text: 'FTP'),
              QuizOption(text: 'SMTP')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-6',
            question: 'What is zero-trust architecture?',
            options: [
              QuizOption(text: 'No security'),
              QuizOption(text: 'Verify every request', isCorrect: true),
              QuizOption(text: 'Open access'),
              QuizOption(text: 'Password only')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-7',
            question: 'How often should passwords be changed?',
            options: [
              QuizOption(text: 'Never'),
              QuizOption(text: 'Every 3 months', isCorrect: true),
              QuizOption(text: 'Yearly'),
              QuizOption(text: 'Monthly')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-8',
            question: 'What reduces phishing attack success?',
            options: [
              QuizOption(text: 'More emails'),
              QuizOption(text: 'Security training', isCorrect: true),
              QuizOption(text: 'Public networks'),
              QuizOption(text: 'Default passwords')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q7-9',
            question: 'What hardware protects encryption keys?',
            options: [
              QuizOption(text: 'CPU'),
              QuizOption(text: 'RAM'),
              QuizOption(text: 'HSM', isCorrect: true),
              QuizOption(text: 'GPU')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q7-10',
            question: 'What can reduce security-related energy use?',
            options: [
              QuizOption(text: 'Using larger models'),
              QuizOption(text: 'Running more experiments'),
              QuizOption(text: 'Efficient model architecture', isCorrect: true),
              QuizOption(text: 'Increasing data center cooling')
            ],
            correctAnswerIndex: 2),
      ],
    ),
    Lesson(
      id: 'tg-8',
      title: 'Mission 8: Sustainable Cloud Computing',
      description:
          'Learn how cloud providers optimize for green energy and efficiency.',
      category: category,
      durationMinutes: 50,
      icon: 'cloud',
      content:
          'Cloud computing can be more sustainable than local computing when done right.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Major cloud providers commit to carbon neutrality.'),
        LessonSection(
            title: 'Briefing 2',
            content:
                'Renewable energy powers 24/7 operations in green data centers.'),
        LessonSection(
            title: 'Briefing 3',
            content: 'Server virtualization maximizes hardware utilization.'),
        LessonSection(
            title: 'Briefing 4',
            content: 'Edge computing reduces data transmission distances.'),
        LessonSection(
            title: 'Briefing 5',
            content: 'Serverless architectures eliminate unused compute time.'),
        LessonSection(
            title: 'Briefing 6',
            content:
                'Cooling systems now use outside air and water recycling.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'AI-powered optimization schedules workload efficiently.'),
        LessonSection(
            title: 'Briefing 8',
            content: 'Carbon-aware computing shifts load to green periods.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Data deduplication eliminates redundant storage.'),
        LessonSection(
            title: 'Briefing 10',
            content: 'Open-source hardware designs improve energy efficiency.'),
        LessonSection(
            title: 'Learn 1',
            content: 'Google achieved 100% renewable energy matching in 2017.'),
        LessonSection(
            title: 'Learn 2',
            content: 'Microsoft Azure has carbon negative goals by 2030.'),
        LessonSection(
            title: 'Learn 3',
            content: 'Amazon Web Services uses wind and solar farms.'),
        LessonSection(
            title: 'Learn 4',
            content: 'Container orchestration reduces idle server energy.'),
        LessonSection(
            title: 'Learn 5',
            content: 'Load balancing distributes work across servers.'),
        LessonSection(
            title: 'Learn 6',
            content: 'Compression algorithms reduce network data transfer.'),
        LessonSection(
            title: 'Learn 7',
            content: 'Tiered storage moves cold data to efficient systems.'),
        LessonSection(
            title: 'Learn 8',
            content: 'Auto-scaling shuts down unused instances.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Content delivery networks reduce server load.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Database indexing speeds queries and reduces CPU use.'),
        LessonSection(
            title: 'Learn 11',
            content: 'Microservices architecture enables granular scaling.'),
        LessonSection(
            title: 'Learn 12',
            content: 'API rate limiting prevents abuse and waste.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Database connection pooling reduces overhead.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Caching strategies minimize repeated computation.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Message queues decouple services for efficiency.'),
        LessonSection(
            title: 'Learn 16',
            content:
                'Observability tools identify optimization opportunities.'),
        LessonSection(
            title: 'Learn 17',
            content: 'FinOps practices track and reduce cloud spending.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Reserved instances reduce provisioning waste.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Spot instances use excess capacity efficiently.'),
        LessonSection(
            title: 'Learn 20',
            content: 'Green software engineering principles guide design.'),
        LessonSection(
            title: 'Field 1',
            content: 'Check your cloud provider sustainability reports.'),
        LessonSection(
            title: 'Field 2', content: 'Review auto-scaling configurations.'),
        LessonSection(
            title: 'Field 3',
            content: 'Audit unused storage and delete unnecessary data.'),
        LessonSection(
            title: 'Field 4', content: 'Count idle virtual machines running.'),
        LessonSection(
            title: 'Field 5',
            content: 'Check if backups are stored in green regions.'),
        LessonSection(
            title: 'Field 6',
            content: 'Note if you use CDNs for static content.'),
        LessonSection(
            title: 'Field 7', content: 'Review database query efficiency.'),
        LessonSection(
            title: 'Field 8', content: 'Count serverless functions deployed.'),
        LessonSection(
            title: 'Field 9',
            content: 'Check cache hit ratios in your applications.'),
        LessonSection(
            title: 'Field 10',
            content: 'Audit third-party cloud dependencies.'),
        LessonSection(
            title: 'Field 11',
            content: 'Review region selection for workloads.'),
        LessonSection(
            title: 'Field 12',
            content: 'Note if you use spot instances where possible.'),
        LessonSection(
            title: 'Field 13', content: 'Check blob storage tiering policies.'),
        LessonSection(
            title: 'Field 14',
            content: 'Count microservices that can be scaled independently.'),
        LessonSection(
            title: 'Field 15',
            content: 'Review logging levels for production.'),
        LessonSection(
            title: 'Field 16', content: 'Audit API rate limits and quotas.'),
        LessonSection(
            title: 'Field 17', content: 'Check database indexing strategies.'),
        LessonSection(
            title: 'Field 18', content: 'Note if you use content compression.'),
        LessonSection(
            title: 'Field 19',
            content: 'Review monitoring for resource waste.'),
        LessonSection(
            title: 'Field 20',
            content: 'Check if you have carbon-aware deployment scripts.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q8-1',
            question:
                'What percentage of cloud providers have sustainability commitments?',
            options: [
              QuizOption(text: '50%'),
              QuizOption(text: '75%'),
              QuizOption(text: '90%', isCorrect: true),
              QuizOption(text: '100%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q8-2',
            question: 'How much renewable energy do major clouds use?',
            options: [
              QuizOption(text: '50%'),
              QuizOption(text: '75%'),
              QuizOption(text: '100%', isCorrect: true),
              QuizOption(text: '120%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q8-3',
            question: 'What is server virtualization?',
            options: [
              QuizOption(text: 'Multiple servers per rack'),
              QuizOption(
                  text: 'Multiple workloads per server', isCorrect: true),
              QuizOption(text: 'Server gaming'),
              QuizOption(text: 'Virtual reality servers')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-4',
            question: 'How much can serverless reduce energy use?',
            options: [
              QuizOption(text: '10%'),
              QuizOption(text: '30%'),
              QuizOption(text: '50%', isCorrect: true),
              QuizOption(text: '70%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q8-5',
            question: 'What is the main benefit of edge computing?',
            options: [
              QuizOption(text: 'Lower latency'),
              QuizOption(text: 'Reduced data transmission', isCorrect: true),
              QuizOption(text: 'Cheaper hardware'),
              QuizOption(text: 'More storage')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-6',
            question: 'What percentage of data center energy is cooling?',
            options: [
              QuizOption(text: '10-20%'),
              QuizOption(text: '20-40%', isCorrect: true),
              QuizOption(text: '40-60%'),
              QuizOption(text: '60-80%')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-7',
            question: 'How does auto-scaling save energy?',
            options: [
              QuizOption(text: 'Reduces CPU speed'),
              QuizOption(text: 'Shuts down unused instances', isCorrect: true),
              QuizOption(text: 'Uses less RAM'),
              QuizOption(text: 'Slower internet')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-8',
            question: 'What is carbon-aware computing?',
            options: [
              QuizOption(text: 'More carbon'),
              QuizOption(text: 'Shift load to green periods', isCorrect: true),
              QuizOption(text: 'Avoid computing'),
              QuizOption(text: 'Use more servers')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-9',
            question: 'What does data deduplication do?',
            options: [
              QuizOption(text: 'Speeds up queries'),
              QuizOption(text: 'Eliminates redundant storage', isCorrect: true),
              QuizOption(text: 'Increases bandwidth'),
              QuizOption(text: 'Reduces latency')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q8-10',
            question: 'What is the benefit of container orchestration?',
            options: [
              QuizOption(text: 'Better graphics'),
              QuizOption(
                  text: 'Improved resource utilization', isCorrect: true),
              QuizOption(text: 'More crashes'),
              QuizOption(text: 'Higher costs')
            ],
            correctAnswerIndex: 1),
      ],
    ),
    Lesson(
      id: 'tg-9',
      title: 'Mission 9: Digital Minimalism',
      description:
          'Learn to reduce digital consumption for mental and environmental benefits.',
      category: category,
      durationMinutes: 40,
      icon: 'minimize',
      content:
          'Digital minimalism reduces both carbon footprint and mental stress.',
      sections: [
        LessonSection(
            title: 'Briefing 1',
            content: 'Digital minimalism focuses on quality over quantity.'),
        LessonSection(
            title: 'Briefing 2',
            content: 'Fewer apps mean less data center energy use.'),
        LessonSection(
            title: 'Briefing 3',
            content:
                'Offline activities reduce network traffic significantly.'),
        LessonSection(
            title: 'Briefing 4',
            content:
                'Physical books have lower lifetime carbon than e-readers.'),
        LessonSection(
            title: 'Briefing 5',
            content: 'Single-purpose devices are more energy efficient.'),
        LessonSection(
            title: 'Briefing 6',
            content: 'Batch processing reduces device wake cycles.'),
        LessonSection(
            title: 'Briefing 7',
            content: 'Local storage uses less energy than cloud sync.'),
        LessonSection(
            title: 'Briefing 8',
            content: 'Scheduled digital detoxes improve mental clarity.'),
        LessonSection(
            title: 'Briefing 9',
            content: 'Unsubscribe from unnecessary notifications.'),
        LessonSection(
            title: 'Briefing 10',
            content: 'Consolidate apps to reduce device load.'),
        LessonSection(
            title: 'Learn 1',
            content: 'Each app consumes resources even when idle.'),
        LessonSection(
            title: 'Learn 2',
            content: 'Background app refresh drains battery and network.'),
        LessonSection(
            title: 'Learn 3',
            content: 'Streaming services use massive server infrastructure.'),
        LessonSection(
            title: 'Learn 4',
            content: 'E-ink displays use 99% less power than LCD/OLED.'),
        LessonSection(
            title: 'Learn 5',
            content: 'Single-purpose tools last longer than multi-tools.'),
        LessonSection(
            title: 'Learn 6',
            content: 'Batch email reduces send/receive cycles.'),
        LessonSection(
            title: 'Learn 7',
            content: 'Local photos reduce cloud storage sync energy.'),
        LessonSection(
            title: 'Learn 8',
            content: 'Scheduled breaks reduce stress and improve focus.'),
        LessonSection(
            title: 'Learn 9',
            content: 'Notification consolidation reduces interruptions.'),
        LessonSection(
            title: 'Learn 10',
            content: 'Unified platforms reduce app proliferation.'),
        LessonSection(
            title: 'Learn 11',
            content: 'Offline-first design reduces network calls.'),
        LessonSection(
            title: 'Learn 12',
            content: 'Dark mode saves energy on OLED screens.'),
        LessonSection(
            title: 'Learn 13',
            content: 'Reading lists consolidate browsing sessions.'),
        LessonSection(
            title: 'Learn 14',
            content: 'Calendar blocking reduces digital multitasking.'),
        LessonSection(
            title: 'Learn 15',
            content: 'Physical media has lower carbon than streaming.'),
        LessonSection(
            title: 'Learn 16',
            content: 'Voice commands reduce screen on-time.'),
        LessonSection(
            title: 'Learn 17',
            content: 'Keyboard shortcuts reduce mouse movement energy.'),
        LessonSection(
            title: 'Learn 18',
            content: 'Template systems reduce repeated digital work.'),
        LessonSection(
            title: 'Learn 19',
            content: 'Physical notebooks reduce device usage.'),
        LessonSection(
            title: 'Learn 20',
            content: 'Annual digital declutter improves efficiency.'),
        LessonSection(
            title: 'Field 1',
            content: 'Audit your home screen apps and their usage.'),
        LessonSection(
            title: 'Field 2',
            content: 'Count tabs open in all browsers right now.'),
        LessonSection(
            title: 'Field 3',
            content: 'Note how many streaming subscriptions you pay for.'),
        LessonSection(
            title: 'Field 4', content: 'Count unread emails in your inbox.'),
        LessonSection(
            title: 'Field 5',
            content: 'Identify apps you never use but remain installed.'),
        LessonSection(
            title: 'Field 6',
            content: 'Note your daily social media check frequency.'),
        LessonSection(
            title: 'Field 7',
            content: 'Count cloud storage services you subscribe to.'),
        LessonSection(
            title: 'Field 8',
            content: 'Identify notifications you never act on.'),
        LessonSection(
            title: 'Field 9',
            content: 'Note how often you switch between browser tabs.'),
        LessonSection(
            title: 'Field 10',
            content: 'Count unread newsletters and promotional emails.'),
        LessonSection(
            title: 'Field 11',
            content: 'Identify digital tools you duplicate across platforms.'),
        LessonSection(
            title: 'Field 12', content: 'Note your phone charging frequency.'),
        LessonSection(
            title: 'Field 13', content: 'Count how many passwords you manage.'),
        LessonSection(
            title: 'Field 14',
            content: 'Identify apps with location always running.'),
        LessonSection(
            title: 'Field 15',
            content: 'Note unused cloud folders and documents.'),
        LessonSection(
            title: 'Field 16',
            content: 'Count daily digital purchases or subscriptions.'),
        LessonSection(
            title: 'Field 17', content: 'Identify redundant online accounts.'),
        LessonSection(
            title: 'Field 18', content: 'Note your backup storage locations.'),
        LessonSection(
            title: 'Field 19',
            content: 'Count browser extensions you rarely use.'),
        LessonSection(
            title: 'Field 20', content: 'Review your annual digital spending.'),
      ],
      quizzes: [
        Quiz(
            id: 'tg-q9-1',
            question: 'How many apps does the average person have installed?',
            options: [
              QuizOption(text: '10-20'),
              QuizOption(text: '30-50', isCorrect: true),
              QuizOption(text: '60-100'),
              QuizOption(text: '100-200')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q9-2',
            question: 'What percentage of phone energy is used by apps?',
            options: [
              QuizOption(text: '30%'),
              QuizOption(text: '50%'),
              QuizOption(text: '70%', isCorrect: true),
              QuizOption(text: '90%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q9-3',
            question: 'How much energy does streaming save vs physical media?',
            options: [
              QuizOption(text: 'None'),
              QuizOption(text: '10-20%'),
              QuizOption(text: '30-50%', isCorrect: true),
              QuizOption(text: '60-80%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q9-4',
            question:
                'What is the carbon footprint of an e-book vs paper book?',
            options: [
              QuizOption(text: 'E-book always lower'),
              QuizOption(text: 'Paper lower for <10 reads', isCorrect: true),
              QuizOption(text: 'Paper always lower'),
              QuizOption(text: 'Equal')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q9-5',
            question: 'How much does dark mode save on OLED screens?',
            options: [
              QuizOption(text: '5%'),
              QuizOption(text: '20%'),
              QuizOption(text: '60%', isCorrect: true),
              QuizOption(text: '90%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q9-6',
            question: 'What is the benefit of batch processing?',
            options: [
              QuizOption(text: 'More notifications'),
              QuizOption(text: 'Reduced wake cycles', isCorrect: true),
              QuizOption(text: 'Slower performance'),
              QuizOption(text: 'Higher battery drain')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q9-7',
            question: 'How many daily digital detox hours are recommended?',
            options: [
              QuizOption(text: '1 hour'),
              QuizOption(text: '2-3 hours', isCorrect: true),
              QuizOption(text: '5 hours'),
              QuizOption(text: 'All day')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q9-8',
            question: 'What reduces notification energy drain?',
            options: [
              QuizOption(text: 'More notifications'),
              QuizOption(text: 'Scheduled consolidation', isCorrect: true),
              QuizOption(text: 'Always on'),
              QuizOption(text: 'Frequent checks')
            ],
            correctAnswerIndex: 1),
        Quiz(
            id: 'tg-q9-9',
            question: 'How much can app consolidation reduce usage?',
            options: [
              QuizOption(text: '10%'),
              QuizOption(text: '20%'),
              QuizOption(text: '30%', isCorrect: true),
              QuizOption(text: '40%')
            ],
            correctAnswerIndex: 2),
        Quiz(
            id: 'tg-q9-10',
            question: 'What is digital hoarding?',
            options: [
              QuizOption(text: 'Saving passwords'),
              QuizOption(text: 'Accumulating digital guilt'),
              QuizOption(text: 'Too many subscriptions', isCorrect: true),
              QuizOption(text: 'All of the above')
            ],
            correctAnswerIndex: 2),
      ],
    ),
    Lesson(
      id: 'tg-10',
      title: 'Mission 10: The Green Coder',
      description:
          'Discover how efficient algorithms and code can save energy on a global scale.',
      category: category,
      durationMinutes: 50,
      icon: 'code',
      content:
          'Software efficiency is just as important as hardware efficiency.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'Poorly written code can force a processor to use more power.'),
        LessonSection(title: 'Briefing 2', content: 'Green coding is about writing elegant, efficient logic.'),
        LessonSection(title: 'Briefing 3', content: 'Every line of code has an environmental cost.'),
        LessonSection(title: 'Briefing 4', content: 'Server farms consume enormous energy running applications.'),
        LessonSection(title: 'Briefing 5', content: 'Cloud computing multiplies the impact of inefficient code.'),
        LessonSection(title: 'Briefing 6', content: 'Database queries that scan entire tables waste CPU cycles.'),
        LessonSection(title: 'Briefing 7', content: 'Unused code and dependencies add unnecessary weight.'),
        LessonSection(title: 'Briefing 8', content: 'API calls consume network energy even when idle.'),
        LessonSection(title: 'Briefing 9', content: 'Caching strategies reduce repeated computation.'),
        LessonSection(title: 'Briefing 10', content: 'Sustainable development practices consider the full lifecycle.'),
        LessonSection(title: 'Learn 1', content: 'Choosing energy-efficient programming languages matters.'),
        LessonSection(title: 'Learn 2', content: 'Optimizing database queries can reduce server load significantly.'),
        LessonSection(title: 'Learn 3', content: 'Lazy loading defers resource loading until needed.'),
        LessonSection(title: 'Learn 4', content: 'Minification reduces file sizes and network transfer.'),
        LessonSection(title: 'Learn 5', content: 'Asynchronous operations prevent blocking the main thread.'),
        LessonSection(title: 'Learn 6', content: 'Content delivery networks reduce data transmission distances.'),
        LessonSection(title: 'Learn 7', content: 'Efficient algorithms scale better with larger datasets.'),
        LessonSection(title: 'Learn 8', content: 'Removing unused dependencies reduces application size.'),
        LessonSection(title: 'Learn 9', content: 'Server-side rendering can be more efficient than client-side.'),
        LessonSection(title: 'Learn 10', content: 'Progressive web apps reduce native app energy consumption.'),
        LessonSection(title: 'Learn 11', content: 'Database indexing speeds up queries and reduces CPU use.'),
        LessonSection(title: 'Learn 12', content: 'Observability tools help identify inefficient code paths.'),
        LessonSection(title: 'Learn 13', content: 'Containerization improves resource utilization.'),
        LessonSection(title: 'Learn 14', content: 'Microservices architecture enables granular scaling.'),
        LessonSection(title: 'Learn 15', content: 'Edge computing reduces data transmission energy.'),
        LessonSection(title: 'Learn 16', content: 'Serverless functions scale down to zero when idle.'),
        LessonSection(title: 'Learn 17', content: 'Version control helps track and optimize code changes.'),
        LessonSection(title: 'Learn 18', content: 'Automated testing catches inefficiencies early.'),
        LessonSection(title: 'Learn 19', content: 'Performance monitoring identifies energy hotspots.'),
        LessonSection(title: 'Learn 20', content: 'Sustainable architecture considers long-term maintenance.'),
        LessonSection(title: 'Field 1', content: 'Audit your codebase for unused dependencies.'),
        LessonSection(title: 'Field 2', content: 'Profile your application for performance bottlenecks.'),
        LessonSection(title: 'Field 3', content: 'Review API call frequency and optimize requests.'),
        LessonSection(title: 'Field 4', content: 'Check database query execution plans.'),
        LessonSection(title: 'Field 5', content: 'Count unnecessary image or asset loads.'),
        LessonSection(title: 'Field 6', content: 'Identify third-party scripts running on your pages.'),
        LessonSection(title: 'Field 7', content: 'Review caching strategies implementation.'),
        LessonSection(title: 'Field 8', content: 'Check for memory leaks in your application.'),
        LessonSection(title: 'Field 9', content: 'Audit server logs for error rates and retries.'),
        LessonSection(title: 'Field 10', content: 'Compare energy usage of different code implementations.'),
        LessonSection(title: 'Field 11', content: 'Review mobile app background processes.'),
        LessonSection(title: 'Field 12', content: 'Count API calls made during typical user journeys.'),
        LessonSection(title: 'Field 13', content: 'Check if you use efficient data structures.'),
        LessonSection(title: 'Field 14', content: 'Review your deployment pipeline for optimizations.'),
        LessonSection(title: 'Field 15', content: 'Audit cloud resource allocation and scaling policies.'),
        LessonSection(title: 'Field 16', content: 'Identify unused features that could be removed.'),
        LessonSection(title: 'Field 17', content: 'Check if your app uses dark mode by default.'),
        LessonSection(title: 'Field 18', content: 'Review logging levels for production environments.'),
        LessonSection(title: 'Field 19', content: 'Audit third-party analytics and tracking scripts.'),
        LessonSection(title: 'Field 20', content: 'Calculate your application\'s carbon footprint.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q10-1', question: 'How does green coding help?', options: [QuizOption(text: 'It makes the screen green'), QuizOption(text: 'It reduces CPU cycles required', isCorrect: true), QuizOption(text: 'It makes apps more expensive'), QuizOption(text: 'It increases server load')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-2', question: 'What is the main benefit of lazy loading?', options: [QuizOption(text: 'Faster initial load', isCorrect: true), QuizOption(text: 'More memory usage'), QuizOption(text: 'Slower performance'), QuizOption(text: 'Increased bandwidth')], correctAnswerIndex: 0),
        Quiz(id: 'tg-q10-3', question: 'How can database indexing help?', options: [QuizOption(text: 'Slows down queries'), QuizOption(text: 'Reduces CPU usage', isCorrect: true), QuizOption(text: 'Increases storage'), QuizOption(text: 'Uses more memory')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-4', question: 'What does minification do?', options: [QuizOption(text: 'Increases file size'), QuizOption(text: 'Reduces file size', isCorrect: true), QuizOption(text: 'Adds comments'), QuizOption(text: 'Slows down loading')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-5', question: 'Which is most energy-efficient for data transfer?', options: [QuizOption(text: 'Sending raw data'), QuizOption(text: 'Using compression', isCorrect: true), QuizOption(text: 'Sending duplicate data'), QuizOption(text: 'Increasing payload size')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-6', question: 'What is the benefit of serverless functions?', options: [QuizOption(text: 'Always running'), QuizOption(text: 'Scale to zero when idle', isCorrect: true), QuizOption(text: 'Require dedicated servers'), QuizOption(text: 'Higher latency')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-7', question: 'How do CDNs reduce energy use?', options: [QuizOption(text: 'By increasing distance'), QuizOption(text: 'By reducing data transmission', isCorrect: true), QuizOption(text: 'By adding more servers'), QuizOption(text: 'By increasing latency')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-8', question: 'What is the environmental impact of unused dependencies?', options: [QuizOption(text: 'None'), QuizOption(text: 'Increased bundle size', isCorrect: true), QuizOption(text: 'Faster loading'), QuizOption(text: 'Better security')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q10-9', question: 'What does dark mode save on OLED screens?', options: [QuizOption(text: '10%'), QuizOption(text: '30%'), QuizOption(text: '60%', isCorrect: true), QuizOption(text: '90%')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q10-10', question: 'What is the goal of sustainable architecture?', options: [QuizOption(text: 'Short-term gains only'), QuizOption(text: 'Consider full lifecycle impact', isCorrect: true), QuizOption(text: 'More complex systems'), QuizOption(text: 'Higher resource usage')], correctAnswerIndex: 1),
      ],
    ),
    Lesson(
      id: 'tg-11',
      title: 'Mission 11: The Gaming Grid',
      description: 'Explore the energy trade-offs between local gaming and cloud-based streaming.',
      category: category,
      durationMinutes: 50,
      icon: 'videogame_asset',
      content: 'Gaming is one of the most energy-intensive digital activities.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'High-end GPUs consume hundreds of watts during gameplay.'),
        LessonSection(title: 'Briefing 2', content: 'Cloud gaming moves processing to distant data centers.'),
        LessonSection(title: 'Briefing 3', content: 'Streaming requires constant high-bandwidth network connections.'),
        LessonSection(title: 'Briefing 4', content: 'Local gaming keeps energy consumption closer to the user.'),
        LessonSection(title: 'Briefing 5', content: 'Console sleep modes still consume standby power.'),
        LessonSection(title: 'Briefing 6', content: 'Game downloads and updates consume significant bandwidth.'),
        LessonSection(title: 'Briefing 7', content: 'Multiplayer servers run 24/7 maintaining persistent worlds.'),
        LessonSection(title: 'Briefing 8', content: 'Physical game production involves plastic and packaging.'),
        LessonSection(title: 'Briefing 9', content: 'Digital-only games reduce physical waste.'),
        LessonSection(title: 'Briefing 10', content: 'Game subscriptions can reduce individual purchases.'),
        LessonSection(title: 'Learn 1', content: 'A high-end gaming PC can use 300-1000 watts during intense games.'),
        LessonSection(title: 'Learn 2', content: 'Cloud gaming typically uses 10-15x more energy per hour.'),
        LessonSection(title: 'Learn 3', content: 'Streaming quality settings directly impact energy use.'),
        LessonSection(title: 'Learn 4', content: 'Voice chat adds additional network overhead during games.'),
        LessonSection(title: 'Learn 5', content: 'Background downloads continue consuming resources.'),
        LessonSection(title: 'Learn 6', content: 'Game updates often require full downloads again.'),
        LessonSection(title: 'Learn 7', content: 'Multiplayer sessions keep servers active longer.'),
        LessonSection(title: 'Learn 8', content: 'Cloud saves require continuous server synchronization.'),
        LessonSection(title: 'Learn 9', content: 'Achievements and social features add server load.'),
        LessonSection(title: 'Learn 10', content: 'Cross-platform play increases server complexity.'),
        LessonSection(title: 'Learn 11', content: 'Game streaming quality affects video encoding energy.'),
        LessonSection(title: 'Learn 12', content: 'Controller charging and accessories add to total energy.'),
        LessonSection(title: 'Learn 13', content: 'Display brightness significantly impacts laptop gaming.'),
        LessonSection(title: 'Learn 14', content: 'External monitors increase overall power consumption.'),
        LessonSection(title: 'Learn 15', content: 'Mechanical keyboards consume more power than membrane.'),
        LessonSection(title: 'Learn 16', content: 'RGB lighting systems add continuous power draw.'),
        LessonSection(title: 'Learn 17', content: 'Streaming while gaming doubles the energy impact.'),
        LessonSection(title: 'Learn 18', content: 'Recording gameplay adds additional processing overhead.'),
        LessonSection(title: 'Learn 19', content: 'Chat applications run alongside games consuming resources.'),
        LessonSection(title: 'Learn 20', content: 'Seasonal events increase server load for special content.'),
        LessonSection(title: 'Field 1', content: 'Check your gaming PC or console power settings.'),
        LessonSection(title: 'Field 2', content: 'Count how many hours you game weekly.'),
        LessonSection(title: 'Field 3', content: 'Note if you use streaming or local gaming.'),
        LessonSection(title: 'Field 4', content: 'Check streaming quality settings on your platform.'),
        LessonSection(title: 'Field 5', content: 'Identify devices that stay powered during gaming.'),
        LessonSection(title: 'Field 6', content: 'Count RGB lighting devices in your setup.'),
        LessonSection(title: 'Field 7', content: 'Note if you leave consoles in standby mode.'),
        LessonSection(title: 'Field 8', content: 'Count games downloaded vs physical copies.'),
        LessonSection(title: 'Field 9', content: 'Identify if you use game sharing features.'),
        LessonSection(title: 'Field 10', content: 'Check if you use cloud saves.'),
        LessonSection(title: 'Field 11', content: 'Count active gaming subscriptions.'),
        LessonSection(title: 'Field 12', content: 'Identify if you watch gaming streams.'),
        LessonSection(title: 'Field 13', content: 'Note if you use VR gaming.'),
        LessonSection(title: 'Field 14', content: 'Check your display brightness during gaming.'),
        LessonSection(title: 'Field 15', content: 'Count gaming-related devices in your home.'),
        LessonSection(title: 'Field 16', content: 'Identify if you participate in esports events.'),
        LessonSection(title: 'Field 17', content: 'Note your gaming during off-peak hours.'),
        LessonSection(title: 'Field 18', content: 'Check if you use gaming-focused power strips.'),
        LessonSection(title: 'Field 19', content: 'Note your console update frequency.'),
        LessonSection(title: 'Field 20', content: 'Review your gaming energy cost monthly.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q11-1', question: 'How much energy does a gaming console use during gameplay?', options: [QuizOption(text: '10-50W'), QuizOption(text: '50-150W', isCorrect: true), QuizOption(text: '200-300W'), QuizOption(text: '500W+')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q11-2', question: 'How much more energy does cloud gaming use vs local?', options: [QuizOption(text: '2x'), QuizOption(text: '5x'), QuizOption(text: '10-15x', isCorrect: true), QuizOption(text: '20x')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q11-3', question: 'What percentage of internet traffic is gaming?', options: [QuizOption(text: '5%'), QuizOption(text: '15%'), QuizOption(text: '30%', isCorrect: true), QuizOption(text: '50%')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q11-4', question: 'How much data does 4K streaming use per hour?', options: [QuizOption(text: '1GB'), QuizOption(text: '3GB'), QuizOption(text: '7GB', isCorrect: true), QuizOption(text: '15GB')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q11-5', question: 'What do VR games increase energy use by?', options: [QuizOption(text: '5-10%'), QuizOption(text: '10-20%'), QuizOption(text: '20-40%', isCorrect: true), QuizOption(text: '50-60%')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q11-6', question: 'How much energy does RGB lighting add?', options: [QuizOption(text: '5-10W'), QuizOption(text: '10-20W', isCorrect: true), QuizOption(text: '30-40W'), QuizOption(text: '50W+')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q11-7', question: 'What percentage of home energy is wasted on standby?', options: [QuizOption(text: '5-10%'), QuizOption(text: '10-20%', isCorrect: true), QuizOption(text: '25-35%'), QuizOption(text: '40-50%')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q11-8', question: 'How much energy does a gaming PC use?', options: [QuizOption(text: '100-300W'), QuizOption(text: '300-1000W', isCorrect: true), QuizOption(text: '1000-2000W'), QuizOption(text: '2000W+')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q11-9', question: 'What is more energy efficient than gaming?', options: [QuizOption(text: 'Streaming movies'), QuizOption(text: 'Mobile gaming'), QuizOption(text: 'Retro gaming', isCorrect: true), QuizOption(text: 'VR gaming')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q11-10', question: 'How can game subscriptions reduce energy use?', options: [QuizOption(text: 'Reduce downloads'), QuizOption(text: 'Share accounts'), QuizOption(text: 'Reduce physical production', isCorrect: true), QuizOption(text: 'Lower graphics quality')], correctAnswerIndex: 2),
      ],
    ),
    Lesson(
      id: 'tg-12',
      title: 'Mission 12: The Chain Reaction',
      description:
          'Understand the environmental controversy surrounding cryptocurrencies and blockchain technology.',
      category: category,
      durationMinutes: 50,
      icon: 'currency_bitcoin',
      content: 'Blockchain technology has a significant energy footprint.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'Mining certain cryptocurrencies requires massive server farms running 24/7.'),
        LessonSection(title: 'Briefing 2', content: 'Bitcoin mining alone uses more electricity than many countries.'),
        LessonSection(title: 'Briefing 3', content: 'Each Bitcoin transaction can consume enough energy to power a house for days.'),
        LessonSection(title: 'Briefing 4', content: 'Data centers for crypto operate at full capacity constantly.'),
        LessonSection(title: 'Briefing 5', content: 'Cooling systems for mining rigs add to energy consumption.'),
        LessonSection(title: 'Briefing 6', content: 'Proof of Work systems are intentionally energy-intensive.'),
        LessonSection(title: 'Briefing 7', content: 'Hardware manufacturing for mining creates electronic waste.'),
        LessonSection(title: 'Briefing 8', content: 'Energy sources for mining often come from fossil fuels.'),
        LessonSection(title: 'Briefing 9', content: 'Mining difficulty increases as more miners join the network.'),
        LessonSection(title: 'Briefing 10', content: 'Some cryptocurrencies are moving to greener alternatives.'),
        LessonSection(title: 'Learn 1', content: 'Proof of Work requires solving complex mathematical puzzles.'),
        LessonSection(title: 'Learn 2', content: 'Proof of Stake validates transactions without mining.'),
        LessonSection(title: 'Learn 3', content: 'Ethereum reduced energy use by 99.95% after switching to Proof of Stake.'),
        LessonSection(title: 'Learn 4', content: 'Renewable energy adoption by miners is increasing but still limited.'),
        LessonSection(title: 'Learn 5', content: 'Layer 2 solutions reduce main chain transaction volume.'),
        LessonSection(title: 'Learn 6', content: 'Carbon offsets are being used by some blockchain projects.'),
        LessonSection(title: 'Learn 7', content: 'Green mining pools prioritize renewable energy sources.'),
        LessonSection(title: 'Learn 8', content: 'Token staking replaces energy-intensive mining.'),
        LessonSection(title: 'Learn 9', content: 'Solar-powered mining operations are emerging.'),
        LessonSection(title: 'Learn 10', content: 'Regulatory pressure pushes for sustainable practices.'),
        LessonSection(title: 'Learn 11', content: 'Energy-efficient consensus mechanisms are being developed.'),
        LessonSection(title: 'Learn 12', content: 'Blockchain energy use varies significantly by network.'),
        LessonSection(title: 'Learn 13', content: 'Lightweight wallets reduce individual energy impact.'),
        LessonSection(title: 'Learn 14', content: 'Decentralized finance (DeFi) has its own energy costs.'),
        LessonSection(title: 'Learn 15', content: 'Non-fungible tokens (NFTs) have high minting costs.'),
        LessonSection(title: 'Learn 16', content: 'Cross-chain bridges improve efficiency.'),
        LessonSection(title: 'Learn 17', content: 'Zero-knowledge proofs reduce verification energy.'),
        LessonSection(title: 'Learn 18', content: 'Sharding distributes network load efficiently.'),
        LessonSection(title: 'Learn 19', content: 'Off-chain transactions reduce mainnet energy use.'),
        LessonSection(title: 'Learn 20', content: 'Future protocols aim for carbon neutrality.'),
        LessonSection(title: 'Field 1', content: 'Research which cryptocurrencies use Proof of Stake.'),
        LessonSection(title: 'Field 2', content: 'Check your mining pool energy sources.'),
        LessonSection(title: 'Field 3', content: 'Count transactions on your wallet.'),
        LessonSection(title: 'Field 4', content: 'Note if you stake or mine cryptocurrencies.'),
        LessonSection(title: 'Field 5', content: 'Track your gas fees on Ethereum.'),
        LessonSection(title: 'Field 6', content: 'Identify NFTs you have purchased.'),
        LessonSection(title: 'Field 7', content: 'Check if you use layer 2 solutions.'),
        LessonSection(title: 'Field 8', content: 'Review your DeFi protocol usage.'),
        LessonSection(title: 'Field 9', content: 'Count wallets you actively use.'),
        LessonSection(title: 'Field 10', content: 'Note if you participate in airdrops.'),
        LessonSection(title: 'Field 11', content: 'Check your exchange trading volume.'),
        LessonSection(title: 'Field 12', content: 'Identify if you mine cryptocurrency.'),
        LessonSection(title: 'Field 13', content: 'Review your staking portfolio.'),
        LessonSection(title: 'Field 14', content: 'Count NFT collections you own.'),
        LessonSection(title: 'Field 15', content: 'Note your blockchain energy awareness.'),
        LessonSection(title: 'Field 16', content: 'Check if you use green wallets.'),
        LessonSection(title: 'Field 17', content: 'Identify sustainable crypto projects.'),
        LessonSection(title: 'Field 18', content: 'Review your energy-efficient trading practices.'),
        LessonSection(title: 'Field 19', content: 'Track renewable energy mining participation.'),
        LessonSection(title: 'Field 20', content: 'Calculate your crypto carbon footprint.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q12-1', question: 'How much energy does Bitcoin mining use?', options: [QuizOption(text: 'Less than 50 TWh/year'), QuizOption(text: 'About 100 TWh/year', isCorrect: true), QuizOption(text: 'More than 200 TWh/year'), QuizOption(text: 'Less than 10 TWh/year')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q12-2', question: 'What is Proof of Stake vs Proof of Work?', options: [QuizOption(text: 'Same energy use'), QuizOption(text: 'Proof of Stake uses 99% less energy', isCorrect: true), QuizOption(text: 'Proof of Work is greener'), QuizOption(text: 'Neither uses energy')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q12-3', question: 'How much energy does one Bitcoin transaction use?', options: [QuizOption(text: '0.01 kWh'), QuizOption(text: 'About 1 kWh'), QuizOption(text: '270 kWh', isCorrect: true), QuizOption(text: '1000 kWh')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q12-4', question: 'What percentage of Bitcoin mining uses renewable energy?', options: [QuizOption(text: '5-10%'), QuizOption(text: '15-25%'), QuizOption(text: '30-40%', isCorrect: true), QuizOption(text: '50-60%')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q12-5', question: 'Which is more energy efficient?', options: [QuizOption(text: 'Bitcoin mining'), QuizOption(text: 'Ethereum staking', isCorrect: true), QuizOption(text: 'Both equal'), QuizOption(text: 'Neither uses energy')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q12-6', question: 'What are NFTs energy intensive for?', options: [QuizOption(text: 'Minting only'), QuizOption(text: 'Minting and trading', isCorrect: true), QuizOption(text: 'Storage only'), QuizOption(text: 'Viewing only')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q12-7', question: 'How much CO2 does Bitcoin emit annually?', options: [QuizOption(text: '10 million tons'), QuizOption(text: '50 million tons'), QuizOption(text: '65 million tons', isCorrect: true), QuizOption(text: '100 million tons')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q12-8', question: 'What helps reduce blockchain energy use?', options: [QuizOption(text: 'More mining'), QuizOption(text: 'Layer 2 solutions', isCorrect: true), QuizOption(text: 'Larger blocks'), QuizOption(text: 'Faster transactions')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q12-9', question: 'What is the energy cost of DeFi?', options: [QuizOption(text: 'Very low'), QuizOption(text: 'Moderate'), QuizOption(text: 'High, but less than mining', isCorrect: true), QuizOption(text: 'Zero')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q12-10', question: 'Which blockchain is most energy efficient?', options: [QuizOption(text: 'Bitcoin'), QuizOption(text: 'Ethereum (post-merge)', isCorrect: true), QuizOption(text: 'Ethereum (pre-merge)'), QuizOption(text: 'Litecoin')], correctAnswerIndex: 1),
      ],
    ),
    Lesson(
      id: 'tg-13',
      title: 'Mission 13: Powering the Future',
      description:
          'Explore how renewable energy sources like solar and wind are being used to power our digital lives.',
      category: category,
      durationMinutes: 50,
      icon: 'wb_sunny',
      content:
          'Transitioning the internet to 100% renewables is the ultimate goal.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'The carbon footprint of our gadgets depends heavily on the local power grid.'),
        LessonSection(title: 'Briefing 2', content: 'Solar farms power data centers during daylight hours.'),
        LessonSection(title: 'Briefing 3', content: 'Wind energy powers server farms at night.'),
        LessonSection(title: 'Briefing 4', content: 'Battery storage helps balance renewable supply and demand.'),
        LessonSection(title: 'Briefing 5', content: 'Hydroelectric dams provide consistent baseload power.'),
        LessonSection(title: 'Briefing 6', content: 'Geothermal energy offers stable temperatures for cooling.'),
        LessonSection(title: 'Briefing 7', content: 'Data centers are increasingly located near renewable sources.'),
        LessonSection(title: 'Briefing 8', content: 'Google and Apple have achieved carbon-neutral operations.'),
        LessonSection(title: 'Briefing 9', content: 'Microsoft aims for carbon-negative by 2030.'),
        LessonSection(title: 'Briefing 10', content: 'Some companies power operations entirely with renewables.'),
        LessonSection(title: 'Learn 1', content: 'Using apps during times of high renewable availability reduces your effective footprint.'),
        LessonSection(title: 'Learn 2', content: 'Smart grids balance electricity demand with renewable supply.'),
        LessonSection(title: 'Learn 3', content: 'Energy storage systems store excess renewable energy.'),
        LessonSection(title: 'Learn 4', content: 'Microgrids can operate independently from the main grid.'),
        LessonSection(title: 'Learn 5', content: 'Green hydrogen is being explored for long-term storage.'),
        LessonSection(title: 'Learn 6', content: 'Virtual power plants aggregate distributed renewable sources.'),
        LessonSection(title: 'Learn 7', content: 'Demand response programs shift usage to renewable peaks.'),
        LessonSection(title: 'Learn 8', content: 'Time-of-use pricing encourages green energy usage.'),
        LessonSection(title: 'Learn 9', content: 'Community solar programs expand renewable access.'),
        LessonSection(title: 'Learn 10', content: 'Power purchase agreements lock in renewable energy rates.'),
        LessonSection(title: 'Learn 11', content: 'Carbon-aware computing shifts workloads to green periods.'),
        LessonSection(title: 'Learn 12', content: 'Renewable energy certificates verify green energy usage.'),
        LessonSection(title: 'Learn 13', content: 'Green tariffs provide dedicated renewable power.'),
        LessonSection(title: 'Learn 14', content: 'On-site solar reduces grid dependence.'),
        LessonSection(title: 'Learn 15', content: 'Energy-per-computation metrics guide efficient design.'),
        LessonSection(title: 'Learn 16', content: 'Cooling innovations reduce data center energy needs.'),
        LessonSection(title: 'Learn 17', content: 'Liquid cooling improves thermal efficiency.'),
        LessonSection(title: 'Learn 18', content: 'Heat recovery systems reuse waste energy.'),
        LessonSection(title: 'Learn 19', content: 'AI optimizes energy usage in real-time.'),
        LessonSection(title: 'Learn 20', content: 'Future grids will be fully renewable and smart.'),
        LessonSection(title: 'Field 1', content: 'Check your electricity provider\'s renewable energy percentage.'),
        LessonSection(title: 'Field 2', content: 'Note if you charge devices during daylight hours.'),
        LessonSection(title: 'Field 3', content: 'Track your home energy usage patterns.'),
        LessonSection(title: 'Field 4', content: 'Identify if you use a smart power meter.'),
        LessonSection(title: 'Field 5', content: 'Count renewable energy apps you use.'),
        LessonSection(title: 'Field 6', content: 'Check if your ISP uses green energy.'),
        LessonSection(title: 'Field 7', content: 'Note your streaming time relative to sunrise/sunset.'),
        LessonSection(title: 'Field 8', content: 'Review your device charging habits.'),
        LessonSection(title: 'Field 9', content: 'Identify your home\'s energy efficiency rating.'),
        LessonSection(title: 'Field 10', content: 'Track your carbon footprint monthly.'),
        LessonSection(title: 'Field 11', content: 'Check if you have solar panels installed.'),
        LessonSection(title: 'Field 12', content: 'Note your electricity rates during peak hours.'),
        LessonSection(title: 'Field 13', content: 'Review your utility\'s renewable energy options.'),
        LessonSection(title: 'Field 14', content: 'Identify demand response program availability.'),
        LessonSection(title: 'Field 15', content: 'Check your workplace\'s green energy policies.'),
        LessonSection(title: 'Field 16', content: 'Track your EV charging energy source.'),
        LessonSection(title: 'Field 17', content: 'Note your battery storage usage.'),
        LessonSection(title: 'Field 18', content: 'Review your heating/cooling energy source.'),
        LessonSection(title: 'Field 19', content: 'Identify your home\'s insulation quality.'),
        LessonSection(title: 'Field 20', content: 'Calculate your renewable energy percentage.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q13-1', question: 'What percentage of data centers use renewable energy?', options: [QuizOption(text: '10-20%'), QuizOption(text: '30-40%', isCorrect: true), QuizOption(text: '60-70%'), QuizOption(text: '90%+')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-2', question: 'How much energy does a data center use?', options: [QuizOption(text: '1-5 MW'), QuizOption(text: '5-20 MW'), QuizOption(text: '10-50 MW', isCorrect: true), QuizOption(text: '100+ MW')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q13-3', question: 'What is the main benefit of renewable energy for data centers?', options: [QuizOption(text: 'Lower cost only'), QuizOption(text: 'Zero emissions', isCorrect: true), QuizOption(text: 'Faster processing'), QuizOption(text: 'More storage')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-4', question: 'How much CO2 does a data center emit annually?', options: [QuizOption(text: '10,000 tons'), QuizOption(text: '50,000 tons'), QuizOption(text: '100,000 tons', isCorrect: true), QuizOption(text: '1 million tons')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q13-5', question: 'What helps balance renewable supply and demand?', options: [QuizOption(text: 'More fossil fuels'), QuizOption(text: 'Battery storage', isCorrect: true), QuizOption(text: 'Coal plants'), QuizOption(text: 'Nuclear reactors')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-6', question: 'What is carbon-aware computing?', options: [QuizOption(text: 'Using more coal'), QuizOption(text: 'Shifting workloads to green periods', isCorrect: true), QuizOption(text: 'Increasing emissions'), QuizOption(text: 'Ignoring carbon footprint')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-7', question: 'How much energy do data centers consume globally?', options: [QuizOption(text: '1% of global energy'), QuizOption(text: '2% of global energy', isCorrect: true), QuizOption(text: '5% of global energy'), QuizOption(text: '10% of global energy')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-8', question: 'What is the goal of Google\'s energy strategy?', options: [QuizOption(text: 'More fossil fuels'), QuizOption(text: 'Carbon neutral operations', isCorrect: true), QuizOption(text: 'Increase energy use'), QuizOption(text: 'No energy goals')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-9', question: 'How do virtual power plants help?', options: [QuizOption(text: 'Increase emissions'), QuizOption(text: 'Aggregate distributed renewable sources', isCorrect: true), QuizOption(text: 'Use more coal'), QuizOption(text: 'Reduce efficiency')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q13-10', question: 'What is the future of internet energy?', options: [QuizOption(text: '100% fossil fuels'), QuizOption(text: '100% renewables', isCorrect: true), QuizOption(text: 'Nuclear only'), QuizOption(text: 'No change')], correctAnswerIndex: 1),
      ],
    ),
    Lesson(
      id: 'tg-14',
      title: 'Mission 14: Access for All',
      description:
          'Learn why making the digital world accessible to everyone is a key part of sustainability.',
      category: category,
      durationMinutes: 50,
      icon: 'accessibility',
      content: 'Sustainability includes social equity and digital inclusion.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'The Digital Divide prevents many from accessing eco-friendly digital tools.'),
        LessonSection(title: 'Briefing 2', content: 'Older devices consume more energy per computation than modern efficient ones.'),
        LessonSection(title: 'Briefing 3', content: 'Lightweight apps extend device lifespan and reduce e-waste.'),
        LessonSection(title: 'Briefing 4', content: 'Rural areas often lack fiber infrastructure for efficient digital services.'),
        LessonSection(title: 'Briefing 5', content: 'Low-income households may not afford sustainable tech upgrades.'),
        LessonSection(title: 'Briefing 6', content: 'Digital literacy programs help communities adopt green technologies.'),
        LessonSection(title: 'Briefing 7', content: 'Open source software reduces licensing costs for developing regions.'),
        LessonSection(title: 'Briefing 8', content: 'Shared devices in households reduce per-person energy use.'),
        LessonSection(title: 'Briefing 9', content: 'Public libraries provide access to sustainable digital resources.'),
        LessonSection(title: 'Briefing 10', content: 'Affordable smartphones enable participation in the digital economy.'),
        LessonSection(title: 'Learn 1', content: 'Building lightweight, accessible apps ensures older devices can participate in the green transition.'),
        LessonSection(title: 'Learn 2', content: 'Progressive web apps work on older browsers and devices.'),
        LessonSection(title: 'Learn 3', content: 'Low-bandwidth modes reduce data transmission energy.'),
        LessonSection(title: 'Learn 4', content: 'Text-based interfaces consume less energy than graphics-heavy designs.'),
        LessonSection(title: 'Learn 5', content: 'Offline functionality reduces network energy use.'),
        LessonSection(title: 'Learn 6', content: 'Dark mode can extend battery life on OLED screens.'),
        LessonSection(title: 'Learn 7', content: 'Voice interfaces reduce visual processing requirements.'),
        LessonSection(title: 'Learn 8', content: 'Simplified navigation reduces cognitive load and device usage.'),
        LessonSection(title: 'Learn 9', content: 'Language localization improves accessibility globally.'),
        LessonSection(title: 'Learn 10', content: 'Keyboard shortcuts reduce mouse/trackpad energy use.'),
        LessonSection(title: 'Learn 11', content: 'Screen readers enable visually impaired users to access digital tools.'),
        LessonSection(title: 'Learn 12', content: 'High contrast modes improve readability for aging populations.'),
        LessonSection(title: 'Learn 13', content: 'Reduced motion settings help users with vestibular disorders.'),
        LessonSection(title: 'Learn 14', content: 'Text scaling accommodates visual impairments.'),
        LessonSection(title: 'Learn 15', content: 'Captions and transcripts make video content accessible.'),
        LessonSection(title: 'Learn 16', content: 'Alternative input methods support motor disabilities.'),
        LessonSection(title: 'Learn 17', content: 'Simple interfaces reduce device processing requirements.'),
        LessonSection(title: 'Learn 18', content: 'Caching strategies reduce repeated data transfers.'),
        LessonSection(title: 'Learn 19', content: 'Preloading critical resources improves performance.'),
        LessonSection(title: 'Learn 20', content: 'Resource compression reduces bandwidth and energy.'),
        LessonSection(title: 'Field 1', content: 'Check your device\'s accessibility settings.'),
        LessonSection(title: 'Field 2', content: 'Note if you use high contrast mode.'),
        LessonSection(title: 'Field 3', content: 'Count apps with accessibility features.'),
        LessonSection(title: 'Field 4', content: 'Identify if you use screen readers.'),
        LessonSection(title: 'Field 5', content: 'Check if you use keyboard shortcuts.'),
        LessonSection(title: 'Field 6', content: 'Note your device\'s text scaling.'),
        LessonSection(title: 'Field 7', content: 'Review your app\'s offline capabilities.'),
        LessonSection(title: 'Field 8', content: 'Identify if you use dark mode.'),
        LessonSection(title: 'Field 9', content: 'Count accessible websites you visit.'),
        LessonSection(title: 'Field 10', content: 'Check if you use voice commands.'),
        LessonSection(title: 'Field 11', content: 'Note your device\'s battery optimization settings.'),
        LessonSection(title: 'Field 12', content: 'Review your app\'s bandwidth usage.'),
        LessonSection(title: 'Field 13', content: 'Identify lightweight apps you use.'),
        LessonSection(title: 'Field 14', content: 'Check if you have old devices in use.'),
        LessonSection(title: 'Field 15', content: 'Note your public library digital resources.'),
        LessonSection(title: 'Field 16', content: 'Review your household device sharing.'),
        LessonSection(title: 'Field 17', content: 'Identify your digital literacy skills.'),
        LessonSection(title: 'Field 18', content: 'Track your app\'s processing intensity.'),
        LessonSection(title: 'Field 19', content: 'Check your internet connection efficiency.'),
        LessonSection(title: 'Field 20', content: 'Calculate your digital inclusion impact.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q14-1', question: 'Why is accessibility important for sustainability?', options: [QuizOption(text: 'It doesn\'t matter'), QuizOption(text: 'It allows everyone to use efficient digital tools', isCorrect: true), QuizOption(text: 'It makes devices more expensive'), QuizOption(text: 'It increases energy use')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-2', question: 'How do older devices affect sustainability?', options: [QuizOption(text: 'They use less energy'), QuizOption(text: 'They consume more energy per computation', isCorrect: true), QuizOption(text: 'They are perfect'), QuizOption(text: 'They have no impact')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-3', question: 'What do lightweight apps help reduce?', options: [QuizOption(text: 'E-waste', isCorrect: true), QuizOption(text: 'Water usage'), QuizOption(text: 'Paper consumption'), QuizOption(text: 'Food waste')], correctAnswerIndex: 0),
        Quiz(id: 'tg-q14-4', question: 'Why are progressive web apps beneficial?', options: [QuizOption(text: 'Work on older devices', isCorrect: true), QuizOption(text: 'Require expensive hardware'), QuizOption(text: 'Use more energy'), QuizOption(text: 'Need internet always')], correctAnswerIndex: 0),
        Quiz(id: 'tg-q14-5', question: 'How does dark mode help sustainability?', options: [QuizOption(text: 'Makes screens brighter'), QuizOption(text: 'Extends battery life on OLED screens', isCorrect: true), QuizOption(text: 'Uses more energy'), QuizOption(text: 'Requires new devices')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-6', question: 'What is the Digital Divide?', options: [QuizOption(text: 'A type of encryption'), QuizOption(text: 'Gap in digital access', isCorrect: true), QuizOption(text: 'A programming language'), QuizOption(text: 'A hardware standard')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-7', question: 'How can public libraries help?', options: [QuizOption(text: 'By limiting access'), QuizOption(text: 'By providing digital resources', isCorrect: true), QuizOption(text: 'By increasing costs'), QuizOption(text: 'By reducing bandwidth')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-8', question: 'What does screen reader accessibility enable?', options: [QuizOption(text: 'Visually impaired users', isCorrect: true), QuizOption(text: 'Hearing impaired users'), QuizOption(text: 'Motor impaired users'), QuizOption(text: 'Cognitive impaired users')], correctAnswerIndex: 0),
        Quiz(id: 'tg-q14-9', question: 'How does device sharing help sustainability?', options: [QuizOption(text: 'Increases energy per person'), QuizOption(text: 'Reduces per-person energy use', isCorrect: true), QuizOption(text: 'Requires more devices'), QuizOption(text: 'Increases e-waste')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q14-10', question: 'What is the benefit of offline functionality?', options: [QuizOption(text: 'Reduces network energy', isCorrect: true), QuizOption(text: 'Requires constant internet'), QuizOption(text: 'Uses more processing'), QuizOption(text: 'Increases latency')], correctAnswerIndex: 0),
      ],
    ),
    Lesson(
      id: 'tg-15',
      title: 'Mission 15: Digital Shield',
      description:
          'Protect your digital identity and understand the environmental cost of data breaches.',
      category: category,
      durationMinutes: 50,
      icon: 'security',
      content: 'Cybersecurity and sustainability are linked.',
      sections: [
        LessonSection(title: 'Briefing 1', content: 'Spam, botnets, and data breaches waste massive amounts of energy.'),
        LessonSection(title: 'Briefing 2', content: 'Botnets can consist of millions of compromised devices.'),
        LessonSection(title: 'Briefing 3', content: 'Spam emails consume energy in transmission and filtering.'),
        LessonSection(title: 'Briefing 4', content: 'Data center audits after breaches require significant server energy.'),
        LessonSection(title: 'Briefing 5', content: 'Password reset processes generate additional computational load.'),
        LessonSection(title: 'Briefing 6', content: 'Security patches require system updates and restarts.'),
        LessonSection(title: 'Briefing 7', content: 'Encryption adds computational overhead to protect data.'),
        LessonSection(title: 'Briefing 8', content: 'Multi-factor authentication increases server requests.'),
        LessonSection(title: 'Briefing 9', content: 'Security monitoring tools run continuously.'),
        LessonSection(title: 'Briefing 10', content: 'Backup systems consume energy storing redundant data.'),
        LessonSection(title: 'Learn 1', content: 'A single data breach can require millions of servers to be audited and reset, causing a huge energy spike.'),
        LessonSection(title: 'Learn 2', content: 'Spam accounts for 45% of all emails sent daily.'),
        LessonSection(title: 'Learn 3', content: 'Botnet energy consumption rivals small countries.'),
        LessonSection(title: 'Learn 4', content: 'Ransomware attacks force organizations to use backup systems.'),
        LessonSection(title: 'Learn 5', content: 'Zero-day vulnerabilities require emergency patches.'),
        LessonSection(title: 'Learn 6', content: 'DDoS attacks overwhelm servers with traffic.'),
        LessonSection(title: 'Learn 7', content: 'Cloud security requires encryption at rest and in transit.'),
        LessonSection(title: 'Learn 8', content: 'Identity verification adds computational overhead.'),
        LessonSection(title: 'Learn 9', content: 'Compliance audits require additional reporting systems.'),
        LessonSection(title: 'Learn 10', content: 'Security incident response teams work overtime.'),
        LessonSection(title: 'Learn 11', content: 'Backup retention policies increase storage energy.'),
        LessonSection(title: 'Learn 12', content: 'Key management systems require secure hardware.'),
        LessonSection(title: 'Learn 13', content: 'Certificate authorities consume energy validating identities.'),
        LessonSection(title: 'Learn 14', content: 'Firewall rules require continuous packet inspection.'),
        LessonSection(title: 'Learn 15', content: 'Intrusion detection systems analyze all network traffic.'),
        LessonSection(title: 'Learn 16', content: 'Log aggregation for compliance uses storage energy.'),
        LessonSection(title: 'Learn 17', content: 'Penetration testing requires additional computing resources.'),
        LessonSection(title: 'Learn 18', content: 'Security awareness training requires digital delivery.'),
        LessonSection(title: 'Learn 19', content: 'Incident documentation generates digital waste.'),
        LessonSection(title: 'Learn 20', content: 'Post-incident recovery requires system restoration energy.'),
        LessonSection(title: 'Field 1', content: 'Check your spam folder for email volume.'),
        LessonSection(title: 'Field 2', content: 'Note if you use multi-factor authentication.'),
        LessonSection(title: 'Field 3', content: 'Count your password reset frequency.'),
        LessonSection(title: 'Field 4', content: 'Identify if you use a password manager.'),
        LessonSection(title: 'Field 5', content: 'Review your backup storage usage.'),
        LessonSection(title: 'Field 6', content: 'Check if you use encrypted connections.'),
        LessonSection(title: 'Field 7', content: 'Note your security update frequency.'),
        LessonSection(title: 'Field 8', content: 'Count your active security subscriptions.'),
        LessonSection(title: 'Field 9', content: 'Identify your phishing awareness level.'),
        LessonSection(title: 'Field 10', content: 'Review your privacy settings.'),
        LessonSection(title: 'Field 11', content: 'Check your auto-lock settings.'),
        LessonSection(title: 'Field 12', content: 'Note your cloud storage security.'),
        LessonSection(title: 'Field 13', content: 'Review your social media privacy.'),
        LessonSection(title: 'Field 14', content: 'Count your security apps installed.'),
        LessonSection(title: 'Field 15', content: 'Identify your risk assessment frequency.'),
        LessonSection(title: 'Field 16', content: 'Check your employee security training.'),
        LessonSection(title: 'Field 17', content: 'Note your incident reporting process.'),
        LessonSection(title: 'Field 18', content: 'Review your compliance requirements.'),
        LessonSection(title: 'Field 19', content: 'Track your security budget allocation.'),
        LessonSection(title: 'Field 20', content: 'Calculate your security energy impact.'),
      ],
      quizzes: [
        Quiz(id: 'tg-q15-1', question: 'How do botnets affect the environment?', options: [QuizOption(text: 'They plant trees'), QuizOption(text: 'They use energy to perform malicious tasks', isCorrect: true), QuizOption(text: 'They have no impact'), QuizOption(text: 'They save energy')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-2', question: 'What percentage of emails is spam?', options: [QuizOption(text: '10%'), QuizOption(text: '25%'), QuizOption(text: '45%', isCorrect: true), QuizOption(text: '60%')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q15-3', question: 'How much energy does a data breach consume?', options: [QuizOption(text: 'Minimal'), QuizOption(text: 'Significant server energy spike', isCorrect: true), QuizOption(text: 'Zero'), QuizOption(text: 'Negative energy')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-4', question: 'What is the environmental cost of spam?', options: [QuizOption(text: 'Low'), QuizOption(text: 'Moderate'), QuizOption(text: 'High', isCorrect: true), QuizOption(text: 'Negative')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q15-5', question: 'How do DDoS attacks affect energy use?', options: [QuizOption(text: 'Reduce server load'), QuizOption(text: 'Overwhelm servers with traffic', isCorrect: true), QuizOption(text: 'Save energy'), QuizOption(text: 'No impact')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-6', question: 'What do backups consume?', options: [QuizOption(text: 'Zero energy'), QuizOption(text: 'Storage energy for redundant data', isCorrect: true), QuizOption(text: 'Negative energy'), QuizOption(text: 'Only during creation')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-7', question: 'How does encryption affect energy use?', options: [QuizOption(text: 'Reduces processing'), QuizOption(text: 'Adds computational overhead', isCorrect: true), QuizOption(text: 'No effect'), QuizOption(text: 'Negative impact')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-8', question: 'What is the benefit of multi-factor authentication?', options: [QuizOption(text: 'Increases server requests'), QuizOption(text: 'Improves security'), QuizOption(text: 'Both A and B', isCorrect: true), QuizOption(text: 'No benefit')], correctAnswerIndex: 2),
        Quiz(id: 'tg-q15-9', question: 'How does zero-day vulnerability affect energy?', options: [QuizOption(text: 'No effect'), QuizOption(text: 'Requires emergency patches', isCorrect: true), QuizOption(text: 'Saves energy'), QuizOption(text: 'Reduces impact')], correctAnswerIndex: 1),
        Quiz(id: 'tg-q15-10', question: 'What is the environmental impact of a breach?', options: [QuizOption(text: 'Audit millions of servers'), QuizOption(text: 'Require significant energy spike', isCorrect: true), QuizOption(text: 'Both A and B', isCorrect: true), QuizOption(text: 'No impact')], correctAnswerIndex: 2),
      ],
    ),
  ];
}
