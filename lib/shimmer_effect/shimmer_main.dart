import 'package:flutter/material.dart';
import 'package:some_advanced/shimmer_effect/data/foods.dart';
import 'package:some_advanced/shimmer_effect/model/food.dart';
import 'package:some_advanced/shimmer_effect/shimmer_Widget.dart';

class ShimmerMain extends StatelessWidget {
  const ShimmerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShimmerEffectPage(),
    );
  }
}

class ShimmerEffectPage extends StatefulWidget {
  const ShimmerEffectPage({super.key});

  @override
  State<ShimmerEffectPage> createState() => _ShimmerEffectPageState();
}

class _ShimmerEffectPageState extends State<ShimmerEffectPage> {
  List<Food> foods = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2), () {});
    foods = List.of(allFoods);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Shimmer Effect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadData
          )
        ],
      ),
      body: ListView.builder(
        itemCount: isLoading ? 5 : foods.length,
        itemBuilder: (context, index) {
          if(isLoading) {
            return buildFoodShimmer();
          } else {
            final food = foods[index];

            return buildFood(food);
          }
        }
      ),
    );
  }

  Widget buildFood(Food food) => ListTile(
    leading: CircleAvatar(
      radius: 12,
      backgroundImage: NetworkImage(food.urlImage),
    ),
    title: Text(
      food.title,
      style: const TextStyle(
        fontSize: 16
      ),
    ),
    subtitle: Text(
      food.description,
      style: const TextStyle(
        fontSize: 14
      ),
      maxLines: 1,
    ),
  );

  Widget buildFoodShimmer() => ListTile(
    leading: ShimmerWidget.circular(
      width: 64,
      height: 64,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
    ),
    title: Align(
      alignment: Alignment.centerLeft,
      child: ShimmerWidget.rectangular(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 18
      ),
    ),
    subtitle: const ShimmerWidget.rectangular(height: 14),
  );
}