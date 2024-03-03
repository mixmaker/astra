import 'package:astra/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 2), vsync: this, value: 0.5);
  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'premium-card',
        child: Material(
          type: MaterialType.transparency,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRect(
                      child: Image.asset(
                    'assets/icon/icon.png',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 40,
                  )),
                  const Logo(),
                  Text('Lifetime Premium',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comicNeue(
                          textStyle: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 200,
                      child: AnimationLimiter(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: AnimationConfiguration.toStaggeredList(
                              childAnimationBuilder: (widget) => SlideAnimation(
                                curve: Curves.easeOut,
                                horizontalOffset: 20,
                                duration: const Duration(milliseconds: 600),
                                child: FadeInAnimation(
                                  duration: const Duration(milliseconds: 1000),
                                  child: widget,
                                  // delay: Duration(milliseconds: 100),
                                ),
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.not_interested),
                                    Text(' An ad-free experience.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer
                                                    .withAlpha(200),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.download),
                                    Text(' Unlimited downloads.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer
                                                    .withAlpha(200),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.stadium_sharp),
                                    Text(' Access to exclusive collections.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer
                                                    .withAlpha(200),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.coffee),
                                    Text(' Support the developer.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer
                                                    .withAlpha(200),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  ScaleTransition(
                    scale: _animation,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Thank you for buying premium ♥️',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer
                                    .withAlpha(200),
                                fontSize: 14,
                              ))),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Go Premium',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer,
                                      fontSize: 16,
                                    ))),
                                Icon(
                                  Icons.workspace_premium_outlined,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                )
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
