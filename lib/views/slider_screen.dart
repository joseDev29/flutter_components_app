import 'package:components_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double _sliderValue = 200;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          // Slider.adaptative permite que el estilo del slider
          // se adapte en base al SO
          Slider.adaptive(
            min: 100,
            max: 400,
            // ~/ = Integer division
            //divisions: 400 ~/ 50,
            value: _sliderValue,
            activeColor: AppTheme.primaryColor,
            onChanged: _sliderEnabled
                ? (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  }
                : null,
          ),
          Checkbox(
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Slider enabled'),
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value ?? false;
              });
            },
          ),
          Switch.adaptive(
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value;
              });
            },
          ),
          SwitchListTile.adaptive(
            title: const Text('Slider enabled'),
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value;
              });
            },
          ),
          const AboutListTile(),
          const SizedBox(height: 32),
          Image(
            image: const NetworkImage(
                'https://i.pinimg.com/originals/af/e8/92/afe8921ddf88d507341fcec89948bb40.png'),
            fit: BoxFit.contain,
            width: _sliderValue,
          )
        ],
      ),
    );
  }
}
