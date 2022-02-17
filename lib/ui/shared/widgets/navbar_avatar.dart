import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
          'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/attachments/delivery/asset/3eb2e5fc93d7ae5be32fc69270750b8c-1611647443/Default%20Avatar%20v2/make-your-ideas-videos-and-gif-come-true.gif',
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
