import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black), // Ikon tambah
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Tambah ditekan")));
            },
          ),
        ],
      ),
      drawer: const Drawer(), // Untuk icon menu di kiri atas
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Yogyakarta",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Today",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              "28°C",
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 300, // Atur panjang divider di sini
              child: Divider(thickness: 2),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sunny",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.ac_unit, color: Colors.blue),
                SizedBox(width: 5),
                Text(
                  "5 km/h",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 20),
            WeatherForecast(), // Widget prakiraan cuaca
            const Spacer(),
            const Text(
              "Developed by: AryaAnugrah.id",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> times = ["Now", "17.00", "20.00", "23.00"];
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Next 7 days",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                times
                    .map(
                      (time) =>
                          Text(time, style: const TextStyle(fontSize: 16)),
                    )
                    .toList(),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              times.length,
              (index) => Column(
                children: const [
                  Icon(Icons.ac_unit, color: Colors.blue),
                  Text(
                    "28°C",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  SizedBox(height: 5),
                  Icon(Icons.air, color: Colors.red),
                  Text(
                    "10 km/h",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  SizedBox(height: 5),
                  Icon(Icons.arrow_downward, color: Colors.black),
                  Text(
                    "0%",
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
