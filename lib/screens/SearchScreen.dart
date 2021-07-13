import 'package:flutter/material.dart';
import 'package:news_app/widget/SmartCodeTitle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SmartCodeTitle(),
      ),

      body:
      Container(
          height:1.sh,
          decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage('https://l.facebook.com/l.php?u=https%3A%2F%2Fi.dlpng.com%2Fstatic%2Fpng%2F6430467_preview.png%3Ffbclid%3DIwAR0kUsPhldz0Ehf3MmQ7s4UfX-S4DtrG5xaQyCDPZHeEAMvI_Uonj5C_BhI&h=AT2Ry2-LMT5_26oUUAkz8bOSanLSE0JcgtsvWr7Q2Eqy7d5wD4c6y8GFQAKHnRUFknR1F7n4xcjH5ICmFSYkaDJLDjryCrhDNQIVg2xNpUcStUbfituuuarAmyEt_E-h0kefZg')

    ),
          ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]
            ),
            child:TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.black,),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
