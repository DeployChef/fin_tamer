import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../connectivity_sync_provider.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(connectivitySyncProvider);
    if (status == NetworkStatus.offline) {
      return Container(
        width: double.infinity,
        color: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: const Center(
          child: Text(
            'Offline mode',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
