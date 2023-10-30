import 'package:flutter/material.dart';
import 'package:tinder_app_test/features/currency/domain/entities/image.dart';
import 'package:tinder_app_test/features/currency/domain/entities/user.dart';
import 'package:tinder_app_test/features/currency/presentation/widgets/list_item.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen(
      {super.key, required this.user, required this.images});

  final UserEntity? user;
  final List<ImageEntity>? images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images?.length,
                itemBuilder: (BuildContext context, int index) {
                  final image = images?[index].thumbnailUrl ?? '';
                  return ListItemWidget(image: image);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${user?.name}',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              maxLines: 3,
            ),
            Text(
              '${user?.company?.name}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '${user?.username}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
