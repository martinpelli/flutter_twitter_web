import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/providers/sidemenu_provider.dart';
import 'package:flutter_twitter_web/ui/views/not_found_view.dart';
import 'package:provider/provider.dart';

class NotFoundViewHandlers {
  static Handler notFoundView = Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');
    return NotFoundView();
  });
}
