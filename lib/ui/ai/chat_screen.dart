import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_scan/ui/ai/widgets/chat_loading_widget.dart';
import 'package:i_scan/ui/ai/widgets/message_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../providers/ai_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants/color_constants.dart';

class ChatAiScreen extends StatefulWidget {
  final String message;
  const ChatAiScreen({Key? key, required this.message}) : super(key: key);

  @override
  State<ChatAiScreen> createState() => _ChatAiScreenState();
}

class _ChatAiScreenState extends State<ChatAiScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AiProvider>(context, listen: false).chatAi(widget.message);
    });
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AiProvider>(
      builder: (context, aiProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            aiProvider.clearMessages();
            return false;
          },
          child: Scaffold(
            body: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Hash A.I",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                centerTitle: true,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: TabBar(
                      controller: controller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.6),
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icon/wand.svg"),
                              const SizedBox(width: 5),
                              const Text('Hash Fast'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/flash_icon.svg",
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              const Text('Hash Turbo'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    aiProvider.clearMessages();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                backgroundColor: ColorManager.grey90,
              ),
              backgroundColor: grey100,
              body: ListView.separated(
                itemCount: aiProvider.messages.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 28,
                ),
                shrinkWrap: true,
                reverse: true,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (_, i) {
                  Map message = aiProvider.messages.reversed.toList()[i];
                  return Column(
                    children: [
                      MessageWidget(
                        message: message['message'],
                        isUser: message['isUser'],
                        redo: () {
                          aiProvider.chatAi(message['message']);
                        },
                      ),
                      if (aiProvider.isChatting && i == 0)
                        const ChatLoadingWidget(),
                    ],
                  );
                },
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 40,
                  top: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Ask Hash A.I a question',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icon/scan.svg"),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xff1B9754),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xff1B9754),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        if (_controller.text.trim().isNotEmpty) {
                          aiProvider.chatAi(_controller.text.trim());
                          _controller.clear();
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xff1B9754),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Icon(
                          _controller.text.trim().isNotEmpty
                              ? Iconsax.send_1
                              : Icons.mic,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
