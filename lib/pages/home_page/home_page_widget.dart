import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.AirbusDictionaryApp(
                    width: double.infinity,
                    height: double.infinity,
                    image1Url:
                        'https://github.com/osamanabel1999/App-assets/blob/main/pexels-berke-bayar-249159920-17643130.jpeg?raw=true',
                    image2Url:
                        'https://github.com/osamanabel1999/App-assets/blob/main/pexels-peter-xie-371876898-37616785.jpeg?raw=true',
                    onTermsClick: () async {
                      await launchURL(
                          'https://doc-hosting.flycricket.io/airbus-dictionary-terms-of-use/cefa4281-40fd-4c4a-a17c-8858c857adc7/terms');
                    },
                    onPrivacyClick: () async {
                      await launchURL(
                          'https://doc-hosting.flycricket.io/airbus-dictionary-privacy-policy/729f99c6-3572-4775-b6bf-8786c3a38073/privacy');
                    },
                  ),
                ),
              ),
              FlutterFlowAdBanner(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                showsTestAd: false,
                iOSAdUnitID: 'ca-app-pub-7880697829268273/1203860867',
                androidAdUnitID: 'ca-app-pub-7880697829268273/3032053056',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
