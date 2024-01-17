import 'package:assesment_app/core/utils/constants.dart';
import 'package:assesment_app/core/utils/enums.dart';
import 'package:assesment_app/core/utils/themes/app_theme.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/manager/pets_manager.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/widgets/cats_view/cats_grid.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/widgets/dogs_view/dogs_list.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/widgets/switch_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PetsMainView extends StatefulWidget {
  const PetsMainView({super.key});

  @override
  State<PetsMainView> createState() => _PetsMainViewState();
}

class _PetsMainViewState extends State<PetsMainView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.kAppName),
        actions: const [
          SwitchThemeWidget(),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(child: Text('Dogs')),
            Tab(child: Text('Cats')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          DogsList(),
          CatsGrid(),
        ],
      ),
    );
  }
}
