// package imports
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// application imports
import 'counter_providers.dart';

class ShowColorBox extends ConsumerWidget {
  const ShowColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      // Consumer is a widget that allows you reading providers.
      child: Consumer(builder: (context, ref, _) {
        final redCount = ref.watch(redCounterProvider);
        final greenCount = ref.watch(greenCounterProvider);
        final blueCount = ref.watch(blueCounterProvider);
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : [
              SizedBox(
                width: 250,
                height: 250,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, redCount, greenCount, blueCount)
                  ),
                ),
              ),
              Text('R:$redCount/G:$greenCount/B:$blueCount')
            ]
        );
      }),
    ) ;
  }
}
