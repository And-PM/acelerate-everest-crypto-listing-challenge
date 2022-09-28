import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';

class DefaultBigButton extends HookConsumerWidget {
  final double cryptoQtdWallet;
  final String criptoAbrev;
  const DefaultBigButton({
    this.cryptoQtdWallet = 0,
    this.criptoAbrev = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
        onPressed: () {
          ref.watch(criptoAbrevProvider.state).state = criptoAbrev;
          ref.watch(criptoQtdWalletCriptoProvider.state).state =
              cryptoQtdWallet;
          Navigator.pushNamed(
            context,
            '/convert',
          );
        },
        child: const Text(
          "Converter moeda",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
