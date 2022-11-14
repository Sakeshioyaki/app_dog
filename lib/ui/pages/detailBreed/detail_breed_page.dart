import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:dog_app/repositories/dog_repository.dart';
import 'package:dog_app/ui/pages/detailBreed/detail_breed_cubit.dart';
import 'package:dog_app/ui/pages/detailBreed/detail_breed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DetailBreedPage extends StatelessWidget {
  const DetailBreedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailBreedCubit(dogRes: context.read<DogRepository>());
      },
      child: const DetailBreedPageChill(),
    );
  }
}

class DetailBreedPageChill extends StatefulWidget {
  const DetailBreedPageChill({Key? key}) : super(key: key);

  @override
  State<DetailBreedPageChill> createState() => _DetailBreedPageChillState();
}

class _DetailBreedPageChillState extends State<DetailBreedPageChill> {
  late DetailBreedCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<DetailBreedCubit>(context);
    cubit.updateBreed(breeds: Get.arguments);
    print("this is parameter ${Get.arguments}");
    cubit.fetchListBreedsImg();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBreedCubit, DetailBreedState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.loadListImg == LoadStatus.failure) {
          return const Text('faild to load');
        } else if (state.loadListImg == LoadStatus.loading) {
          print('loading list');
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                state.breeds ?? '',
                style: AppTextStyle.blackS18,
              ),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    cubit.fetchListBreedsImg();
                  },
                  child: const Icon(
                    Icons.refresh,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 15)
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.listBreedsImg?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.greenAccent.withOpacity(0.3),
                        child: Center(
                            child: Image.network(state.listBreedsImg?[index])),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    cubit.updatePage();
                    cubit.loadMore();
                  },
                  child: Container(
                    height: 50,
                    child: Text(
                      'Load More',
                      style: AppTextStyle.greyS16Bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
