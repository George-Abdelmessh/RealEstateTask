

import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBarDesign () {
  return  BottomNavigationBar(
    items: const[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calculate_outlined),
        label: 'Asset',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.support_agent_outlined),
        label: 'Support',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ],
    currentIndex: 0,
    // backgroundColor: ,
  );
}