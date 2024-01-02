import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/job_controller.dart'; // Import GetX if you haven't already

class JobAppbar extends GetView<JobController> implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const JobAppbar({Key? key, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Create Job',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontStyle: FontStyle.italic),
      ),
      backgroundColor: Colors.purple,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
