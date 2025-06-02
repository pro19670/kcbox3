// 📄 lib/main.dart
// 📄 main.dart *앱 실행코드*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/space.dart';
import 'models/room.dart';
import 'models/furniture.dart';
import 'models/item.dart';

import 'providers/space_provider.dart';
import 'providers/room_provider.dart'; // ✅ 파일명에 맞게 경로 확인
import 'providers/item_provider.dart'; // ✅ 파일명에 맞게 경로 확인
import 'providers/furniture_provider.dart'; // ✅ 파일명에 맞게 경로 확인
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // ✅ 초기화

  // ✅ 어댑터 등록
  Hive.registerAdapter(SpaceAdapter());
  Hive.registerAdapter(RoomAdapter());
  Hive.registerAdapter(FurnitureAdapter());
  Hive.registerAdapter(ItemAdapter());

    // ✅ 박스 열기
  await Hive.openBox<Space>('spaces');
  await Hive.openBox<Room>('rooms');
  await Hive.openBox<Furniture>('furnitures');
  await Hive.openBox<Item>('items');
    runApp(const KCBoxApp());
}

class KCBoxApp extends StatelessWidget {
  const KCBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // ✅ MultiProvider 추가
      providers: [
        ChangeNotifierProvider(create: (_) => SpaceProvider()), // ✅ SpaceProvider 등록
        ChangeNotifierProvider(create: (_) => RoomProvider()), // ✅ 여기에 추가
        ChangeNotifierProvider(create: (_) => ItemProvider()), // ✅ 여기에 추가
        ChangeNotifierProvider(create: (_) => FurnitureProvider()), // ✅ 여기에 추가
        // 추후 RoomProvider, ItemProvider 등도 여기에 추가
      ],
      child: MaterialApp(
        title: 'KCBox3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomeScreen(), // ✅ HomeScreen이 Provider 하위에 위치해야 오류 없음
      ),
    );
  }
}
