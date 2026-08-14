import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = const Color.fromARGB(255, 166, 106, 4);
    final Color inactiveColor = const Color(0xFF8A8A8A);

    Widget _buildItem({required IconData icon, required String label, required int index}) {
      final isActive = index == currentIndex;
      return Expanded(
        child: GestureDetector(
          onTap: () => onTap(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive ? activeColor : inactiveColor,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: isActive ? activeColor : inactiveColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        children: [
          _buildItem(icon: Icons.home_outlined, label: 'Home', index: 0),
          _buildItem(icon: Icons.help_outline, label: 'Quiz', index: 1),
          // Center scanner button
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: 56,
                    height: 65,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 210, 179, 122),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4EE0DB).withOpacity(0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildItem(icon: Icons.search, label: 'Explore', index: 3),
        ],
      ),
    );
  }
}
