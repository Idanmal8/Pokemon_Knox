import 'package:flutter/material.dart';
import 'dart:async';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  PokedexScreenState createState() => PokedexScreenState();
}

class PokedexScreenState extends State<PokedexScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [];
  int _nextItem = 0; // Tracker for the next item index

  @override
  void initState() {
    super.initState();
    _addItems(); // Start adding items when the widget is built
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildAnimatedItem(context, _items[index], animation); // Animation for each item
        },
      ),
    );
  }

  Widget _buildAnimatedItem(BuildContext context, int item, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start below the screen
          end: Offset.zero, // End at final position on screen
        ).animate(animation),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text('Pokemon $item'),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  void _addItems() {
    const duration = Duration(milliseconds: 150); // Duration between item additions
    Timer.periodic(duration, (timer) {
      if (_nextItem >= 10) {
        timer.cancel();
        return;
      }
      _items.add(_nextItem++);
      _listKey.currentState?.insertItem(_items.length - 1);
    });
  }
}
