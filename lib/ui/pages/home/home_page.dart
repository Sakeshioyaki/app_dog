import 'package:dog_app/common/app_images.dart';
import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:dog_app/repositories/dog_repository.dart';
import 'package:dog_app/ui/pages/detailBreed/detail_breed_page.dart';
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:dog_app/ui/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeCubit(
          dogRes: context.read<DogRepository>(),
        );
      },
      child: const HomePageChill(),
    );
  }
}

class HomePageChill extends StatefulWidget {
  const HomePageChill({Key? key}) : super(key: key);

  @override
  State<HomePageChill> createState() => _HomePageChillState();
}

class _HomePageChillState extends State<HomePageChill> {
  late HomeCubit cubit;

  @override
  void initState() {
    final dogRepo = RepositoryProvider.of<DogRepository>(context);
    cubit = HomeCubit(dogRes: dogRepo);
    cubit.fetchListBreeds();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImages.coverDog,
            fit: BoxFit.cover,
            height: 180,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state.loadListBreeds == LoadStatus.failure) {
                return const Text('faild to load');
              } else if (state.loadListBreeds == LoadStatus.loading) {
                print('loading list');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.listBreeds?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print("tappp -${state.listBreeds?[index].key} ");
                          Get.to(() => const DetailBreedPage(),
                              arguments: state.listBreeds?[index].key);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent.withOpacity(0.5),
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.listBreeds?[index].key ?? '',
                                      style: AppTextStyle.blackS24,
                                    )),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                size: 25,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  // Container buildItemBreeds(BuildContext context, HomeState state, int index) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(
  //       vertical: 5,
  //       horizontal: 5,
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     height: 60,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       color: Colors.greenAccent.withOpacity(0.5),
  //       border: Border.all(color: Colors.black12),
  //     ),
  //     child: GestureDetector(
  //       onTap: () {
  //         print("tappp -state.listBreeds?[index].key] ");
  //         Get.to(const DetailBreedPage(),
  //             arguments: ["breed", state.listBreeds?[index].key]);
  //       },
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 5),
  //             child: Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 5),
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   state.listBreeds?[index].key ?? '',
  //                   style: AppTextStyle.blackS24,
  //                 )),
  //           ),
  //           const Icon(
  //             Icons.navigate_next,
  //             size: 25,
  //             color: Colors.black,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
