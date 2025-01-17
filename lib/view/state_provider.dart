import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});
final Switchprovider = StateProvider<bool>((ref) {
  return false;
});

class counterprovider extends ConsumerStatefulWidget {
  const counterprovider({super.key});

  @override
  ConsumerState<counterprovider> createState() => _counterproviderState();
}

class _counterproviderState extends ConsumerState<counterprovider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(counter);
            print('build2');
            return Center(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 19),
              ),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(Switchprovider);
            print('build322');
            return Center(
              child: Switch(
                  value: count,
                  onChanged: (value) {
                    ref.read(Switchprovider.notifier).state = value;
                  }),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                },
                child: Center(
                  child: Text('+'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state--;
                },
                child: Center(
                  child: Text('-'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
// class Counterprovider extends ConsumerWidget {
//   const Counterprovider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     print('build1');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Consumer(builder: (context, ref, child) {
//             final count = ref.watch(counter);
//             print('build2');
//             return Center(
//               child: Text(
//                 count.toString(),
//                 style: TextStyle(fontSize: 19),
//               ),
//             );
//           }),
//           Consumer(builder: (context, ref, child) {
//             final count = ref.watch(Switchprovider);
//             print('build3');
//             return Center(
//               child: Switch(
//                   value: count,
//                   onChanged: (value) {
//                     ref.read(Switchprovider.notifier).state = value;
//                   }),
//             );
//           }),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state++;
//                 },
//                 child: Center(
//                   child: Text('+'),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(counter.notifier).state--;
//                 },
//                 child: Center(
//                   child: Text('-'),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
