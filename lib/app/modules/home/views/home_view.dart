import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/custom_drawer.dart';
import '../widgets/buttom_bar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_body.dart';
import 'Job_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const HomeAppBar(),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const JobView()); // Navigates to the Create class
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const HomeBottomAppBar(),
      
    );
  }
}
