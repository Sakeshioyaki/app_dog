import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart' as Load;
import 'package:dog_app/ui/pages/home/home_cubit.dart';
import 'package:dog_app/ui/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailBreedPage extends StatefulWidget {
  const DetailBreedPage({Key? key}) : super(key: key);
  @override
  State<DetailBreedPage> createState() => _DetailBreedPageState();
}

class _DetailBreedPageState extends State<DetailBreedPage> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();

    homeCubit = context.read<HomeCubit>();
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
    _refreshController.loadComplete();
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.listBreedsImg.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                state.listBreedsImg[index],
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
