import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 60,
        title: const Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: const CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(
              'https://depor.com/resizer/3XTmXJgo9fXRS2_ININe6BKhgek=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/Q7AHXEQYA5C7NMIDBAIN4H57O4.png'),
        ),
      ),
    );
  }
}
