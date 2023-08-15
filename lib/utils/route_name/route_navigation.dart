import 'package:camera_gallery_assignment/pages/edit_profile.dart';
import 'package:camera_gallery_assignment/utils/route_name/route_name.dart';
import 'package:flutter/material.dart';

import '../../pages/homepage.dart';

class NavigateRoute
{
  static Route<dynamic> onGenerate(RouteSettings settings)
  {
    switch(settings.name)
    {
      case RouteName.HOMEPAGE:
        return MaterialPageRoute(builder: (context)=> const MyHomePage(title: 'Flutter Camera Gallery Permission'));
      case RouteName.PROFILE_EDIT_PAGE:
        return MaterialPageRoute(builder: (context)=> const EditProfile());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("NO route", textAlign: TextAlign.center,),
          ),
        )
      );
    }
  }
}