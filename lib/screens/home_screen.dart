import 'package:flutter/material.dart';

import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _searchController =
  TextEditingController();

  bool isLoading = false;

  String selectedCategory = 'All';
  String searchText = '';

  final List<String> categories = [
    'All',
    'Vegetables',
    'Fruits',
    'Dairy',
    'Bakery',
    'Beverages',
    'Snacks',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Fresh Avocado',
      'category': 'Fruits',
      'price': 120,
      'unit': '2 pieces',
      'rating': 4.8,
      'image':
      'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=600',
      'offer': '20% OFF',
    },
    {
      'name': 'Red Apples',
      'category': 'Fruits',
      'price': 169,
      'unit': '1 kg',
      'rating': 4.7,
      'image':
      'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=600',
      'offer': 'Fresh',
    },
    {
      'name': 'Fresh Tomatoes',
      'category': 'Vegetables',
      'price': 45,
      'unit': '500 g',
      'rating': 4.6,
      'image':
      'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=600',
      'offer': 'Local',
    },
    {
      'name': 'Broccoli',
      'category': 'Vegetables',
      'price': 85,
      'unit': '500 g',
      'rating': 4.8,
      'image':
      'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=600',
      'offer': 'Fresh',
    },
    {
      'name': 'Farm Milk',
      'category': 'Dairy',
      'price': 64,
      'unit': '1 litre',
      'rating': 4.9,
      'image':
      'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=600',
      'offer': 'Popular',
    },
    {
      'name': 'Whole Wheat Bread',
      'category': 'Bakery',
      'price': 55,
      'unit': '400 g',
      'rating': 4.5,
      'image':
      'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=600',
      'offer': '20% OFF',
    },
    {
      'name': 'Orange Juice',
      'category': 'Beverages',
      'price': 135,
      'unit': '1 litre',
      'rating': 4.4,
      'image':
      'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=600',
      'offer': 'New',
    },
    {
      'name': 'Granola Cookies',
      'category': 'Snacks',
      'price': 110,
      'unit': '250 g',
      'rating': 4.3,
      'image':
      'https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=600',
      'offer': 'Popular',
    },
    {
      'name': 'Jaya Rice',
      'category': 'Pantry and Dry Goods',
      'price': 53,
      'unit': '1 kg',
      'rating': 4.5,
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLtViD0qP4MqJ_YpS08_r8EImiPieUBTxDVkMqsFqMDk2-waLQPMJdrVI&s=10',
      'offer': 'Popular',
    },
    {
      'name': 'Black Pepper',
      'category': 'Pantry and Dry Goods',
      'price': 100,
      'unit': '250 g',
      'rating': 4.5,
      'image':
      'https://d3kgrlupo77sg7.cloudfront.net/media/chococoorgspice.com/images/products/medium/black-pepper-powder-coorg-spices.20260315024227.webp',
      'offer': 'Popular',
    },
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 400) {
        loadMoreProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadMoreProducts() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    // Simulates loading another page from an API.
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    final currentLength = products.length;

    final newProducts = List.generate(
      6,
          (index) {
        final original =
        products[index % products.length];

        return {
          'name':
          '${original['name']} ${currentLength + index}',
          'category': original['category'],
          'price': original['price'],
          'unit': original['unit'],
          'rating': original['rating'],
          'image': original['image'],
          'offer': original['offer'],
        };
      },
    );

    if (mounted) {
      setState(() {
        products.addAll(newProducts);
        isLoading = false;
      });
    }
  }

  List<Map<String, dynamic>> get filteredProducts {
    return products.where((product) {
      final categoryMatch =
          selectedCategory == 'All' ||
              product['category'] == selectedCategory;

      final searchMatch =
      product['name']
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase());

      return categoryMatch && searchMatch;
    }).toList();
  }

  void showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter Products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected:
                    selectedCategory == category,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });

                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayedProducts = filteredProducts;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8F4),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [

            // HEADER

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  0,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xffE5F3E9),
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          '🥬',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Fresh Drop, for you',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding:
                      const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // SEARCH

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  0,
                ),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(17),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),

                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TextField(
                          controller:
                          _searchController,
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                          decoration:
                          const InputDecoration(
                            hintText:
                            'Search fruits, milk, snacks...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap:
                        showFilterBottomSheet,
                        child: Container(
                          margin:
                          const EdgeInsets.only(
                            right: 8,
                          ),
                          padding:
                          const EdgeInsets.all(
                            9,
                          ),
                          decoration: BoxDecoration(
                            color:
                            const Color(0xffE9F6EE),
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color:
                            Color(0xff1D5B45),
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // OFFER BANNER

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  0,
                ),
                child: Container(
                  height: 160,
                  padding:
                  const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color:
                    const Color(0xff1D5B45),
                    borderRadius:
                    BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      const Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WEEKEND FRESH',
                            style: TextStyle(
                              color:
                              Color(0xffBDE8CC),
                              fontSize: 11,
                              fontWeight:
                              FontWeight.bold,
                              letterSpacing: 1.3,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Up to 30% off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Fresh picks for your weekend table.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Shop now →',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Positioned(
                        right: 15,
                        bottom: 5,
                        child: Text(
                          '🥑',
                          style: TextStyle(
                            fontSize: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // CATEGORY TITLE

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  22,
                  20,
                  12,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Explore categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF43A047),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //CATEGORIES

            SliverToBoxAdapter(
              child: SizedBox(
                height: 105,
                child: ListView.separated(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  scrollDirection:
                  Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder:
                      (_, __) =>
                  const SizedBox(width: 10),
                  itemBuilder:
                      (context, index) {
                    final category =
                    categories[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory =
                              category;
                        });
                      },
                      child: AnimatedContainer(
                        duration:
                        const Duration(
                          milliseconds: 200,
                        ),
                        width: 82,
                        padding:
                        const EdgeInsets.all(
                          10,
                        ),
                        decoration:
                        BoxDecoration(
                          color:
                          selectedCategory ==
                              category
                              ? const Color(
                            0xff1D5B45,
                          )
                              : Colors.white,
                          borderRadius:
                          BorderRadius.circular(
                            18,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Text(
                              getCategoryIcon(
                                  category),
                              style:
                              const TextStyle(
                                fontSize: 27,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              category,
                              maxLines: 1,
                              overflow:
                              TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight:
                                FontWeight.bold,
                                color:
                                selectedCategory ==
                                    category
                                    ? Colors
                                    .white
                                    : Colors
                                    .black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

         // PRODUCT TITLE

            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(
                  20,
                  22,
                  20,
                  12,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Today's fresh picks",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${displayedProducts.length} items',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //  PRODUCT GRID

            SliverPadding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverGrid(
                delegate:
                SliverChildBuilderDelegate(
                      (context, index) {
                    final product =
                    displayedProducts[index];

                    return ProductCard(
                      product: product,
                    );
                  },
                  childCount:
                  displayedProducts.length,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: .69,
                ),
              ),
            ),

            // INFINITE LOADING

            SliverToBoxAdapter(
              child: AnimatedSwitcher(
                duration:
                const Duration(
                  milliseconds: 200,
                ),
                child: isLoading
                    ? const Padding(
                  padding:
                  EdgeInsets.all(25),
                  child: Center(
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      color:
                      Color(0xff1D5B45),
                    ),
                  ),
                )
                    : const SizedBox(
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCategoryIcon(String category) {
    switch (category) {
      case 'Vegetables':
        return '🥬';
      case 'Fruits':
        return '🍎';
      case 'Dairy':
        return '🥛';
      case 'Bakery':
        return '🥖';
      case 'Beverages':
        return '🥤';
      case 'Snacks':
        return '🍪';
      default:
        return '🛒';
    }
  }
}

// PRODUCT CARD

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() =>
      _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color:
            Colors.black.withOpacity(.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          // IMAGE
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(
                    top: Radius.circular(23),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      product['image'],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) {
                        return Container(
                          color:
                          const Color(
                            0xffE9F6EE,
                          ),
                          child:
                          const Center(
                            child: Text(
                              '🥬',
                              style:
                              TextStyle(
                                fontSize: 45,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // OFFER
                Positioned(
                  left: 9,
                  top: 9,
                  child: Container(
                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration:
                    BoxDecoration(
                      color: Colors.white
                          .withOpacity(.92),
                      borderRadius:
                      BorderRadius.circular(
                        9,
                      ),
                    ),
                    child: Text(
                      product['offer'],
                      style:
                      const TextStyle(
                        color:
                        Color(0xff1D5B45),
                        fontSize: 8,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // FAVORITE
                Positioned(
                  right: 9,
                  top: 9,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite =
                        !isFavorite;
                      });
                    },
                    child: Container(
                      padding:
                      const EdgeInsets
                          .all(8),
                      decoration:
                      BoxDecoration(
                        color: Colors.white
                            .withOpacity(.92),
                        shape:
                        BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons
                            .favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : Colors.black87,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // PRODUCT DETAILS
          Expanded(
            flex: 4,
            child: Padding(
              padding:
              const EdgeInsets.fromLTRB(
                12,
                10,
                10,
                10,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    product['name'],
                    maxLines: 1,
                    overflow:
                    TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product['unit'],
                    style:
                    const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color:
                        Color(0xffffa43b),
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${product['rating']}',
                        style:
                        const TextStyle(
                          fontSize: 10,
                          color:
                          Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      Text(
                        '₹${product['price']}',
                        style:
                        const TextStyle(
                          color:
                          Color(0xff1D5B45),
                          fontSize: 16,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            added = true;
                          });

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${product['name']} added to basket',
                              ),
                              behavior:
                              SnackBarBehavior
                                  .floating,
                              duration:
                              const Duration(
                                milliseconds:
                                900,
                              ),
                            ),
                          );
                        },
                        child:
                        AnimatedContainer(
                          duration:
                          const Duration(
                            milliseconds: 200,
                          ),
                          padding:
                          const EdgeInsets
                              .all(7),
                          decoration:
                          BoxDecoration(
                            color: added
                                ? Colors.green
                                : const Color(
                              0xff1D5B45,
                            ),
                            borderRadius:
                            BorderRadius
                                .circular(
                              10,
                            ),
                          ),
                          child: Icon(
                            added
                                ? Icons.check
                                : Icons.add,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}