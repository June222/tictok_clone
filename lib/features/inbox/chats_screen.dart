import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone/features/inbox/chat_detail_screen.dart';

import '../../constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>(); // 4. AnimatedList는 state의 정보를 담은 key가 필요함.

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) { // 7. null 체크
      _key.currentState!.insertItem(_items.length); // 8. 다음과 같은 방식으로 animation list에 추가  
      _items.add(_items.length); // 9. 끝에 추가
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem( // 10. AnimatedList에서 Widget 지우기
          index, (context, animation) => _chatTile(animation, index)); 
      _items.removeAt(index); // 11. list에서도 지워주기
    }
  }

  FadeTransition _chatTile(Animation<double> animation, int index) {
    return FadeTransition(
      opacity: animation,
      child: ListTile( 
        key: UniqueKey(), // 3. 같은 위젯을 계속 만드므로, key를 부여하여 flutter가 개별적으로 인식 가능하게 함
        onLongPress: () => _deleteItem(index),
        onTap: _onChatTap, 
        leading: const CircleAvatar(
          radius: 30,
          foregroundImage: NetworkImage(
              "https://d1telmomo28umc.cloudfront.net/media/public/avatars/June222-avatar.jpg"),
          child: Text("준우"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "친구 ${_items.length - index + 1}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "2:56 PM",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: Sizes.size12,
              ),
            ),
          ],
        ),
        subtitle: const Text("Don't forget it"),
      ),
    );
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct message"),
        actions: [
          IconButton(
            onPressed: _addItem, // 6. item 추가 => line 21
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: AnimatedList( // 1. ListView와 동일한 기능을 가지나 생성 및 삭제시에 애니메이션추가
        key: _key, // 5. key를 부여 => line 87
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (context, index, animation) { // Widget의 index, Animation<double>의 애니메이션 제공
          return _chatTile(animation, index); // 2. Build 할 Widget => line 38
        },
      ),
    );
  }
}
