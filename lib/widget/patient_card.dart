import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/model/patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final Function()? onTap;
  final Function()? onDelete;
  final Function()? onUpdate;
  final Function()? onViewTests;
  const PatientCard({super.key, required this.patient, this.onDelete, this.onUpdate, this.onViewTests, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                children: [
                  Image.asset(kUserIcon, width: 36, height: 36,),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text("${patient.firstName} ${patient.lastName}", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
                        Text(patient.email ?? "", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: patient.status == kCategoryList[1] ? kAlphaGreenBackColor : kAlphaRedBackColor,
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(patient.status ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: patient.status == kCategoryList[1] ? kPrimaryDarkColor : kRedColor, fontSize: 11),),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text("Department", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400, fontSize: 11),),
                        Text(patient.department ?? "", style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Expanded(child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text("Doctor", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400, fontSize: 9),),
                      Text(patient.doctor ?? "", style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text("Created By : ${patient.createdBy}", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400),),
                        Text("Created On : ${patient.createdOn}", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Wrap(
                    children: [
                      IconButton.filledTonal(onPressed: onViewTests, icon: const Icon(Icons.remove_red_eye), color: Colors.blueGrey, iconSize: 16, visualDensity: VisualDensity.compact,),
                      IconButton.filledTonal(onPressed: onUpdate, icon: const Icon(Icons.edit),iconSize: 16, visualDensity: VisualDensity.compact,),
                      IconButton.filledTonal(onPressed: onDelete, icon: const Icon(Icons.delete_rounded), color: Colors.red,iconSize: 16, visualDensity: VisualDensity.compact,)
                    ],
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
