// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav.dart';
import 'category_screen.dart';
import 'explore_screen.dart';
import 'quiz_screen.dart';
import 'scan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomeContent(),
    QuizScreen(),
    ScanScreen(),
    CategoryScreen(),
    ExploreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // light brown theme colors for this page
    final Color pageBg = const Color.fromARGB(255, 254, 254, 254);

    return Scaffold(
      backgroundColor: pageBg,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // light brown theme colors for this page
    final Color primaryText = const Color(0xFF3E2F2F);
    final Color secondaryText = const Color(0xFF6B4F3A);
    final Color accent = const Color(0xFF8C5E3C);
    final Color surface = const Color(0xFFF9F1EA);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  'Hi, Explorer',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: primaryText,
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                'What seashell will you discover today?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: secondaryText,
                ),
              ),
              const SizedBox(height: 18),

              // Banner carousel
              const SizedBox(height: 8),
              SizedBox(
                height: 160,
                child: _BannerCarousel(
                  images: const [
                    'lib/assets/images/banner/banner1.jpg',
                    'lib/assets/images/banner/banner2.jpg',
                    'lib/assets/images/banner/banner3.jpg',
                  ],
                  viewportFraction: 0.90,
                  autoPlayInterval: Duration(seconds: 5),
                ),
              ),

              const SizedBox(height: 12),

              // Categories row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: primaryText),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.poppins(color: const Color(0xFF9E7F60)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 86,
                child: _AutoScrollCategories(
                  items: const [
                    {'label': 'Gastropods', 'url': 'lib/assets/images/categories/gastropods.png'},
                    {'label': 'Bivalves', 'url': 'lib/assets/images/categories/Bivalves.png'},
                    {'label': 'Cephalopods', 'url': 'lib/assets/images/categories/Cephalopods.png'},
                    {'label': 'Scaphopods', 'url': 'lib/assets/images/categories/Scaphopods.png'},
                    {'label': 'Polyplacophora', 'url': 'lib/assets/images/categories/Polyplacophora.png'},
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Quick Actions
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 86,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3E8D9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: accent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Identify Shell',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13, color: primaryText),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Tap to scan',
                                  style: GoogleFonts.poppins(color: secondaryText, fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 86,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEE0D3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB08A6A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.quiz, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Quiz Time',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13, color: primaryText),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Test your knowledge',
                                  style: GoogleFonts.poppins(color: secondaryText, fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Explore shells header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Explore shells', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: primaryText)),
                  Text('See All', style: GoogleFonts.poppins(color: const Color(0xFF9E7F60))),
                ],
              ),
              const SizedBox(height: 8),

              // Explore grid (limited to a few items)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 0.85,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(_ExploreCard.shellImages.length, (index) => _ExploreCard(index: index)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerCarousel extends StatefulWidget {
  const _BannerCarousel({
    super.key,
    required this.images,
    this.viewportFraction = 0.75,
    this.speed = 0.8,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  final List<String> images;
  final double viewportFraction;
  final double speed; // pixels per tick (tick ~16ms)
  final Duration autoPlayInterval;

  @override
  State<_BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<_BannerCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _currentPage = 0;
  final int _loopMultiplier = 1000;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.images.length * 500;
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: _currentPage,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!mounted || !_controller.hasClients) return;
      _currentPage += 1;
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.images;
    final itemCount = items.length * _loopMultiplier;

    return PageView.builder(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      padEnds: false,
      pageSnapping: true,
      onPageChanged: (index) => _currentPage = index,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final imagePath = items[index % items.length];
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: imagePath.startsWith('http')
                  ? NetworkImage(imagePath)
                  : AssetImage(imagePath) as ImageProvider,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * widget.viewportFraction,
            ),
          ),
        );
      },
    );
  }
}

class _AutoScrollCategories extends StatefulWidget {
  const _AutoScrollCategories({required this.items, this.speed = 0.6, super.key});

  final List<Map<String, String>> items;
  final double speed; // pixels per tick (~16ms)

  @override
  State<_AutoScrollCategories> createState() => _AutoScrollCategoriesState();
}
class _AutoScrollCategoriesState extends State<_AutoScrollCategories> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    _timer?.cancel();
    // Wait for layout, then initialize at the middle and scroll left->right (decrement offset)
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      if (!_scrollController.hasClients) {
        Future.delayed(const Duration(milliseconds: 200), _startAutoScroll);
        return;
      }

      final maxScroll = _scrollController.position.maxScrollExtent;
      if (maxScroll <= 0) {
        Future.delayed(const Duration(milliseconds: 300), _startAutoScroll);
        return;
      }

      // Start in the middle so we can scroll in either direction and wrap smoothly
      final half = maxScroll / 2;
      _scrollController.jumpTo(half.clamp(0.0, maxScroll));

      _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
        if (!mounted || !_scrollController.hasClients) return;
        final max = _scrollController.position.maxScrollExtent;
        if (max <= 0) return;

        final next = _scrollController.offset - widget.speed; // move content rightwards
        if (next <= 0) {
          // wrap: move forward by half to continue seamlessly
          final resetTo = next + half;
          _scrollController.jumpTo(resetTo.clamp(0.0, max));
        } else {
          _scrollController.jumpTo(next);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<Map<String, String>>.from(widget.items)..addAll(widget.items);

    return ListView.separated(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 92,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 221, 184, 157)),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: (item['url'] ?? '').startsWith('http')
                        ? NetworkImage(item['url']!) as ImageProvider
                        : AssetImage(item['url'] ?? '') as ImageProvider,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item['label'] ?? '',
                style: GoogleFonts.poppins(fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ignore: unused_element
class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.label, required this.image});

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: image.startsWith('http')
                ? Image.network(image, fit: BoxFit.contain)
                : Image.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(height: 6),
          Text(label, style: GoogleFonts.poppins(fontSize: 12)),
        ],
      ),
    );
  }
}



class _ExploreCard extends StatelessWidget {
  const _ExploreCard({required this.index});
  final int index;

  static const shellImages = [
    'lib/assets/images/home-shells/abalones.png',
    'lib/assets/images/home-shells/cowries.png',
    'lib/assets/images/home-shells/Nautilus pompilius.png',
    'lib/assets/images/home-shells/oyster.png',
    'lib/assets/images/home-shells/textile cone.png',
    'lib/assets/images/home-shells/whelks.png',
  ];

  String get shellName {
    final filename = shellImages[index].split('/').last;
    return filename.replaceAll('.png', '');
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = shellImages[index];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(255, 221, 184, 157)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            shellName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
