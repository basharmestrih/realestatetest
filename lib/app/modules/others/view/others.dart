import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/category_model.dart';
import 'package:my_house_app/app/modules/mainscreen/controllers/mainbar_controller.dart';
import 'package:my_house_app/app/modules/others/controllers/others_controller.dart';
import 'package:my_house_app/app/modules/others/view/widgets/otherscard.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertycard.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertychips.dart';
import 'package:my_house_app/app/modules/property/view/widgets/searchbar.dart';
import 'package:my_house_app/app/routes/app_pages.dart';

class OthersView extends StatefulWidget {
  @override
  State<OthersView> createState() => _OthersViewState();
}

class _OthersViewState extends State<OthersView> {
  int selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  // edit here for API
  final controller = Get.put(OthersController());
  //final randomHomes = [...exampleHomes]..shuffle();


void _onSearchPressed() {
  final searchText = _searchController.text.trim();
    print(_searchController.text.trim());

  controller.fetchOthersData(query: searchText);
}
  Future<void> _onRefresh() async {
    
    // Call your API methods again
    await Future.wait([
      controller.fetchOthersData(), 

    ] as Iterable<Future>);
  }


@override
Widget build(BuildContext context) {
  return RefreshIndicator(
     onRefresh: _onRefresh,
    color:Theme.of(context).colorScheme.error, 
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20.w,vertical: 10.h ),
            child: Column(
      
              children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.r), // Ensure you have ScreenUtil initialized
          decoration: BoxDecoration(
            color:  Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:  Theme.of(context).colorScheme.onPrimaryContainer, // Default color for the main text
                  ),
              children: [
                TextSpan(
                  text: 'لإضافة محلك للبيع اذهب إلى قسم ',
                ),
                TextSpan(
                  text: 'خدمة الزبائن',
                  style: TextStyle(
                    
                    color: Colors.blue, // Blue color for this specific text
                    fontWeight: FontWeight.bold, // Optional: make it bold
                  ),
                  recognizer: TapGestureRecognizer()
              ..onTap = () {
                // 🔹 Navigate to the target page
                Get.toNamed(Routes.ASKFORAD);
                // or Get.to(CustomerServicePage());
              },
                ),
              ],
            ),
          ),
        ),
      ],
      ),
      
                SizedBox(height: 8.h,),
                SearchBarWithButton(
                  controller: _searchController,
                  onSearch: _onSearchPressed,
                ),
              ],
            ),
          ),
      
          //const SizedBox(height: 20),
      
         
          Padding(
            padding:  EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 10.h),
            child: SizedBox(
              height: 45.h,
              child:ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: CategoryModel.categories.length,
                separatorBuilder: (_, __) =>  SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  return CategoryChip(
                label: CategoryModel.categories[index],
                isSelected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                                  // Arabic city names by index
                    final List<String> arabicCities = [
                      "الكل",       // all
                      "دمشق",
                      "ريف دمشق",
                      "حلب",
                      "حمص",
                      "حماة",
                      "اللاذقية",
                      "طرطوس",
                      "إدلب",
                      "السويداء",
                      "درعا",
                      "دير الزور",
                      "الرقة",
                      "الحسكة",
                      "القنيطرة",
                    ];
                  final cityToPass = arabicCities[index];
                  print(cityToPass);
      
                  controller.fetchOthersData(location: cityToPass == "all" ? null : cityToPass);
                },
              );
      
                },
              ),
      
                      ),
                    ),
      
                    
      
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    print('loading');
                    return Center(
              child: SizedBox(
                width: 95.w,
                height: 90.h,
                child: SpinKitFadingCircle(
                color: Theme.of(context).colorScheme.error,
                size: 80.0,
              ),
              ),
                          );
                  
                  }
                  
                  if (controller.othersList.isEmpty) {
                    return Center(child: Text("No others found"));
                  }
                  
                  return ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: controller.othersList.length,
  itemBuilder: (_, index) {
    final others = controller.othersList[index];
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: OthersCard(
        id: others.id,
        imageUrls: others.imgUrls,
        location: others.location,
        address: others.address,
        name: others.title,
        floorsNumber: others.floorsNumber,
        mainFeatures: others.mainFeatures,
        description: others.description,
        price: others.price.toInt(),
        isSell: others.isSell,
        isRent: others.isRent,
        areaDistance: others.areaDistance,
        arealength: others.arealength,
        areawidth: others.areawidth,
      ),
    );
  },
);

                  
                }),
              ),
      
                
                  ],
                ),
    ),
  );
          }

          }
