import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _allCategories = [
    {'label': 'Bivalves', 'image': 'lib/assets/images/categories/Bivalves.png'},
    {'label': 'Cephalopods', 'image': 'lib/assets/images/categories/Cephalopods.png'},
    {'label': 'Gastropods', 'image': 'lib/assets/images/categories/gastropods.png'},
    {'label': 'Polyplacophora', 'image': 'lib/assets/images/categories/Polyplacophora.png'},
    {'label': 'Scaphopods', 'image': 'lib/assets/images/categories/Scaphopods.png'},
  ];
  List<Map<String, String>> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _filteredCategories = List<Map<String, String>>.from(_allCategories);
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = List<Map<String, String>>.from(_allCategories);
      } else {
        _filteredCategories = _allCategories.where((category) {
          return category['label']!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: width * 1,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search categories',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 231, 230, 227),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF8A8A8A)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: _filteredCategories.isEmpty
                  ? Center(
                      child: Text(
                        'No categories found.',
                        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : GridView.builder(
                      itemCount: _filteredCategories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final category = _filteredCategories[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE3D7CA)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                  child: Image.asset(
                                    category['image']!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  category['label']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
