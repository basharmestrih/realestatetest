import 'package:flutter/material.dart';
import 'package:my_house_app/app/modules/askforad/views/widgets/appbar.dart';
import 'package:my_house_app/app/modules/askforad/views/widgets/post_property_page.dart';

class AskForAdPage extends StatelessWidget {
  const AskForAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailedAppBar(),
      body: const PostPropertyPage());
  }
}


