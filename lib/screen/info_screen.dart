import 'package:flutter/material.dart';
import 'package:how_to_draw/constant.dart';
import 'package:how_to_draw/custom_back_button.dart';
import 'package:how_to_draw/custom_clickable_container.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(28, 16, 28, 16),
        children: <Widget>[
          Text(
            'Hello !',
            style: textTheme.display1
                .copyWith(fontSize: 22.0, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 24),
          Text(
              'Hope you enjoy the characters & thanks for downloading the app.'),
          SizedBox(height: 16),
          Text('We will keep updating new drawing every month. '),
          SizedBox(height: 16),
          Text(
              'Turn on your notification to get notified when new images is updated.'),
          SizedBox(height: 32),
          Divider(
            thickness: 1,
            color: Colors.black87,
            endIndent: width * 0.5,
          ),
          SizedBox(height: 32),
          CustomClickableContainer(
            onTap: _openInstagramLink,
            margin: EdgeInsets.only(bottom: 32.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Artist'.toUpperCase(), style: textTheme.caption),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Icon(LineIcons.instagram),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Anime',
                        style: textTheme.subhead.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.external_link,
                      size: 18.0,
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomClickableContainer(
            onTap: _composeEmail,
            margin: EdgeInsets.only(bottom: 32.0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Developer'.toUpperCase(), style: textTheme.caption),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Icon(LineIcons.envelope_o),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        kDeveloperEmail,
                        style: textTheme.subhead.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      LineIcons.external_link,
                      size: 18.0,
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomClickableContainer(
            onTap: () => _rateApp(context),
            margin: EdgeInsets.only(bottom: 32.0),
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(LineIcons.star_o),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Rate this App'.toUpperCase(),
                    style: textTheme.caption.copyWith(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          CustomClickableContainer(
            onTap: _openFacebookLink,
            margin: EdgeInsets.only(bottom: 32.0),
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Icon(LineIcons.thumbs_o_up),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Like us on Facebook'.toUpperCase(),
                    style: textTheme.caption.copyWith(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _rateApp(BuildContext context) {
    final snackBar = SnackBar(content: Text('Launching, hold on.'));
    scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

    LaunchReview.launch(androidAppId: "com.instagram.android");
  }

  void _openInstagramLink() async {
    if (await canLaunch(kInstagramUrl)) {
      await launch(kInstagramUrl);
    } else {
      final snackBar =
          SnackBar(content: Text('Unable to launch URL during this time'));
      scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  void _openFacebookLink() async {
    if (await canLaunch(kFacebookUrl)) {
      await launch(kFacebookUrl);
    } else {
      final snackBar =
          SnackBar(content: Text('Unable to launch URL during this time'));
      scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  void _composeEmail() async {
    final url = 'mailto:$kDeveloperEmail?subject=$kEmailSubject';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final snackBar =
          SnackBar(content: Text('Unable to compose Email during this time'));
      scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
