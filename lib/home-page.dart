import 'package:aplikasi_mobile/style.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: appColors.bodyText,
        elevation: 10.0,
        backgroundColor: appColors.mainColor,
        leading: Image.asset('assets/images/logo-white.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: appColors.bodyText.withOpacity(0.45),
              blurRadius: 10.0,
              offset: Offset(0, 0))
        ]),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: appColors.mainColor,
          elevation: 10.0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _categories = [
  'Science',
  'Technology',
  'Art',
  'Music',
  'Gaming',
  'Books',
  'News',
  'Politics'
];

List<String> _discussions = [
  'Artificial Intelligence and the Future of Work',
  'Space Exploration: The Next Giant Leap',
  'Climate Change and Sustainable Solutions',
  'The Ethics of Gene Editing',
  'The Power of Storytelling in a Digital Age',
  'Exploring the Mysteries of the Deep Sea',
  'The Rise of Virtual Reality and its Impact on Society',
  'Advances in Robotics: Friend or Foe?',
  'The Importance of Cybersecurity in a Connected World',
  'The Future of Food: Innovation and Sustainability',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < _categories.length; i++)
                      Chip(
                        label: Text(
                          _categories[i],
                          style: TextStyles.body
                              .copyWith(color: appColors.mainColor),
                        ),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: appColors.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                  ],
                ),
              ),

              const SizedBox(
                height: 32.0
              ),

              Text(
                'Popular Discussions',
                style: TextStyles.h1,
                textAlign: TextAlign.start,
              ),

              const SizedBox(
                height: 16.0
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < _discussions.length; i++)
                      InkWell(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: appColors.mainColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _discussions[
                                      i],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.body.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(
                height: 32.0,
              ),

              Text(
                'For You',
                style: TextStyles.h1,
                textAlign: TextAlign.start,
              ),

              const SizedBox(
                height: 16.0
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < _discussions.length; i++)
                      InkWell(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: appColors.mainColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _discussions[
                                      i],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.body.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(
                height: 32.0,
              ),

              Text(
                'Followed',
                style: TextStyles.h1,
                textAlign: TextAlign.start,
              ),

              const SizedBox(
                height: 16.0
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < _discussions.length; i++)
                      InkWell(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: appColors.mainColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _discussions[
                                      i],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.body.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Halaman Profile'),
    );
  }
}
