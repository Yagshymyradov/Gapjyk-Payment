import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/theme.dart';

class NoConnectionIndicator extends StatelessWidget {
  final VoidCallback? onRetryTap;

  const NoConnectionIndicator({
    super.key,
    this.onRetryTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const SizedBox(height: 80),
          AppIcons.noConnection.svgPicture(),
          const SizedBox(height: 40),
          Text(
            'Internet ýok!',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Internet birikmesini barlaň we täzeden synyşyň.',
            textAlign: TextAlign.center,
            style: textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
            height: 36,
            child: ElevatedButton(
              onPressed: onRetryTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.retry.svgPicture(),
                  const SizedBox(width: 8),
                  Text(
                    'Täzele',
                    style: textTheme.displayMedium?.copyWith(
                      color: AppColors.darkGreenColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
