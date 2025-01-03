import 'package:flutter/material.dart';
import 'dart:async';

import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Selamat datang di gojek!',
      description:
          'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhan mu, kapanpun, dan di manapun',
      image: 'assets/1.png',
    ),
    OnboardingItem(
      title: 'Transportasi & logistik',
      description:
          'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
      image: 'assets/2.png',
    ),
    OnboardingItem(
      title: 'Pesan makan & belanja',
      description: 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
      image: 'assets/3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _items.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsItems.primarywhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo-gojek.png',
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'gojek',
                        style: HeadingItems.h3,
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsItems.primary2,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'IND',
                      style: SubheadBodyItems.p4.copyWith(
                        color: ColorsItems.primarywhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _buildPage(_items[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _items.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // onpressed untuk langsung masuk ke dalam main
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsItems.greengojek,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Masuk',
                        style: SubheadBodyItems.p2.copyWith(
                          color: ColorsItems.primarywhite,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    // onPressed isi dengan navigasi ke halaman login
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: ColorsItems.greengojek),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Belum ada akun?, Daftar dulu',
                      style: SubheadBodyItems.p2.copyWith(
                        color: ColorsItems.greengojek,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: SubheadBodyItems.p4.copyWith(
                        color: ColorsItems.grey,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
                        ),
                        TextSpan(
                          text: 'Ketentuan layanan',
                          style: SubheadBodyItems.p4.copyWith(
                            color: ColorsItems.primary4,
                          ),
                        ),
                        const TextSpan(text: ' dan '),
                        TextSpan(
                          text: 'Kebijakan privasi',
                          style: SubheadBodyItems.p4.copyWith(
                            color: ColorsItems.primary4,
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          Text(
            item.title,
            style: HeadingItems.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: SubheadBodyItems.sh2.copyWith(color: ColorsItems.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? ColorsItems.greengojek
            : ColorsItems.grey.withOpacity(0.3),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
