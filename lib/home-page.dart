import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';

class HomePage extends StatelessWidget {
  final List<String> _categories = [
    'Science',
    'Technology',
    'Art',
    'Music',
    'Gaming',
    'Books',
    'News',
    'Politics',
  ];

  final List<String> _discussions = [
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
            ],
          ),
        ),
      ),
    );
  }
}