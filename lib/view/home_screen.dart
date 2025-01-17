import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asiftaj = Provider<String>((ref) {
  return 'subscribe my channel';
});
final age = Provider<int>((ref) {
  return 233;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final sub = ref.watch(asiftaj);
    final taj = ref.watch(age);
    return Scaffold(
      body: Center(
        child: Text(
          sub + "  " + taj.toString(),
        ),
      ),
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final sub = ref.watch(asiftaj);
//     final taj = ref.watch(age);
//     return Scaffold(
//       body: Center(
//         child: Text(sub + " " + taj.toString()),
//       ),
//     );
//   }
// }
