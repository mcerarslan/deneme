import 'package:deneme/home.dart';
import 'package:deneme/kunye.dart';
import 'package:deneme/photo_gallery.dart';
import 'package:deneme/writer.dart';
import 'package:deneme/videos.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomeScreen(),
    const  WriterPages(),
    const PhotoGalleryPages(),
    const VideosPages(),
    const KunyePages(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0 ,
          items: [
            BottomNavigationBarItem( icon: Icon(Icons.home), label: "Anasayfa"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Yazarlar"),
            BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined),label: "Foto Galeri"),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined),label: "Videolar"),
            BottomNavigationBarItem(icon: Icon(Icons.app_registration),label: "Künye"),
          ]
      ),
    );
  }
}
