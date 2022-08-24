import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery_add_to_cart_page/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en",""),
        Locale("tr","")
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: mainColor,
        primarySwatch: Colors.blue,
      ),
      home: const GroceryAddToCartPage(),
    );
  }
}

class GroceryAddToCartPage extends StatefulWidget {
  const GroceryAddToCartPage({Key? key}) : super(key: key);

  @override
  State<GroceryAddToCartPage> createState() => _GroceryAddToCartPageState();
}

class _GroceryAddToCartPageState extends State<GroceryAddToCartPage> {
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);

    var screenInfo = MediaQuery.of(context);
    final double screenHeightCoefficient = screenInfo.size.height/800;
    final double screenWidthCoefficient = screenInfo.size.width/400;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leadingWidth: 40,
        leading:Padding(
          padding:  EdgeInsets.only(left: 10.0*screenWidthCoefficient),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10.0*screenWidthCoefficient),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(20*(screenWidthCoefficient+screenHeightCoefficient)/2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/broccoli.png",scale: 2,),
              ],
            ),

            Text(d!.broccoliText,style: TextStyle(fontSize:40*(screenWidthCoefficient+screenHeightCoefficient)/2, fontFamily: "Oswald-Bold"),),
            Row(
              children:  [
                Text(d.newPriceText,style: TextStyle(fontSize: 18*(screenWidthCoefficient+screenHeightCoefficient)/2),),
                Padding(
                  padding: EdgeInsets.only(left: 10.0*screenWidthCoefficient),
                  child: Text(d.oldPriceText,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey),),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.remove_circle,size: 30*(screenWidthCoefficient+screenHeightCoefficient)/2,),
                  color: greenColor,
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.all(8.0*(screenWidthCoefficient+screenHeightCoefficient)/2),
                  child: Text("1",style: TextStyle(fontSize: 18*(screenWidthCoefficient+screenHeightCoefficient)/2),),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle,size: 30*(screenWidthCoefficient+screenHeightCoefficient)/2,),
                  color: greenColor,
                  onPressed: () {},
                ),
              ],
            ),
            Text(d.descriptionText,style: TextStyle(fontSize: 20*(screenWidthCoefficient+screenHeightCoefficient)/2,fontFamily: "Oswald-Bold"),),
            Text(d.descriptionAreaText,style: TextStyle(fontSize: 15*(screenWidthCoefficient+screenHeightCoefficient)/2),),
            Text(d.relatedItemText,style: TextStyle(fontSize: 20*(screenWidthCoefficient+screenHeightCoefficient)/2,fontFamily: "Oswald-Bold"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReleatedItem(imagePath: "images/lemons.png", imageName: d.lemonText,screenWidthCoefficient: screenWidthCoefficient,screenHeightCoefficient: screenHeightCoefficient,),
                ReleatedItem(imagePath: "images/meat.png", imageName: d.meatText,screenWidthCoefficient: screenWidthCoefficient,screenHeightCoefficient: screenHeightCoefficient,),
                ReleatedItem(imagePath: "images/peppers.png", imageName: d.pepperText,screenWidthCoefficient: screenWidthCoefficient,screenHeightCoefficient: screenHeightCoefficient,),
                ReleatedItem(imagePath: "images/potatoes.png", imageName: d.potatoesText,screenWidthCoefficient: screenWidthCoefficient,screenHeightCoefficient: screenHeightCoefficient,),
                ReleatedItem(imagePath: "images/tomatoes.png", imageName: d.tomatoesText,screenWidthCoefficient: screenWidthCoefficient,screenHeightCoefficient: screenHeightCoefficient,),
              ],
            ),
            SizedBox(width: 400*screenWidthCoefficient,height: 50*screenHeightCoefficient,
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  backgroundColor: greenColor,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                ),
                child: Text(d.addToCartText,style: TextStyle(color: Colors.white,fontSize: 22*(screenWidthCoefficient+screenHeightCoefficient)/2,fontFamily: "Oswald-Medium"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReleatedItem extends StatelessWidget {
  String imagePath;
  String imageName;
  double screenWidthCoefficient;
  double screenHeightCoefficient;
  ReleatedItem({required this.imagePath,required this.imageName,required this.screenWidthCoefficient,required this.screenHeightCoefficient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0*(screenWidthCoefficient+screenHeightCoefficient)/2),
      child: TextButton(onPressed: (){},
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath,width: 45*screenWidthCoefficient,height: 45*screenHeightCoefficient,),
              Text(imageName,style: TextStyle(color: Colors.black,fontSize: 15*(screenWidthCoefficient+screenHeightCoefficient)/2,fontFamily: "Oswald-ExtraLight"),),
            ],
          )
      ),
    );
  }
}

