import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart';
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:dog_app/ui/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBreedPage extends StatefulWidget {
  const DetailBreedPage({Key? key}) : super(key: key);
  @override
  State<DetailBreedPage> createState() => _DetailBreedPageState();
}

class _DetailBreedPageState extends State<DetailBreedPage> {
  late HomeCubit homeCubit;
  final ScrollController controller = ScrollController();
  final int dimensEnd = 50;

  @override
  void initState() {
    super.initState();

    homeCubit = context.read<HomeCubit>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          // buildWhen: (previousState, state) {},
          builder: (context, state) {
            controller.addListener(
              () {
                if (controller.offset - controller.position.maxScrollExtent >
                    20) {
                  print('calll loadmore');
                  homeCubit.loadMore();
                }
              },
            );
            if (state.getImg) {
              if (state.loadListImg == LoadStatus.failure) {
                return const Text('faild to load');
              } else if (state.loadListImg == LoadStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          return homeCubit.fetchListBreedsImg();
                        },
                        child: GridView.builder(
                          controller: controller,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: state.breedsImgList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  state.breedsImgList[index],
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    state.isLoading == true
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          )
                        : const SizedBox(height: 10),
                  ],
                );
              }
            } else {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Pls select breed',
                    style: AppTextStyle.blackS18,
                  ),
                ),
              );
            }
          }),
    );
  }
}
