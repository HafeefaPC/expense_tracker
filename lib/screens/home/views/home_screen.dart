
import 'package:expensetracker/screens/home/views/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 3,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',  
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_square_fill),
            label: 'stats', 
          ),
        
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton:FloatingActionButton(onPressed: (){},
    shape: const CircleBorder(),
    child:Container(
      width:60,
      height:60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.tertiary,
          Theme.of(context).colorScheme.secondary,
           Theme.of(context).colorScheme.primary,
        ])
      ),
      child:const Icon(
      CupertinoIcons.add
    )
    )
    ),
  body: MainScreen(),
    );
  }
}