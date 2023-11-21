import 'package:flutter/material.dart';

import '../../../model/task_model.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/data.dart';
import '../chat_screen.dart';
import '../widgets/social_media_widget.dart';

class AiTasksTab extends StatefulWidget {
  const AiTasksTab({super.key});

  @override
  State<AiTasksTab> createState() => _AiTasksTabState();
}

class _AiTasksTabState extends State<AiTasksTab> {
  String selectedCategory = 'All';
  List<String> categories = [
    'All',
    ...tasksForAiList.keys.toList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (ctx, int index) {
              return const SizedBox(width: 8);
            },
            itemBuilder: (ctx, int index) {
              bool isSelected = categories[index] == selectedCategory;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = categories[index];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    color: isSelected ? Colors.white : const Color(0x19EEF5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        const SocialMediaWidget(),
        const SizedBox(height: 16),
        ListView.separated(
          itemCount: selectedCategory == "All" ? tasksForAiList.length : 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, int index) {
            return const SizedBox(height: 8);
          },
          itemBuilder: (_, int index) {
            String key = selectedCategory == "All"
                ? tasksForAiList.keys.toList()[index]
                : selectedCategory;
            List<TaskModel> tasks = tasksForAiList[key]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: tasks.length,
                  itemBuilder: (ctx, i) {
                    return TaskWidget(task: tasks[i]);
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatAiScreen(message: task.description),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.black.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  task.image == "image"
                      ? "assets/images/robot.png"
                      : task.image,
                  width: 16,
                  height: 16,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0x19EEF5FF),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.bookmark_border,
                    color: ColorManager.grey90,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              task.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              task.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
