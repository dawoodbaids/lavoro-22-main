// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lavoro/app/modules/home/widgets/create_appbar.dart';
import 'package:lavoro/app/modules/home/widgets/job_view.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: JobAppbar(),
      body: JobBody(),
    );
  }
}
