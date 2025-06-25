// --- DATA MODEL ---
// A simple class to represent a Tower's data.
class Tower {
  final int id;
  final String name;
  final String code;
  final String imageUrl;
  final String description;

  const Tower({
    required this.id,
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.description,
  });
}

// --- MOCK DATA ---
// A list of sample towers to populate the UI. In a real app, this would
// come from a database or an API.
const List<Tower> mockTowers = [
  Tower(
    id: 1,
    name: 'Eiffel Tower',
    code: 'TWR-001',
    imageUrl: 'https://placehold.co/600x400/A9C2D4/FFFFFF?text=Eiffel+Tower',
    description:
        'A wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.',
  ),
  Tower(
    id: 2,
    name: 'Burj Khalifa',
    code: 'TWR-002',
    imageUrl: 'https://placehold.co/600x400/D4A9A9/FFFFFF?text=Burj+Khalifa',
    description:
        'The tallest building in the world, located in Dubai, United Arab Emirates. Its design is inspired by the spider lily, a regional desert flower.',
  ),
  Tower(
    id: 3,
    name: 'CN Tower',
    code: 'TWR-003',
    imageUrl: 'https://placehold.co/600x400/A9D4B7/FFFFFF?text=CN+Tower',
    description:
        'A 553.3 m-high concrete communications and observation tower in downtown Toronto, Ontario, Canada. It was completed in 1976.',
  ),
  Tower(
    id: 4,
    name: 'Tokyo Skytree',
    code: 'TWR-004',
    imageUrl: 'https://placehold.co/600x400/D4C9A9/FFFFFF?text=Tokyo+Skytree',
    description:
        'A broadcasting and observation tower in Sumida, Tokyo. It became the tallest structure in Japan in 2010 and reached its full height of 634.0 metres in March 2011.',
  ),
];
