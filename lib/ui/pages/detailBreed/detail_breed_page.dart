import 'package:dog_app/common/app_text_styles.dart';
import 'package:dog_app/models/enums/load_status.dart' as load;
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
  final int dimensEnd = 150;

  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    controller.addListener(_onScroll);
  }

  void _onScroll() {
    bool load = homeCubit.getLoading();
    if (!controller.hasClients || load) return;
    final reached = controller.position.pixels >
        (controller.position.maxScrollExtent - dimensEnd);
    if (reached) {
      homeCubit.updatePage();
      homeCubit.loadMore();
      // controller.e
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: homeCubit,
          builder: (context, state) {
            if (state.getImg) {
              if (state.loadListImg == load.LoadStatus.failure) {
                return const Text('faild to load');
              } else if (state.loadListImg == load.LoadStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(children: [
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
                  // SliverToBoxAdapter(
                  // child: state.canLoadMore
                  // ? Container(
                  // padding: EdgeInsets.only(bottom: 16),
                  // alignment: Alignment.center,
                  // child: CircularProgressIndicator(),
                  // )
                  //     : SizedBox(),
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
