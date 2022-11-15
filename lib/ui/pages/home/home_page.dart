import 'package:dog_app/common/app_images.dart';
import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/ui/pages/detailBreed/detail_breed_page.dart';
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:dog_app/ui/pages/home/home_state.dart';
import 'package:dog_app/ui/pages/home/widgets/breeds_list_dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit cubit;

  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    cubit.fetchListBreeds();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.coverDog,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 150,
                    child: TextButton(
                      onPressed: () async {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          useRootNavigator: false,
                          builder: (context) => StatefulBuilder(
                            builder: (ctx, setState) => BreedListDialogPage(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 1),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: Text(
                          'Select breed',
                          style: AppTextStyle.whiteS18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(child: Center(child: DetailBreedPage())),
            ],
          ),
        );
      },
    );
  }
}
