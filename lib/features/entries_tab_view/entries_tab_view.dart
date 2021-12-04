import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntriesTabView extends StatelessWidget {
  const EntriesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.44,
        width: MediaQuery.of(context).size.width * .90,
        child: Column(
          children: [
            const TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              tabs: [
                Tab(text: 'Recents'),
                Tab(text: 'Favorites'),
                Tab(text: 'Varieties'),
                Tab(text: 'Origin'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: const TabBarView(
                children: [
                  Icon(Icons.recent_actors),
                  Icon(Icons.favorite),
                  Icon(Icons.search),
                  Icon(Icons.crop_original),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
