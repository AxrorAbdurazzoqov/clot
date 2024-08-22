import 'package:clot/src/core/model/cloth_model.dart';
import 'package:flutter/material.dart';

enum Sizes {
  S,
  M,
  L,
  XL,
  XXL
}

enum Gender {
  male,
  female
}

Map<String, List<ClothModel>> data = {
  'hoodies': [
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.red,
        Colors.blue
      ],
      gender: Gender.male,
      name: 'Cozy Hoodie',
      price: 149.99,
      discount: 40.0,
      image: 'https://plus.unsplash.com/premium_photo-1673827311290-d435f481152e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG9vZGllfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L,
        Sizes.XL
      ],
      colors: [
        Colors.green,
        Colors.black
      ],
      gender: Gender.female,
      name: 'Begie Hoodie',
      price: 129.99,
      discount: 0.0,
      image: 'https://plus.unsplash.com/premium_photo-1681493944219-44118cf7754d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aG9vZGllfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.purple,
        Colors.grey
      ],
      gender: Gender.female,
      name: 'Warm Hoodie',
      price: 139.99,
      discount: 25.0,
      image: 'https://plus.unsplash.com/premium_photo-1681490245250-0cb267de7fba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGhvb2RpZXxlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L,
        Sizes.XL
      ],
      colors: [
        Colors.black,
        Colors.white
      ],
      gender: Gender.male,
      name: 'Classic Hoodie',
      price: 119.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1669266586576-639523db9306?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fGhvb2RpZXxlbnwwfHwwfHx8MA%3D%3D',
    ),
  ],
  'shorts': [
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.green,
        Colors.yellow
      ],
      gender: Gender.male,
      name: 'Casual Shorts',
      price: 39.99,
      discount: 20.0,
      image: 'https://images.unsplash.com/photo-1530692592170-b816c09624d3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fHNob3J0c3xlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L,
        Sizes.XL
      ],
      colors: [
        Colors.blue,
        Colors.white
      ],
      gender: Gender.female,
      name: 'Summer Shorts',
      price: 29.99,
      discount: 0.0,
      image: 'https://plus.unsplash.com/premium_photo-1690820317396-8e774f98482e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fGZlbWFsZSUyMGxvbmclMjBzaG9ydHN8ZW58MHx8MHx8fDA%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.red,
        Colors.black
      ],
      gender: Gender.female,
      name: 'Sport Shorts',
      price: 49.99,
      discount: 15.0,
      image: 'https://plus.unsplash.com/premium_photo-1690034979580-ec13112ec344?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fGZlbWFsZSUyMGxvbmclMjBzaG9ydHN8ZW58MHx8MHx8fDA%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.grey,
        Colors.green
      ],
      gender: Gender.male,
      name: 'Cargo Shorts',
      price: 59.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1639989889705-e20b18301d2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fHNob3J0c3xlbnwwfHwwfHx8MA%3D%3D',
    ),
  ],
  'shoes': [
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.white,
        Colors.black
      ],
      gender: Gender.male,
      name: 'Running Shoes',
      price: 99.99,
      discount: 10.0,
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.red,
        Colors.blue
      ],
      gender: Gender.male,
      name: 'Sneakers',
      price: 89.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1539185441755-769473a23570?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNob2VzfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L,
        Sizes.XL
      ],
      colors: [
        Colors.grey,
        Colors.white
      ],
      gender: Gender.male,
      name: 'Sport Shoes',
      price: 79.99,
      discount: 20.0,
      image: 'https://images.unsplash.com/photo-1520256862855-398228c41684?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fHNob2VzfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.black,
        Colors.red
      ],
      gender: Gender.female,
      name: 'High-top Shoes',
      price: 119.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1535043934128-cf0b28d52f95?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjJ8fHNob2VzfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.black,
        Colors.red
      ],
      gender: Gender.female,
      name: 'Greace Sneaker',
      price: 159.99,
      discount: 33.5,
      image: 'https://images.unsplash.com/photo-1569581510805-5438bb401722?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjR8fHNob2VzfGVufDB8fDB8fHww',
    ),
  ],
  'bag': [
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.brown,
        Colors.black
      ],
      gender: Gender.male,
      name: 'Leather Bag',
      price: 149.99,
      discount: 30.0,
      image: 'https://images.unsplash.com/photo-1473188588951-666fce8e7c68?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGVhdGhlciUyMGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.grey,
        Colors.blue
      ],
      gender: Gender.female,
      name: 'Tote Bag',
      price: 79.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1661347365621-1a48b4dcf8d3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8VG90ZSUyMGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.black,
        Colors.white
      ],
      gender: Gender.female,
      name: 'Handbag',
      price: 129.99,
      discount: 15.0,
      image: 'https://images.unsplash.com/photo-1589731119540-c4586781dae1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.green,
        Colors.brown
      ],
      gender: Gender.male,
      name: 'Backpack',
      price: 99.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1528384483229-b4a97480dbea?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTF8fGJhY2twYWNrfGVufDB8fDB8fHww',
    ),
  ],
  'accessories': [
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.yellowAccent,
        Colors.teal
      ],
      gender: Gender.male,
      name: 'Wrist Watch',
      price: 199.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1606666877726-4fc01ca8d331?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHdyaXN0JTIwd2F0Y2h8ZW58MHx8MHx8fDA%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.black,
        Colors.brown
      ],
      gender: Gender.female,
      name: 'Sunglasses',
      price: 79.99,
      discount: 20.0,
      image: 'https://images.unsplash.com/photo-1517390947773-a742ed6ce0d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d3Jpc3QlMjB3YXRjaHxlbnwwfHwwfHx8MA%3D%3D',
    ),
    ClothModel(
      sizes: [
        Sizes.S,
        Sizes.M
      ],
      colors: [
        Colors.red,
        Colors.black
      ],
      gender: Gender.female,
      name: 'Earrings',
      price: 49.99,
      discount: 0.0,
      image: 'https://images.unsplash.com/photo-1693212793204-bcea856c75fe?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fEVhcnJpbmdzfGVufDB8fDB8fHww',
    ),
    ClothModel(
      sizes: [
        Sizes.M,
        Sizes.L
      ],
      colors: [
        Colors.blue,
        Colors.grey
      ],
      gender: Gender.male,
      name: 'Cap',
      price: 29.99,
      discount: 10.0,
      image: 'https://images.unsplash.com/photo-1525740615880-50bb88fe0b1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fGNhcHxlbnwwfHwwfHx8MA%3D%3D',
    ),
  ],
};
