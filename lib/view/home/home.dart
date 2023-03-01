import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media/res/color.dart';
import 'package:social_media/res/widgets/google_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/view/tabs/activity_feed_screen.dart';
import 'package:social_media/view/tabs/profile_screen.dart';
import 'package:social_media/view/tabs/search_screen.dart';
import 'package:social_media/view/tabs/time_line_screen.dart';
import 'package:social_media/view/tabs/upload_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home-screen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool _isAuth = false;
  GoogleSignIn googleSignIn = GoogleSignIn();
  PageController? _pageController;
  int pageIndex = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account!);
    }, onError: (err) {
      ('Error signing in: $err');
      setState(() {
        _isAuth = false;
      });
    });

    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account!);
    }).catchError((err) {
      ('Error signing in: $err');
      setState(() {
        _isAuth = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  signIn() {
    googleSignIn.signIn();
  }

  signOut() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex) {
    // setState(() {
    //   this._pageController = PageController(initialPage: pageIndex);
    // });
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int index) {
    // _pageController!.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    // );
    _pageController?.jumpToPage(index);
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      ('User signed in!: $account');
      setState(() {
        _isAuth = true;
      });
    } else {
      ('User signed out!');
      setState(() {
        _isAuth = false;
      });
    }
  }

  buildAuthScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Screen"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: AppColors.secondaryColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(500),
            bottomRight: Radius.circular(500),
          ),
          gradient: const RadialGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GoogleSigninButton(
                onTap: signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildUnAuthScreen() {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        padEnds: true,
        pageSnapping: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          UploadScreen(),
          SearchScreen(),
          ActivityFeedScreen(),
          TimelineScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Theme.of(context).primaryColor,
        currentIndex: pageIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot, size: 50.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isAuth ? buildUnAuthScreen() : buildAuthScreen(context);
  }
}
