import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'order_input_screen.dart';

class HomeScreen extends StatefulWidget {
  final AuthService authService;

  const HomeScreen({super.key, required this.authService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    OrderInputScreen(), // Đơn hàng
    Center(child: Text('Đơn hàng đang giao')),
    Center(child: Text('Dẫn đường với Maps API')),
    Center(child: Text('Trang cá nhân')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    await widget.authService.logout();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Ngăn người dùng quay lại màn hình trước
      child: Scaffold(
        // appBar: AppBar(
        //   // title: const Text('Trang chính'),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.logout),
        //       onPressed: _logout,
        //       tooltip: 'Đăng xuất',
        //     ),
        //   ],
        // ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            10,
          ), // chỉnh chiều cao AppBar ở đây
          child: AppBar(
            // title: const Text(
            //   'Len don hàng',
            //   style: TextStyle(fontSize: 16), // text nhỏ lại cho hợp chiều cao
            // ),
            automaticallyImplyLeading: false,
            // centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: _logout,
                tooltip: 'Đăng xuất',
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Địa chỉ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: 'Đang giao',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Bản đồ'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá nhân'),
          ],
        ),
      ),
    );
  }
}
