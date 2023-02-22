import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medm/components/carousel_indicator.dart';
import 'package:medm/components/drawer.dart';
import 'package:medm/utils/locator.dart';
import 'package:medm/utils/size_config.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GeolocatorService geoService = GeolocatorService();

  @override
  void initState() {
    super.initState();
    fetchNews();
    requestPermission();
  }

  Future<http.Response> fetchNews() {
    debugPrint(http
        .get(Uri.parse('https://newsapi.org/s/india-health-news-api'))
        .toString());
    return http.get(Uri.parse('https://newsapi.org/s/india-health-news-api'));
  }

  void requestPermission() async {
    //  await Geolocator.requestPermission();
    geoService.getCurrentLocation().listen((position) {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 215, 9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // const Color.fromARGB(255, 177, 215, 9),
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(15),
              top: getProportionateScreenHeight(10)),
          child: Text(
            "medme",
            style: TextStyle(
                fontSize: getProportionateScreenHeight(18),
                color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
            child: const CircleAvatar(),
          )
        ],
      ),
      drawer: const homescreec_drawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.73,
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              )),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 215, 9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 215, 9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 215, 9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: getProportionateScreenHeight(320),
                  enlargeCenterPage: true,
                  //  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicators(3, 0)),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  const Text("Our Services"),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(8),
                    bottom: getProportionateScreenHeight(8),
                    left: getProportionateScreenWidth(15),
                    right: getProportionateScreenWidth(15)),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: getProportionateScreenHeight(1.2),
                      crossAxisSpacing: getProportionateScreenWidth(45),
                      mainAxisSpacing: getProportionateScreenHeight(30)),
                  children: [
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 177, 215, 9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
