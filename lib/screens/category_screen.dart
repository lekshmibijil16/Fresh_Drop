import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Fruits & Vegetables',
      'subtitle': 'Fresh & healthy',
      'image':
      'https://images.unsplash.com/photo-1610832958506-aa56368176cf?w=800',
      'color': Color(0xFFE8F5E9),

    },
    {
      'name': 'Meat & Fish',
      'subtitle': 'Fresh protein',
      'image':
      'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=800',
      'color': Color(0xFFFFEBEE),
    },
    {
      'name': 'Pantry & Dry Goods',
      'subtitle': 'Everyday essentials',
      'image':
      'https://m.media-amazon.com/images/I/81GUN2jQdhL._AC_UF1000,1000_QL80_.jpg',
      'color': Color(0xFFFFF3E0),
    },
    {
      'name': 'Snacks',
      'subtitle': 'Tasty bites',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVpI5eGfdD_9gOFT8kDSVeU_u6hS1X1gMiElAn2_1wxPBGcWJiwqxorbM&s=10',
      'color': Color(0xFFFFF8E1),
    },
    {
      'name': 'Spices',
      'subtitle': 'Add some flavor',
      'image':
      'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=800',
      'color': Color(0xFFFCE4EC),
    },
    {
      'name': 'Frozen Food',
      'subtitle': 'Easy & convenient',
      'image':
      'https://res.cloudinary.com/purnesh/image/upload/w_540,f_auto,q_auto:eco,c_limit/modern-bazaar002.jpg',
      'color': Color(0xFFE3F2FD),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Color(0xFF1B5E20),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF1B5E20),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Heading
            const Text(
              'Shop by Category',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Find everything you need in one place',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 22),

            // Category grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return _categoryCard(
                  context,
                  category,
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(
      BuildContext context,
      Map<String, dynamic> category,
      ) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(
              categoryName: category['name'],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: category['color'],
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Category image
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    category['image'],
                    fit: BoxFit.cover,

                    // Loading indicator
                    loadingBuilder:
                        (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF43A047),
                        ),
                      );
                    },

                    // If image doesn't load
                    errorBuilder:
                        (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.shopping_basket_rounded,
                          size: 55,
                          color: Color(0xFF43A047),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Category name
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 10,
                top: 4,
              ),
              child: Text(
                category['name'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                ),
              ),
            ),

            const SizedBox(height: 3),

            // Subtitle
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 10,
              ),
              child: Text(
                category['subtitle'],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Explore button
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 12,
              ),
              child: Row(
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E7D32),
                    ),
                  ),

                  const Spacer(),

                  Container(
                    height: 28,
                    width: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFF43A047),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: Colors.white,
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
}


// ------------------------------------------------------
// CATEGORY PRODUCTS SCREEN
// ------------------------------------------------------

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Color(0xFF1B5E20),
        ),

        title: Text(
          categoryName,
          style: const TextStyle(
            color: Color(0xFF1B5E20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Category header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_basket_rounded,
                      color: Color(0xFF43A047),
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      'Fresh products from $categoryName',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Temporary product message
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 70,
                      color: Color(0xFF81C784),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Products will appear here',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'You can connect this page with your ProductProvider.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}