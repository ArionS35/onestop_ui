import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';
import 'package:onestop_ui/widget_demo/image_gallery.dart';
import 'package:onestop_ui/widget_demo/image_preview.dart';
import 'package:onestop_ui/widget_demo/image_selector.dart';
import 'package:onestop_ui/widget_demo/indicators_demo.dart';
import 'package:onestop_ui/widget_demo/buttons_demo.dart';
import 'package:onestop_ui/widget_demo/list_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize ThemeStore which will handle GetStorage initialization internally
  await ThemeStore().initTheme();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeStore themeStore;

  @override
  void initState() {
    super.initState();
    themeStore = ThemeStore();
    themeStore.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    themeStore.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final List<String> demoImages = [
      'https://picsum.photos/400/200?image=1',
      'https://picsum.photos/400/200?image=2',
      'https://picsum.photos/400/200?image=3',
    ];
    return MaterialApp(
      title: 'OneStop UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: themeStore.currentTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: OColor.green600,
          brightness: themeStore.currentTheme,
        ),
        scaffoldBackgroundColor: themeStore.backgroundColor,
      ),
      home: Scaffold(
        backgroundColor: themeStore.backgroundColor,
        appBar: AppBar(
          title: OText(text: 'OneStop UI Demo', style: OTextStyle.headingLarge),
          backgroundColor: themeStore.surfaceColor,
          foregroundColor: themeStore.textColor,
          actions: [
            IconButton(
              icon: Icon(
                themeStore.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: themeStore.iconColor,
              ),
              onPressed: () => themeStore.toggleTheme(),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: themeStore.backgroundColor,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OText(text: 'OneStop UI', style: OTextStyle.displayMedium),
                    OText(text: 'Hello, World!', style: OTextStyle.bodyLarge),
                    OText(text: 'Welcome to OneStop UI', style: OTextStyle.headingLarge),
                    OText(text: 'This is a sample text', style: OTextStyle.bodyMedium),
                    OText(text: 'Enjoy building your app!', style: OTextStyle.bodySmall),
                    SingleImageGallery(
                      imageUrl: 'https://picsum.photos/400/200?image=1',
                      previewType: ImagePreviewType.circle, // only used on click
                    ),
                    SizedBox(height: 20),
                    OnestopLargeImageGallery(
                      imageUrls: demoImages,
                      previewType: ImagePreviewType.square,
                    ),
                    Divider(),
                    OnestopMediumImageGallery(
                      imageUrls: demoImages,
                      previewType: ImagePreviewType.rectangle,
                    ),
                    OnestopMediumImageGallery(
                      imageUrls: demoImages,
                      previewType: ImagePreviewType.rectangle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          // SizedBox(width: 20,),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          // SizedBox(width: 20,),
                        ]
                    ),
                    SizedBox(height: 8,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          // SizedBox(width: 20,),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          ImageSelector(
                            imageUrl: 'https://picsum.photos/400/200?image=6',
                            // size: 40,
                          ),
                          // SizedBox(width: 20,),
                        ]
                    ),
                    Divider(),
                    // SingleImageGallery(
                    //   imageUrl: 'https://picsum.photos/400/200?image=1',
                    // ),
                    const SizedBox(height: 20),
                    ModalDemo(),
                    const SizedBox(height: 20),
                    CardsDemo(),
                    const SizedBox(height: 20),
                    TextfieldsDemo(),
                    IndicatorsDemo(),
                    const SizedBox(height: 10),
                    Divider(color: themeStore.borderColor),
                    const SizedBox(height: 10),
                    Text(
                      "Buttons Part",
                      style: TextStyle(fontSize: 25, color: themeStore.textColor),
                    ),
                    SizedBox(height: 25),
                    ButtonsDemo(),
                    const SizedBox(height: 10),
                    Divider(color: themeStore.borderColor),
                    const SizedBox(height: 10),
                    Text("List Demo", style: TextStyle(fontSize: 25, color: themeStore.textColor)),
                    SizedBox(height: 25),
                    ListDemo(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
