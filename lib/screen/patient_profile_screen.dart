import 'package:flutter/material.dart';
import 'package:group8_mapd722/constant.dart';
import 'package:group8_mapd722/screen/patient_tests_screen.dart';
import 'package:group8_mapd722/widget/custom_elevated_button.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CommonAppBar(title: 'Profile',),
      body: _getBody,
    );
  }

  get _getBody{
    const space = SizedBox(height: 12);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          onStretchTrigger: () {
            // Function callback for stretch
            return Future<void>.value();
          },
          expandedHeight: 300.0,
          pinned: true,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))
          ],
          flexibleSpace: FlexibleSpaceBar(
            // stretchModes: const <StretchMode>[
            //   StretchMode.zoomBackground,
            //   StretchMode.blurBackground,
            //   StretchMode.fadeTitle,
            // ],
            centerTitle: true,
            title:  Text('Sasuke Uchiha', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),
            titlePadding: const EdgeInsets.only(top: 12,bottom: 16),
            background: Stack(
             // fit: StackFit.expand,
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.3),
                    shape: BoxShape.rectangle,
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.only(top: 170),
                 child: Image.asset(kUserIcon),
               )
                // Image.network(
                //   'https://s3-alpha-sig.figma.com/img/b114/670d/fba688cc06201dccee7f9d7e3ac0d775?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VF8d0THiRW33PtcYsUhqls9F5zR0CAxA4jLMcUWYKZnd55q0PKwc66dKPTre~dzTHmMkRV4c0T7PQ0ETaRP2~jFwQ~ngC9XHQgRQdodveLTBozELoBkdGTQxAsuflnbgPpqkeiJUwFaOU4KgluVTGWg3MdMUQLkBZActsDxERbVS6Ply6YwZltl3lIPl4UZhX77ssbFZbTldDrm1Ei0LTrmZcxXB8I6P9bz6w7AdNHUM2ifUn6kGQx4z1PNm6IsIYcTwJy5YoBGDPF-jrJGND7GhB32wZ2bWi1hvwAy6c72OrKGF-RDUhsWw3f2BeFW072qH28Dg9G4huMj8FBdjSw__',
                //   //'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: Colors.grey[300]!,
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "First Name",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Sasuke",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Last Name",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Uchiha", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("susukeuchiha@gmail.com", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Monile",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("+1 456 765 6789", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gender",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Male", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date of birth",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("30-12-1998", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 20,),
                          Flexible(child: Text("33 Yonge Shepphered, Toronto, Canada", style: Theme.of(context).textTheme.bodyLarge, maxLines: 3,textAlign: TextAlign.end,)),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Department",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Pharmacy", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doctor",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                          Text("Naruto Uzumaki", style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4, 20, 24),
                child: CustomElevatedButton(
                  buttonText: 'View Clinical Tests',
                  onTap: () => _navigateToViewTests(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _navigateToViewTests(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const  PatientTestScreen()));
  }
}
