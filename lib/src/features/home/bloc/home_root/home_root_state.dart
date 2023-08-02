import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:temanbumil_web/src/features/home/ui/home_screen.dart';
import 'package:temanbumil_web/src/helpers/helpers.dart';

class HomeRootState extends Equatable {
  final int index;
  final List<BottomNavigationBarItem> menu;
  final List<Widget> children;

  const HomeRootState({
    this.index = 0,
    this.menu = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: 'Pesanan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profil',
      ),
    ],
    this.children = const [HomeScreen()],
  });

  HomeRootState copyWith({
    String? message,
    dynamic error,
    int? index,
    List<BottomNavigationBarItem>? menu,
    List<Widget>? children,
  }) {
    return HomeRootState(
      index: index ?? this.index,
      menu: menu ?? this.menu,
      children: children ?? this.children,
    );
  }

  @override
  List<Object?> get props => [menu, children, index];
}
