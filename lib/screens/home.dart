import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_app_clone/constants.dart';

class TaskItem {
  const TaskItem({
    this.title,
    this.color,
    this.description,
    this.icon,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String description;
}

const taskItems = [
  const TaskItem(
    title: 'Task',
    description: '5 tasks now',
    color: kSecondaryRed,
    icon: Icons.timer,
  ),
  const TaskItem(
    title: 'Group',
    description: '8 tasks now',
    color: kPrimaryYellow,
    icon: Icons.blur_circular,
  ),
  const TaskItem(
    title: 'Done',
    description: '22 tasks completed',
    color: kSecondaryBlue,
    icon: Icons.check,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryGrey,
      body: Column(
        children: [
          _Header(),
          _MyTasks(),
          _InTheWorks(),
        ],
      ),
    );
  }
}

class _InTheWorks extends StatelessWidget {
  const _InTheWorks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10.0),
            child: Text(
              'In the works',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: 8,
              crossAxisCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(2, index.isEven ? 2 : 1);
              },
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyTasks extends StatelessWidget {
  const _MyTasks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TasksActionBar(),
        Column(
          children: [
            for (var item in taskItems)
              ListTile(
                title: Text(
                  item.title,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  item.description,
                  style: TextStyle(color: Colors.grey),
                ),
                leading: CircleAvatar(
                  backgroundColor: item.color,
                  child: Icon(item.icon, color: Colors.white),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _TasksActionBar extends StatelessWidget {
  const _TasksActionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My tasks',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: kPrimaryYellow,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset('assets/avatars/1.png'),
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your name here',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('Tap here to change pic'),
            ],
          )
        ],
      ),
    );
  }
}
