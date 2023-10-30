import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_app_test/core/di/injection_container.dart';
import 'package:tinder_app_test/features/currency/presentation/bloc/user_bloc.dart';
import 'package:tinder_app_test/features/currency/presentation/pages/user_details/user_details.dart';
import 'package:tinder_app_test/features/currency/presentation/widgets/back_button.dart';
import 'package:tinder_app_test/features/currency/presentation/widgets/next_button.dart';
import 'package:tinder_app_test/features/currency/presentation/widgets/refresh_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<UserBloc>(
        create: (context) => sl()..add(const GetUsersEvent()),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }

  nextPage() async {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      if (state is UsersLoadingState) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is UsersErrorState) {
        return const RefreshButton();
      }
      if (state is UsersDoneState) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: UserDetailsScreen(
                          user: state.users?[currentIndex],
                          images: state.images
                              ?.where((element) =>
                                  element.albumId ==
                                  state.users?[currentIndex].id)
                              .toList(),
                        ));
                  });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                itemCount: state.users?.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  final image = state.images?.firstWhere(
                    (element) =>
                        element.albumId == state.users?[currentIndex].id,
                  );
                  return Image.network(
                    image?.thumbnailUrl ?? '',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${state.users?[currentIndex].name}',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                Text(
                  '${state.users?[currentIndex].company?.name}',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${state.users?[currentIndex].username}',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonWidget(
                      onPressed: previousPage,
                    ),
                    NextButtonWidget(
                      onPressed: nextPage,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]);
      }
      return const SizedBox();
    });
  }
}
