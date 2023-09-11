import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/atoms/atoms.dart';
import '../../../../themes/themes.dart';
import '../../widget/home_bg_section.dart';

class HomeTentang extends StatefulWidget {
  @override
  _HomeTentangState createState() => _HomeTentangState();
}

class _HomeTentangState extends State<HomeTentang>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: true);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeAbout(
      animationController: _animationController,
    );
  }
}

class HomeAbout extends StatelessWidget {
  final AnimationController animationController;

  HomeAbout({required this.animationController});
  late final Animation<double> _animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    return HomeBgSection(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MySizedBox.normalVertical(),
            FadeTransition(
              opacity: _animation,
              child: Text(
                'TENTANG TEMAN BUMIL ',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: MyColor.blueHome),
                textAlign: TextAlign.center,
              ),
            ),
            MySizedBox.normalVertical(),
            Text(
              'Teman Bumil hadir untuk Mums dengan berbagai fitur',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            MySizedBox.largeVertical(),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySizedBox.bloodyLargeVertical(),
                      Image.asset(
                        MyAsset.background.ic1,
                        width: 150,
                        height: 150,
                      ),
                      MySizedBox.normalVertical(),
                      Text(
                        'Program Hamil',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      MySizedBox.normalVertical(),
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: Text(
                          'sedang berusaha memiliki momongan? Anda akan terbantu dengan fitur ini!',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      MySizedBox.bloodyLargeVertical(),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySizedBox.bloodyLargeVertical(),
                    Image.asset(
                      MyAsset.background.ic2,
                      width: 150,
                      height: 150,
                    ),
                    MySizedBox.normalVertical(),
                    Text(
                      'Kehamilan',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    MySizedBox.normalVertical(),
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: Text(
                        'Kehamilan Mums jadi lebih menyenangkan dengan berbagai fitur menarik!',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MySizedBox.bloodyLargeVertical(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySizedBox.bloodyLargeVertical(),
                    Image.asset(
                      MyAsset.background.ic3,
                      width: 150,
                      height: 150,
                    ),
                    MySizedBox.normalVertical(),
                    Text(
                      'Tumbuh Kembang Anak',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    MySizedBox.normalVertical(),
                    SizedBox(
                      height: 40,
                      width: 280,
                      child: Text(
                        'Memantau tumbuh-kembang si Kecil sangat penting untuk memaksimalkan 1000 hari pertamanya.',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MySizedBox.bloodyLargeVertical(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
