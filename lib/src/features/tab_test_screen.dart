import 'package:chat_app_demo/src/core/utils/assets_image.dart';
import 'package:flutter/material.dart';

class TabTestScreen extends StatefulWidget {
  @override
  _TabTestScreenState createState() => _TabTestScreenState();
}

class _TabTestScreenState extends State<TabTestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);


    _tabController.addListener(() {
      setState(() {});
    });

    _tabController.animation?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom TabBar with Images'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Container(
                height: 2,width: 15,
              ),
              Container(height: 2,width: 15,),
              Container(height: 2,width: 15,),
              Container(height: 2,width: 15,),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TabBar(
                  controller: _tabController,
                  // padding: EdgeInsets.zero,
                  // physics: const ScrollPhysics(),
                  // labelPadding: EdgeInsets.zero,
                  // automaticIndicatorColorAdjustment: true,
                 // tabAlignment: TabAlignment.fill,
                  //splashBorderRadius: BorderRadius.circular(20),
                  tabs: [

                    _buildTabItem(0, AssetsImage.boyAvatarImage),
                    _buildTabItem(1, AssetsImage.chatIcon),
                    _buildTabItem(2, AssetsImage.girlAvatarImage),
                    _buildTabItem(3, AssetsImage.girlAvatarImage),
                  ],
                  //indicatorWeight: 4.0,
                  onTap: (index) {
                    setState(() {});
                  },
                ),
              ),
             // Positioned(
             //
             //    left: MediaQuery.of(context).size.width * (_tabController.index / 4) +
             //        (MediaQuery.of(context).size.width / 6) - 25,
             //    top: 0,
             //    child: Container(
             //      width: 50,
             //      height: 4,
             //      color: Colors.blue,
             //    ),
             //  ),



              // Positioned(
              //
              //   left: 0,
              //   top: 0,
              //   child: TabBar(
              //     controller: _tabController,
              //     tabs: [
              //       Container(
              //         height: 10,width: 2,
              //       ),
              //       Container(height: 10,width: 2,),
              //       Container(height: 10,width: 2,),
              //       Container(height: 10,width: 2,),
              //     ],
              //   )
              // ),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const Center(child: Text('Content 1')),
                const Center(child: Text('Content 2')),
                const Center(child: Text('Content 3')),
                const Center(child: Text('Content 4')),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTabItem(int index, String imagePath) {
    bool isSelected = _tabController.index == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // height: isSelected ? 80 : 60,
      // width: isSelected ? 80 : 60,
      child: Column(
        children: [
          Image.asset(imagePath,fit: BoxFit.cover,
            height: isSelected ? 80 : 60,
            width: isSelected ? 80 : 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
