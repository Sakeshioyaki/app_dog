import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart' as Load;
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:dog_app/ui/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// class DetailBreedPage extends StatelessWidget {
//   const DetailBreedPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         final homeCubit = RepositoryProvider.of<HomeCubit>(context);
//         return DetailBreedCubit(
//             dogRes: context.read<DogRepository>(), homeCubit: homeCubit);
//       },
//       child: const DetailBreedPage(),
//     );
//   }
// }

class DetailBreedPage extends StatefulWidget {
  const DetailBreedPage({Key? key}) : super(key: key);
  @override
  State<DetailBreedPage> createState() => _DetailBreedPageState();
}

class _DetailBreedPageState extends State<DetailBreedPage> {
  // late DetailBreedCubit cubit;
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    // cubit = BlocProvider.of<DetailBreedCubit>(context);
    homeCubit = context.read<HomeCubit>();
    // homeCubit.fetchListBreedsImg();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    homeCubit.fetchListBreedsImg();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    homeCubit.updatePage();
    homeCubit.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state.getImg) {
              if (state.loadListImg == Load.LoadStatus.failure) {
                return const Text('faild to load');
              } else if (state.loadListImg == Load.LoadStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(children: [
                  Expanded(
                    child: SmartRefresher(
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      enablePullUp: true,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.listBreedsImg.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.greenAccent.withOpacity(0.3),
                            child: Center(
                                child:
                                    Image.network(state.listBreedsImg[index])),
                          );
                        },
                      ),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     homeCubit.updatePage();
                  //     homeCubit.loadMore();
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     child: Text(
                  //       'Load More',
                  //       style: AppTextStyle.greyS16Bold,
                  //     ),
                  //   ),
                  // ),
                ]);
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
