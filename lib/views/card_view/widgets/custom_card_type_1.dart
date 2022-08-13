import 'package:flutter/material.dart';

import 'package:components_app/widgets/widgets.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(Icons.person_outline),
              title: Text('Card'),
              subtitle: Text(
                  'Deserunt consectetur enim magna anim fugiat dolor voluptate sit mollit consectetur anim.Aliquip do anim ad nostrud excepteur quis anim. Duis veniam culpa cillum consectetur dolor ipsum et irure aute enim. Amet commodo nisi commodo anim nostrud dolor.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextDangerButton(text: 'Cancel', onPressed: () {}),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ok'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
