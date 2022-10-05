import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../../transactions/providers/transaction_providers.dart';

class ConfirmReviewButton extends HookConsumerWidget {
  const ConfirmReviewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TransactionModel> transactions = [];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          onPressed: () {
            DateTime now = DateTime.now();

            DateTime date = DateTime(now.year, now.month, now.day);
            TransactionModel transactionModel = TransactionModel(
              date: date,
              fromCryptoQtd:
                  ref.watch(cryptoQtdWalletCriptoProvider.state).state,
              fromCryptoAbrev: ref.watch(fromCryptoConvertAbrev.state).state,
              toCryptoQtd: 0.0,
              toCryptoAbrev: ref.watch(toCryptoConvertAbrev.state).state,
              valueReais:
                  double.parse(ref.watch(fieldTransferValue.state).state),
            );

            transactions.add(transactionModel);
            ref.watch(transactionsProvider.state).state = transactions;

            Navigator.pushNamed(
              context,
              '/complete-conversion',
            );
          },
          child: const Text(
            'Concluir conversão',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}