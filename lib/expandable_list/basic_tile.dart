class BasicTile {
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({
    required this.title,
    this.tiles = const []
  });
}

final basicTile = <BasicTile>[
  const BasicTile(
    title: 'Fruits',
    tiles: [
      BasicTile(title: 'Apple'),
      BasicTile(title: 'Banana'),
      BasicTile(title: 'Orange'),
      BasicTile(title: 'Watermelon')
    ]
  ),
  const BasicTile(
    title: 'Continent',
    tiles: [
      BasicTile(
        title: 'Asia',
        tiles: [
          BasicTile(title: 'Bangladesh'),
          BasicTile(title: 'India'),
          BasicTile(title: 'Pakistan'),
          BasicTile(title: 'Afghanistan'),
          BasicTile(title: 'Iran')
        ]
      ),
      BasicTile(
        title: 'Europe',
        tiles: [
          BasicTile(title: 'Germany'),
          BasicTile(title: 'Italia'),
          BasicTile(title: 'France'),
          BasicTile(title: 'Spain')
        ]
      ),
      BasicTile(
        title: 'Africa',
        tiles: [
          BasicTile(title: 'Misor'),
          BasicTile(title: 'Morocco'),
          BasicTile(title: 'South Africa'),
          BasicTile(title: 'Ghana')
        ]
      ),
      BasicTile(
        title: 'America',
        tiles: [
          BasicTile(title: 'Canada'),
          BasicTile(title: 'Mexico'),
          BasicTile(title: 'Granada'),
          BasicTile(title: 'Jamaika')
        ]
      )
    ]
  )
];