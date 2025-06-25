class Tower {
  int id;
  String name;
  String code;
  String imageUrl;
  String description;
  String district;
  String address;
  String coordinates;
  String mapLink;
  String lastInspector;
  String lastInspectionDate;
  String lastInspectionTime;
  String nextInspector;
  String nextInspectionDate;
  String nextInspectionTime;
  String repairAndReplacement;

  Tower({
    required this.id,
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.description,
    required this.district,
    required this.address,
    required this.coordinates,
    required this.mapLink,
    required this.lastInspector,
    required this.lastInspectionDate,
    required this.lastInspectionTime,
    required this.nextInspector,
    required this.nextInspectionDate,
    required this.nextInspectionTime,
    required this.repairAndReplacement,
  });
}

List<Tower> mockTowers = [
  Tower(
    id: 1,
    name: 'Colombo',
    code: 'TWR-001',
    imageUrl: 'assets/images/colombo_tower.png',
    description: 'Colombo communication tower hub.',
    district: 'Colombo',
    address: 'Gangadara Mawatta, Mount Lavinia',
    mapLink: 'https://goo.gl/maps/ColomboTower',
    coordinates: 'N 6.9, E 79.8',
    lastInspector: 'Ramesh–322',
    lastInspectionDate: '10/05/2025',
    lastInspectionTime: '0900h',
    nextInspector: 'Ramesh–322',
    nextInspectionDate: '10/05/2025',
    nextInspectionTime: '0900h',
    repairAndReplacement: 'antenna replacement scheduled for 15/05/2025',
  ),
  Tower(
    id: 2,
    name: 'Kandy',
    code: 'TWR-003',
    imageUrl: 'assets/images/kandy_tower.png',
    description: 'Primary relay tower in the Central Highlands.',
    district: 'Kandy',
    address: 'Riverdale Road, Kandy',
    coordinates: 'N 7.3, E 80.6',
    mapLink: 'https://goo.gl/maps/KandyTower',
    lastInspector: 'Kamal–204',
    lastInspectionDate: '18/04/2025',
    lastInspectionTime: '1030h',
    nextInspector: 'Ramesh–322',
    nextInspectionDate: '10/05/2025',
    nextInspectionTime: '0900h',
    repairAndReplacement: 'antenna replacement scheduled for 15/05/2025',
  ),
  Tower(
    id: 3,
    name: 'Galle',
    code: 'TWR-005',
    imageUrl: 'assets/images/galle_tower.png',
    description: 'Southern broadcast tower for coastal signals.',
    district: 'Galle',
    address: 'Light House Street, Galle Fort',
    coordinates: 'N 6.0, E 80.2',
    mapLink: 'https://goo.gl/maps/GalleTower',
    lastInspector: 'Nuwan–518',
    lastInspectionDate: '25/03/2025',
    lastInspectionTime: '0830h',
    nextInspector: 'Ramesh–322',
    nextInspectionDate: '10/05/2025',
    nextInspectionTime: '0900h',
    repairAndReplacement: 'antenna replacement scheduled for 15/05/2025',
  ),
  Tower(
    id: 4,
    name: 'Jaffna',
    code: 'TWR-004',
    imageUrl: 'assets/images/jaffna_tower.png',
    description: 'Northern provincial signal relay station.',
    district: 'Jaffna',
    address: 'Stanley Road, Jaffna Town',
    coordinates: 'N 9.7, E 80.0',
    mapLink: 'https://goo.gl/maps/JaffnaTower',
    lastInspector: 'Siva–219',
    lastInspectionDate: '15/02/2025',
    lastInspectionTime: '1100h',
    nextInspector: 'Ramesh–322',
    nextInspectionDate: '10/05/2025',
    nextInspectionTime: '0900h',
    repairAndReplacement: 'antenna replacement scheduled for 15/05/2025',
  ),
];
