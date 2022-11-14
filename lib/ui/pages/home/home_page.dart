import 'package:dog_app/common/app_images.dart';
import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/breed/breed.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
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
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.yellow.withOpacity(0.4),
                    constraints:
                        const BoxConstraints(minHeight: 52, maxHeight: 52),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent.withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(17),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Search breed here ...',
                    hintStyle: AppTextStyle.blackS14,
                    helperStyle: AppTextStyle.blackS14,
                    alignLabelWithHint: false,
                  ),
                  style: AppTextStyle.blackS14,
                  // onTap: (text) {},
                  onChanged: (text) {
                    if (state.isSearching == false) {
                      cubit.setSearching();
                    }
                    if (text == '') {
                      cubit.setSearching();
                    } else {
                      cubit.setTextSearch(text);
                    }
                  },
                ),
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
                      child: state.isSearching ?? false
                          ? buildListSearch(
                              state.listBreeds ?? [], state.textSearch ?? '')
                          : ListView.separated(
                              itemCount: state.listBreeds?.length ?? 0,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(
                                        "tappp -${state.listBreeds?[index].key} ");
                                    Get.to(() => const DetailBreedPage(),
                                        arguments:
                                            state.listBreeds?[index].key);
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
                                      color:
                                          Colors.greenAccent.withOpacity(0.5),
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                state.listBreeds?[index].key ??
                                                    '',
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
      },
    );
  }

  Widget buildListSearch(List<Breed> list, String textSearch) {
    List<Breed> resultSearch = [];
    for (var e in list) {
      if (e!.key!.contains(textSearch)) {
        resultSearch.add(e);
      }
    }
    return ListView.builder(
      itemCount: resultSearch.length,
      itemBuilder: (context, index) {
        var breed = resultSearch[index]!;
        return GestureDetector(
          onTap: () {
            print("tappp -${breed.key} ");
            Get.to(() => const DetailBreedPage(), arguments: breed.key);
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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        breed.key ?? '',
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
    );
  }
}
