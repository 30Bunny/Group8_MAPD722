import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

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
              //spreadRadius: .3,
              /*color: Colors.black.withOpacity(
                              .2,
                            ),*/
              //blurRadius: 2.0,
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
                      Text("Sasuke Uchiha", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),),
                      Text("sasukeuchiha@gmail.com", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(12))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text('Normal', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),),
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
                      Text("Pharmacy", style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
                Expanded(child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text("Doctor", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400, fontSize: 11),),
                    Text("Naruto Uzumaki", style: Theme.of(context).textTheme.bodyLarge),
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
                      Text("Created By : Bansi", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400),),
                      Text("Created On : 2024-02-27", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Wrap(
                  children: [
                    IconButton.filledTonal(onPressed: (){}, icon: const Icon(Icons.edit),iconSize: 16, visualDensity: VisualDensity.compact,),
                    IconButton.filledTonal(onPressed: (){}, icon: const Icon(Icons.delete_rounded), color: Colors.red,iconSize: 16, visualDensity: VisualDensity.compact,)
                  ],
                )
              ],
            )
          ],
        )
    );
  }
}
