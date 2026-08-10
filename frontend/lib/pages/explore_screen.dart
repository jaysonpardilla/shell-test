import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _filters = [
    'All',
    'Bivalves',
    'Cephalopods',
    'Gastropods',
    'Polyplacophora',
    'Scaphopods',
  ];
  String _selectedFilter = 'All';

  final List<Map<String, String>> _shells = [
    {'name': 'abalones', 'image': 'lib/assets/images/shells/abalones.png', 'category': 'Gastropods'},
    {'name': 'argonaut', 'image': 'lib/assets/images/shells/argonaut.png', 'category': 'Cephalopods'},
    {'name': 'bubble shells', 'image': 'lib/assets/images/shells/bubble shells.png', 'category': 'Gastropods'},
    {'name': 'chambered nautilus', 'image': 'lib/assets/images/shells/chambered nautilus.png', 'category': 'Cephalopods'},
    {'name': 'cowries', 'image': 'lib/assets/images/shells/cowries.png', 'category': 'Gastropods'},
    {'name': 'hard clams', 'image': 'lib/assets/images/shells/hard clams.png', 'category': 'Bivalves'},
    {'name': 'helmet shells', 'image': 'lib/assets/images/shells/helmet shells.png', 'category': 'Gastropods'},
    {'name': 'margin shells', 'image': 'lib/assets/images/shells/margin shells.png', 'category': 'Gastropods'},
    {'name': 'moon snails', 'image': 'lib/assets/images/shells/moon snails.png', 'category': 'Gastropods'},
    {'name': 'murex', 'image': 'lib/assets/images/shells/murex.png', 'category': 'Gastropods'},
    {'name': 'mussel', 'image': 'lib/assets/images/shells/mussel.png', 'category': 'Bivalves'},
    {'name': 'nautilus pompilius', 'image': 'lib/assets/images/shells/nautilus pompilius.png', 'category': 'Cephalopods'},
    {'name': 'olive shells', 'image': 'lib/assets/images/shells/olive shells.png', 'category': 'Gastropods'},
    {'name': 'oyster', 'image': 'lib/assets/images/shells/oyster.png', 'category': 'Bivalves'},
    {'name': 'pearl oyster', 'image': 'lib/assets/images/shells/pearl oyster.png', 'category': 'Bivalves'},
    {'name': 'razor clams', 'image': 'lib/assets/images/shells/razor clams.png', 'category': 'Bivalves'},
    {'name': 'spider conch', 'image': 'lib/assets/images/shells/spider conch.png', 'category': 'Gastropods'},
    {'name': 'surf clams', 'image': 'lib/assets/images/shells/surf clams.png', 'category': 'Bivalves'},
    {'name': 'textile cone', 'image': 'lib/assets/images/shells/textile cone.png', 'category': 'Gastropods'},
    {'name': 'tiger cowrie', 'image': 'lib/assets/images/shells/tiger cowrie.png', 'category': 'Gastropods'},
    {'name': 'tulip shells', 'image': 'lib/assets/images/shells/tulip shells.png', 'category': 'Gastropods'},
    {'name': 'turban snails', 'image': 'lib/assets/images/shells/turban snails.png', 'category': 'Gastropods'},
    {'name': 'tusk shell', 'image': 'lib/assets/images/shells/tusk shell.png', 'category': 'Scaphopods'},
    {'name': 'venus clams', 'image': 'lib/assets/images/shells/venus clams.png', 'category': 'Bivalves'},
    {'name': 'whelks', 'image': 'lib/assets/images/shells/whelks.png', 'category': 'Gastropods'},
  ];

  List<Map<String, String>> _filteredShells = [];

  @override
  void initState() {
    super.initState();
    _filteredShells = List<Map<String, String>>.from(_shells);
    _searchController.addListener(_updateShellFilter);
  }

  @override
  void dispose() {
    _searchController.removeListener(_updateShellFilter);
    _searchController.dispose();
    super.dispose();
  }

  void _updateShellFilter() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredShells = _shells.where((shell) {
        final matchesSearch = shell['name']!.toLowerCase().contains(query);
        final matchesFilter = _selectedFilter == 'All' || shell['category'] == _selectedFilter;
        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  void _selectFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      _updateShellFilter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Seashells',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.poppins(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Search seashells',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[500]),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF8A8A8A)),
                    filled: true,
                    fillColor: const Color(0xFFF5EFE6),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  final selected = filter == _selectedFilter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () => _selectFilter(filter),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          color: selected ? const Color(0xFF8C5E3C) : const Color(0xFFEEE4DA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: selected ? Colors.white : const Color(0xFF6D5535),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredShells.isEmpty
                  ? Center(
                      child: Text(
                        'No shells match your search.',
                        style: GoogleFonts.poppins(fontSize: 13, color: Colors.black54),
                      ),
                    )
                  : GridView.builder(
                      itemCount: _filteredShells.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final shell = _filteredShells[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE7D9CC)),
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
                                    shell['image']!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  shell['name']!,
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
