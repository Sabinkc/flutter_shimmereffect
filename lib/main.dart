import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main(List<String> args) {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  Future loadData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shimmer effect"),
          centerTitle: true,
        ),
        body: isLoading ? ShimmerEffect() : DataWidget());
  }
}

// DataWidget
class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) => ListTile(
              title: Text("Text"),
              subtitle: Text("Description"),
              leading: Icon(Icons.menu),
            )));
  }
}

// Shimmereffect widget
class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) => ListTile(
                  title: Container(
                    height: 50,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                  leading: CircleAvatar(
                    child: Container(
                      color: Colors.white,
                      height: 50,
                    ),
                  ),
                ))),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100);
  }
}
