import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/model/test.dart';
import 'package:group8_mapd722/util/util.dart';
import 'package:intl/intl.dart';

class TestCard extends StatelessWidget {
  final Test test;
  final Function()? onDelete;
  final Function()? onUpdate;

  const TestCard({super.key,required this.test, this.onDelete, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.grey[300]!,
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  test.testStatus == kCategoryList[1] ? kPositiveIcon : kCriticalIcon,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withAlpha(70),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    test.testDate ?? "",
                    //'Feb 28 2024',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black, fontSize: 11),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nurse",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text(test.nurseName ?? '',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blood Pressure (Systolic)",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text(test.readings?.systolicBP?.toString() ?? "", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blood Pressure (Diastolic)",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text(test.readings?.diastolicBP?.toString() ?? "", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Respiratory Rate",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text("${test.readings?.respiratoryRate?.toString() ?? ""}/min", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blood Oxygen Level",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text("${test.readings?.bloodOxygenLevel?.toString() ?? ""}%", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Heartbeat Rate",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                ),
                Text("${test.readings?.heartRate?.toString() ?? ""}/min", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "Created By : ${test.createdBy}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400),
                      ),
                      Text("Created On : ${test.createdOn}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    IconButton.filledTonal(
                      onPressed: onUpdate,
                      icon: const Icon(Icons.edit),
                      iconSize: 16,
                      visualDensity: VisualDensity.compact,
                    ),
                    IconButton.filledTonal(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_rounded),
                      color: Colors.red,
                      iconSize: 16,
                      visualDensity: VisualDensity.compact,
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
