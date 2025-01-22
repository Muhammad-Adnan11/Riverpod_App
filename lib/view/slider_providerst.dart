import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/view_model/slider_provider.dart';

class SliderProviderst extends ConsumerWidget {
  const SliderProviderst({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('print');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child) {
            final slider = ref.watch(sliderProvider);
            return Container(
              height: 100,
              width: 100,
              color: Colors.red.withOpacity(slider),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final slider = ref.watch(sliderProvider);
            return Slider(
                value: slider,
                onChanged: (value) {
                  ref.read(sliderProvider.notifier).state = value;
                });
          })
        ],
      ),
    );
  }
}
