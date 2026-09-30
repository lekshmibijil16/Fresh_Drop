

import '../models/category_model.dart';
import '../models/product_model.dart';

const groceryCategories = [
  GroceryCategory(
    name: 'Fruits',
    icon: '🍎',
    image:
    'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=600',
  ),
  GroceryCategory(
    name: 'Vegetables',
    icon: '🥦',
    image:
    'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=600',
  ),
  GroceryCategory(
    name: 'Dairy',
    icon: '🥛',
    image:
    'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=600',
  ),
  GroceryCategory(
    name: 'Bakery',
    icon: '🥐',
    image:
    'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=600',
  ),
  GroceryCategory(
    name: 'Snacks',
    icon: '🍿',
    image:
    'https://images.unsplash.com/photo-1621939514649-280e2aa1f6c7?w=600',
  ),
  GroceryCategory(
    name: 'Beverages',
    icon: '🧃',
    image:
    'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=600',
  ),
];

final mockProducts = [
  Product(
    id: '1',
    name: 'Fresh Avocado',
    category: 'Fruits',
    image:
    'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=800',
    price: 120,
    oldPrice: 145,
    unit: '2 pcs',
    description:
    'Creamy, fresh and naturally nutritious avocados selected for everyday meals.',
    rating: 4.8,
  ),
  Product(
    id: '2',
    name: 'Red Apples',
    category: 'Fruits',
    image:
    'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=800',
    price: 180,
    oldPrice: 210,
    unit: '1 kg',
    description:
    'Crisp and juicy red apples, perfect for snacks, salads and desserts.',
    rating: 4.7,
  ),
  Product(
    id: '3',
    name: 'Organic Bananas',
    category: 'Fruits',
    image:
    'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=800',
    price: 65,
    oldPrice: 80,
    unit: '1 dozen',
    description:
    'Naturally sweet bananas with a smooth texture and delicious flavour.',
    rating: 4.6,
  ),
  Product(
    id: '4',
    name: 'Broccoli',
    category: 'Vegetables',
    image:
    'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?w=800',
    price: 75,
    oldPrice: 95,
    unit: '500 g',
    description:
    'Fresh green broccoli packed with crunch and flavour.',
    rating: 4.5,
  ),
  Product(
    id: '5',
    name: 'Farm Tomatoes',
    category: 'Vegetables',
    image:
    'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=800',
    price: 55,
    oldPrice: 70,
    unit: '1 kg',
    description:
    'Ripe farm tomatoes for curries, salads and sandwiches.',
    rating: 4.7,
  ),
  Product(
    id: '6',
    name: 'Fresh Milk',
    category: 'Dairy',
    image:
    'https://images.unsplash.com/photo-1550583724-b2692b85b150?w=800',
    price: 62,
    oldPrice: 68,
    unit: '1 litre',
    description:
    'Smooth and creamy everyday milk.',
    rating: 4.8,
  ),
  Product(
    id: '7',
    name: 'Greek Yogurt',
    category: 'Dairy',
    image:
    'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800',
    price: 110,
    oldPrice: 130,
    unit: '400 g',
    description:
    'Thick, creamy yogurt with a refreshing taste.',
    rating: 4.6,
  ),
  Product(
    id: '8',
    name: 'Butter Croissant',
    category: 'Bakery',
    image:
    'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800',
    price: 95,
    oldPrice: 120,
    unit: '4 pcs',
    description:
    'Golden flaky croissants with a rich buttery centre.',
    rating: 4.9,
  ),
  Product(
    id: '9',
    name: 'Whole Wheat Bread',
    category: 'Bakery',
    image:
    'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800',
    price: 58,
    oldPrice: 70,
    unit: '400 g',
    description:
    'Soft whole wheat bread for healthy everyday breakfasts.',
    rating: 4.5,
  ),
  Product(
    id: '10',
    name: 'Granola Mix',
    category: 'Snacks',
    image:
    'https://images.unsplash.com/photo-1517093157656-b9eccef91cb1?w=800',
    price: 220,
    oldPrice: 260,
    unit: '500 g',
    description:
    'Crunchy oats, nuts and dried fruit for a quick snack.',
    rating: 4.6,
  ),
  Product(
    id: '11',
    name: 'Potato Chips',
    category: 'Snacks',
    image:
    'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=800',
    price: 45,
    oldPrice: 55,
    unit: '150 g',
    description:
    'Crispy potato chips for movie nights and quick bites.',
    rating: 4.4,
  ),
  Product(
    id: '12',
    name: 'Orange Juice',
    category: 'Beverages',
    image:
    'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800',
    price: 135,
    oldPrice: 160,
    unit: '1 litre',
    description:
    'Refreshing orange juice with a bright citrus flavour.',
    rating: 4.7,
  ),
];