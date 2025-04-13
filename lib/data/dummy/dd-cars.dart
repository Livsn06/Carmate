import '../../models/md-car-infornation.dart';

final List<CarInformation> carList = [
  CarInformation(
    id: 1,
    name: 'Toyota Fortuner',
    brand: 'Toyota',
    model: 'Fortuner 2023',
    transmission: 'Automatic',
    seating_capacity: '7',
    status: 'Available',
    rental_price: '₱ 5,000/day',
    description: 'A reliable SUV perfect for family and long drives.',
    imageUrl:
        'http://d1hv7ee95zft1i.cloudfront.net/custom/blog-post-photo/gallery/toyota-fortuner-630f315461ab8.jpg',
    createdAt: DateTime.now().toIso8601String(),
  ),
  CarInformation(
    id: 2,
    name: 'Gallardo GT3',
    brand: 'Lamborghini',
    model: 'Gallardo GT3 FL2',
    transmission: 'Manual',
    seating_capacity: '2',
    status: 'Available',
    rental_price: '₱ 30,000/day',
    description: 'A powerful race-ready exotic car for thrilling rides.',
    imageUrl:
        'https://static.lambocars.com/wp-content/uploads/2020/12/2013_gallardo_gt3_fl2_2.jpg',
    createdAt: DateTime.now().toIso8601String(),
  ),
  CarInformation(
    id: 3,
    name: 'Mustang Ford',
    brand: 'Ford',
    model: 'Mustang GT',
    transmission: 'Automatic',
    seating_capacity: '4',
    status: 'Available',
    rental_price: '₱ 20,000/day',
    description: 'A muscle car with aggressive styling and performance.',
    imageUrl:
        'https://www.waynephillisford.com.au/media-files/inventory/38693311-0733-4d4b-90a8-8e21d78f375e/e87cbb7a-47b8-46d9-9b1c-c7ab497ec142/large-image.jpg',
    createdAt: DateTime.now().toIso8601String(),
  ),
  CarInformation(
    id: 4,
    name: 'Chevrolet Camaro',
    brand: 'Chevrolet',
    model: 'Camaro SS',
    transmission: 'Manual',
    seating_capacity: '4',
    status: 'Available',
    rental_price: '₱ 20,000/day',
    description: 'A stylish American muscle car with top performance.',
    imageUrl:
        'https://www.financialexpress.com/wp-content/uploads/2024/06/Chevrolet_Camaro_SS.jpg?w=620',
    createdAt: DateTime.now().toIso8601String(),
  ),
];
