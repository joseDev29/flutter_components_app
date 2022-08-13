import 'package:components_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? text;

  const CustomCardType2({Key? key, required this.imageUrl, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //Evita que los elementos internos se desborden
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 20,
      shadowColor: AppTheme.primaryColor.withOpacity(0.6),
      child: Column(
        children: [
          // Image.network(
          //     'https://images.unsplash.com/photo-1660308985375-bf5984ff786e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2400&h=1697&q=80'),
          FadeInImage(
              //Toma el width total como infinity
              //Solo funcion en widgets con un width o height limitado
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/image_placeholder.gif'),
              image: NetworkImage(imageUrl)),

          if (text != null)
            Container(
                // alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  text!,
                  style: const TextStyle(fontSize: 16),
                ))
        ],
      ),
    );
  }
}
