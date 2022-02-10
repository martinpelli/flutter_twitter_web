import 'package:fluro/fluro.dart';
import 'package:flutter_twitter_web/ui/views/not_found_view.dart';

class NotFoundViewHandlers {
  static Handler notFoundView = Handler(handlerFunc: (context, params) {
    return NotFoundView();
  });
}
