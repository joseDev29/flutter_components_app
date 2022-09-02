import 'package:flutter/material.dart';

import 'package:components_app/theme/app_theme.dart';

class ListViewBuilderView extends StatefulWidget {
  const ListViewBuilderView({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderView> createState() => _ListViewBuilderViewState();
}

class _ListViewBuilderViewState extends State<ListViewBuilderView> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  void add10() {
    final int lastId = imagesIds.last;
    setState(() {
      imagesIds.addAll(List.generate(10, (index) => index + 1 + lastId));
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 3));
    add10();
    setState(() => isLoading = false);

    if (scrollController.position.pixels + 100 <
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add10();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(children: [
          RefreshIndicator(
            color: AppTheme.primaryColor,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: imagesIds.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeInImage(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/image_placeholder.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                );
              },
            ),
          ),
          if (isLoading)
            Positioned(
              bottom: 40,
              left: size.width * 0.5 - 30,
              child: const _Loading(),
            ),
        ]),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
      ),
    );
  }
}
