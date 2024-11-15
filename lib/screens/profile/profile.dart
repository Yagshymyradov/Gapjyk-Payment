import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/indicators.dart';
import '../../providers.dart';

final profileProvider = FutureProvider((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.profile();
});

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(authControllerProvider);
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user?.username ?? ''),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(profileProvider),
        child: profile.when(
          data: (data) => ListView(
          padding: const EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Galyndy: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.limit} aý',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Täze satylanlar: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.sold} aý',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Umumy satylanlar: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.totalSold} aý',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Goterim: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.percent} %',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Satyjy girdejisi: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.sellerProfit.toStringAsFixed(1)} TMT',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Admin girdejisi: ',
                    style: textTheme.labelMedium,
                  ),
                  Text(
                    '${data.adminProfit.toStringAsFixed(1)} TMT',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          error: (error, stack) => NoConnectionIndicator(
            onRetryTap: () async => ref.invalidate(profileProvider),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
