import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/category_model.dart';
import 'package:my_house_app/app/modules/mainscreen/controllers/mainbar_controller.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertycard.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertychips.dart';
import 'package:my_house_app/app/modules/property/view/widgets/searchbar.dart';
import 'package:my_house_app/app/routes/app_pages.dart';

class PropertyView extends StatefulWidget {
  @override
  State<PropertyView> createState() => _PropertyViewState();
}

class _PropertyViewState extends State<PropertyView> {
  int selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  // edit here for API
  final controller = Get.find<PropertyController>();
  //final randomHomes = [...exampleHomes]..shuffle();


void _onSearchPressed() {
  final searchText = _searchController.text.trim();
    print(_searchController.text.trim());

  controller.fetchHouses(query: searchText);
}

  Future<void> _onRefresh() async {
    
    // Call your API methods again
    await Future.wait([
      controller.fetchHouses(), 

    ] as Iterable<Future>);
  }


@override
Widget build(BuildContext context) {
  return RefreshIndicator(
    onRefresh: _onRefresh,
    color:Theme.of(context).colorScheme.error, 
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
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
          padding: EdgeInsets.symmetric(horizontal:15.r, vertical: 10.r), 
          decoration: BoxDecoration(
            color:Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer, // Default color for the main text
                  ),
              children: [
                TextSpan(
                  text: 'add_property_instruction'.tr,
                  style: TextStyle(
                    
                    fontSize: 15.r,
                  ),
                  
                ),
                TextSpan(
                  text: 'customer_service'.tr,
                  style: TextStyle(
                    
                    color: Colors.blue, // Blue color for this specific text
                    fontWeight: FontWeight.bold, // Optional: make it bold
                    fontSize: 14.r,
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
         
          Padding(
            padding:  EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 10.h),
            child: SizedBox(
              height: 40.h,
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
      
      controller.fetchHouses(location: cityToPass == "all" ? null : cityToPass);
                },
              );
      
                },
              ),
      
                      ),
                    ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
              child: SizedBox(
                width: 95.w,
                height: 90.h,
                child:  SpinKitFadingCircle(
                    color:Theme.of(context).colorScheme.error,
                    size: 80.0,
                    ),
                     
              ),
                            );
                    
                  }
                    
                  if (controller.houseList.isEmpty) {
                    return Center(child: Text("No houses found"));
                  }
                    
                  return ListView.builder(
                    shrinkWrap: true,                
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.houseList.length,
                    itemBuilder: (_, index) {
                      final home = controller.houseList[index];
                    
                    
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: PropertyCard(
                          id: home.id,
                          imageUrls: home.imgUrls,
                          videoUrl: home.videoUrl, // assuming you’ve added this field in the model
                          location: home.location,
                          address: home.address,
                          name: home.title,
                          roomsNumber: home.roomsNumber,
                          bathsNumber: home.bathsNumber,
                          floorsNumber: home.floorsNumber,
                          groundDistance: home.groundDistance,
                          buildingAge: home.buildingAge,
                          mainFeatures: home.mainFeatures,
                          description: home.description,
                          price: '\$${home.price}',
                          isSell: home.isSell,
                          isRent: home.isRent,
                          isFurnitured: home.isFurnitured,
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
