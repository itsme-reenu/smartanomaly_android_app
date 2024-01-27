import 'package:flutter/material.dart';
import 'package:smartanomaly_androidapp/UI/dashboard_page/dashboard_page.dart';
import 'package:smartanomaly_androidapp/UI/profile_page/profile_page.dart';
import 'package:smartanomaly_androidapp/logic/navigationservice.dart';
import 'package:watch_it/watch_it.dart';

class HomePage extends StatelessWidget with WatchItMixin {
  static final PageController _pageController = PageController(initialPage: 1);

  HomePage({super.key});

  GetIt locator = GetIt.instance;

  void _onPageChanged(int index) {
    locator.get<NavigationService>().setCurrentPageIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    String page1Title = "Dashboard";
    String page2Title = "PRODUCTS";
    String page3Title = "CLIENTS";
    String page4Title = "CART";

    int currentPageIndex =
        watchValue((NavigationService x) => x.currentPageIndex);
    // _pageController.jumpToPage(currentPageIndex);
    registerHandler(
        select: (NavigationService x) => x.currentPageIndex,
        handler: (context, value, cancel) => _pageController.jumpToPage(value));
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(kToolbarHeight), // Set the AppBar height
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // AppBar background color
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.scrim, // Shadow color
                  blurRadius: 10.0, // Shadow blur radius
                  spreadRadius: 1.0, // Shadow spread radius
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: AppBar(
              leading: const Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, right: 8, left: 8),
                child: Image(
                  image: AssetImage("assets/images/secure_icon.png"),
                  height: 15,
                  width: 30,
                ),
              ),
              leadingWidth: 100,
              title: Text(
                currentPageIndex == 0
                    ? page1Title
                    : currentPageIndex == 1
                        ? page2Title
                        : currentPageIndex == 2
                            ? page3Title
                            : page4Title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.33,
                  fontFamily: 'Open Sans',
                ),
              ),
              centerTitle: true,
              actions: [
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),

                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFFFC491), // Hex color code for the container
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Image.asset(
                        "asset/USER.png",
                        color: Theme.of(context).colorScheme.background,
                        height: 20,
                      ),

                      // child: Image.asset(
                      //   "asset/USER.png",
                      //   color: Theme.of(context).colorScheme.onBackground,
                      //   height: 20,
                      // ),
                    ),
                  ),
                )
              ],
            ),
          )),
      endDrawer: ProfilePage(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          DashboardPage(),
          // const ProductsPage(),
          // ClientsPage(),
          // CartPage()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .scrim, // This ensures the container itself is transparent
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            // Optional: if you want to add shadow
            BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,

              // backgroundColor: Theme.of(context)
              //     .colorScheme
              //     .onError, // Replace 'colorCode' with your desired hex color code

              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          top: 10), // Adjust the padding as needed
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            currentPageIndex == 0
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn,
                          ),
                          child: const Icon(
                            Icons.local_shipping,
                            size: 35,
                          )),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          top: 10), // Adjust the padding as needed
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          currentPageIndex == 1
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'asset/PRODUCTS.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          top: 10), // Adjust the padding as needed
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          currentPageIndex == 2
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'asset/CLIENTS.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          top: 10), // Adjust the padding as needed
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          currentPageIndex == 3
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          'asset/CART.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    label: ''),
                // add more items as needed
              ],
              currentIndex: currentPageIndex,
              onTap: (currentPageIndex) {
                _pageController.jumpToPage(currentPageIndex);
              }),
        ),
      ),
    );
  }
}
