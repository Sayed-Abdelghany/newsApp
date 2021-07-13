import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Model/CategoryModel.dart';

class CategoryContainer extends StatelessWidget {
  CategoryModel ?categoryModel ;
  CategoryContainer({this.categoryModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: Colors.deepOrangeAccent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(categoryModel!.imageUrl!),
            )
        ),
        height:0.15.sh ,
        width: .7.sw,
        child: Center(
          child: Text(categoryModel!.name!,style: TextStyle(color: Colors.red,
              fontSize: 30.sp,fontWeight: FontWeight.w900),),
        ),
      ),
    );
  }
}
