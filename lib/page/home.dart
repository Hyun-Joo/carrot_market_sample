import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> data = [];
  late String currentLocation;
  final Map<String, String> locationTypeToString = {
    "gaepo": "개포동",
    "ora": "오라동",
    "donam": "도남동"
  };

  @override
  void initState() {
    super.initState();
    currentLocation = "gaepo";

    data = [
      {
        "cid": "1",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      }
    ];
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceStr){
    return "${oCcy.format(int.parse(priceStr))}원";
  }

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      title: GestureDetector(
          onTap: (){
            print("click");
          },
          onLongPress: (){
            print("long pressed!");
          },
          child: PopupMenuButton<String>(
            offset: Offset(0, 35),
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1),
            onSelected: (String where){
              print(where);
              setState(() {
                currentLocation = where;
              });
            },
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(value: "gaepo", child: Text("개포동"),),
                PopupMenuItem(value: "ora", child: Text("오라동"),),
                PopupMenuItem(value: "donam", child: Text("도남동"),),
              ];
            },
            child: Row(
                children: [
                  Text(locationTypeToString[currentLocation]!),
                  Icon(Icons.arrow_drop_down)
                ]
            ),
          )
      ),
      // 밑 그림자 제거용
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/svg/bell.svg", width: 22,)),
      ],
    );
  }

  Widget _bodyWidget(){
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Image.asset(data[index]["image"]!, width: 100, height: 100,)
              ),
              //SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          data[index]["title"]!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15)
                      ),
                      SizedBox(height: 5),
                      Text(
                          data[index]["location"]!,
                          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3))
                      ),
                      SizedBox(height: 5),
                      Text(
                          calcStringToWon(data[index]["price"]!),
                          style: TextStyle(fontWeight: FontWeight.w500)
                      ),
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/svg/heart_off.svg", width: 13, height: 13,),
                                SizedBox(width: 5),
                                Text(data[index]["likes"]!)
                              ]
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext _context, int index){
        return Container(height: 1, color: Colors.black.withOpacity(0.4));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }

}
