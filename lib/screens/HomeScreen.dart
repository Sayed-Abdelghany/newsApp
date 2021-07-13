import 'package:animations/animations.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Model/CategoryModel.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:news_app/api_helper/api_helper.dart';
import 'package:news_app/screens/SearchScreen.dart';
import 'package:news_app/widget/CategoryContainer.dart';
import 'package:news_app/widget/SmartCodeTitle.dart';
class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel>categories=[
    CategoryModel(name: 'General',imageUrl: 'https://www.sayidaty.net/sites/default/files/styles/800x510/public/2020/01/12/6313186-1286155301.jpg'),
    CategoryModel(name: 'Health',imageUrl: 'https://ccute.cc/wp-content/uploads/2020/03/4806-2.jpg'),
    CategoryModel(name: 'Sport',imageUrl: 'https://www.wikihow.com/images_en/thumb/d/d5/Exercise-Step-51.jpg/v4-460px-Exercise-Step-51.jpg.webp'),
    CategoryModel(name: 'Economic',imageUrl: 'https://www.elbyan.com/wp-content/uploads/FB_IMG_1470847059538.jpg'),
    CategoryModel(name: 'Arts',imageUrl: 'https://5jl.cc/wp-content/uploads/2019/10/3208-10.jpg'),
  ];
  List<NewsModel>articles=[];
  ApiHelper apiHelper =ApiHelper();
  getNews(){
    apiHelper.getNews().then((value){
      setState(() {
        articles=value;
      });
    });
  }
  @override
  void initstate(){
    super.initState();
    getNews();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child:OpenContainer(
          transitionDuration: Duration(microseconds: 500),
            closedBuilder: (context,c){
              return Icon(Icons.search,color: Colors.deepPurple,);
            },
            openBuilder: (context,c){
              return SearchScreen();
            }) ,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SmartCodeTitle(),
        bottom: PreferredSize(
          preferredSize:Size(100.h,100.w) ,
          child: Row(
            children: [
             Container(
               height: 100.h,width: 1.sw,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                 CountryCodePicker(
                   initialSelection: 'Eg',
                   showOnlyCountryWhenClosed: true,
                 ),
                 ],
               ),
             ),
            ],
          ),
        )
      ),
      body: Column(
        children: [
          Container(
            height: .25.sh,
            width: 1.sw,
            child: ListView.builder(
              itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return CategoryContainer(categoryModel: categories[index],);
                }),
          ),
          Container(
            height: .499.sh,
            width: 1.sw,
            child: ListView.builder(
              itemCount: articles.length,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: .7.sw,
                    height: .35.sh,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image:DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(
                            articles[index].imageUrl==null?
                            'https://www.alroeya.com/uploads/images/2020/09/11/924409.jpg':
                            articles[index].imageUrl!
                        ),
                      ),
                    ),
                  ),
                );
                }),
          ),
        ],
      ),
    );
  }
}



