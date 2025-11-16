import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary_important.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ImportantsBuilder extends StatelessWidget {
  const ImportantsBuilder({Key? key, required this.moment}) : super(key: key);
  final SummaryImportant moment;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    final theme = ShadTheme.of(context);
    return ClassroomCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showShadDialog(
                context: context,
                builder: (context) {
                  return ShadDialog(
                    constraints: BoxConstraints(maxWidth: 1000, maxHeight: 800),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: CachedNetworkImage(
                        imageUrl: moment.capture_url!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            },
            child: SizedBox(
              width: 200,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: moment.capture_url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              spacing: 8,
              children: [
                Row(
                  children: [
                    if (moment.is_hardest)
                      ShadBadge.destructive(child: Text('가장 어려웠던 순간')),
                    Spacer(),
                    Text(
                      timeFormat.format(moment.created_at),
                      style: theme.textTheme.small,
                    ),
                  ],
                ),
                if (moment.note.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.muted,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(moment.note, style: theme.textTheme.muted),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
