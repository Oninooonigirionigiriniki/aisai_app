import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String image;
  final String place;
  final String date;

  // コンストラクタで引数を受け取る
  const EventDetailPage({
    super.key,
    required this.image,
    required this.place,
    required this.date,
  });

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage>
    with SingleTickerProviderStateMixin {
  bool _eventCompleted = false; // イベントが完了したかどうかを管理
  bool _showCheckMark = false; // チェックマークの表示管理
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // アニメーションの継続時間
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onUserSelected() {
    setState(() {
      _eventCompleted = true;
      _showCheckMark = true;
    });

    // アニメーションを開始し、終了後にチェックマークを非表示にする
    _animationController.forward(from: 0.0).then((_) {
      setState(() {
        _showCheckMark = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('イベント詳細'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // スクロール可能にする
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(widget.image),
                  const SizedBox(height: 16),
                  Text(
                    '開催場所: ${widget.place}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '開催日: ${widget.date}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '「沖縄全島エイサーまつり」は、毎年旧盆明けの最初の週末に行われる、1956年の「コザ市誕生」を機に「全島エイサーコンクール」としてスタートし、今では沖縄の夏の風物詩として日本を代表する「まつり」の一つとなりました。\n\n'
                    '「まつり」には本島各地から選抜された青年会などの団体や、全国の姉妹都市や協賛団体からのゲストが集結します。会場に鳴り響く三線、歌、太鼓のリズムに酔いしれ、その迫力あるバチさばきに感動しながら、本場のエイサーのだいご味を思う存分味わうことが出来る一大イベントです。\n\n'
                    'まつりは3日間に渡り、金曜日のまつり初日には、国道330号コザ・ゲート通りでの「みちじゅねー」、そして土曜日の中日が沖縄市青年団協議会による「沖縄市青年まつり」日曜日が「本祭」として、全島から集められた青年会による、エイサー大会が沖縄市コザ運動公園で開催されます。\n\n'
                    'また、運動公園サブグラウンドで同時開催される「ビアフェスト」との相乗効果で会場周辺では、夜遅くまで祭りの賑わいが続きます。',
                    style: TextStyle(fontSize: 16), // 文字サイズを調整
                    textAlign: TextAlign.justify, // テキストを左右に整列
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: _eventCompleted
                          ? null // イベント完了後はボタンの動作を無効化
                          : () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SelectUserDialog(
                                      onUserSelected: _onUserSelected);
                                },
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(double.infinity, 50), // ボタンを幅いっぱいにする
                      ),
                      child: Text(_eventCompleted ? 'イベント完了' : 'イベントへGO'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // チェックマークをフェードイン・フェードアウトする
          if (_showCheckMark)
            Center(
              child: FadeTransition(
                opacity: _animationController,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SelectUserDialog extends StatefulWidget {
  final VoidCallback onUserSelected; // ユーザーが選択された時のコールバック

  const SelectUserDialog({super.key, required this.onUserSelected});

  @override
  _SelectUserDialogState createState() => _SelectUserDialogState();
}

class _SelectUserDialogState extends State<SelectUserDialog> {
  int? _selectedUserIndex; // 選択されたユーザーのインデックス

  // 仮のユーザーデータ
  final List<Map<String, String>> users = [
    {'name': '津田　梅子', 'icon': 'assets/image/us4.jpg'},
    {'name': '山田 花子', 'icon': 'assets/image/us2.jpg'},
    {'name': '金城　里琴', 'icon': 'assets/image/us6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.5), // ダイアログの背景を半透明に設定
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '参加するユーザーを選択',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true, // リストビューが親のサイズに合わせる
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(users[index]['icon']!),
                  ),
                  title: Text(
                    users[index]['name']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: _selectedUserIndex == index
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedUserIndex = index; // ユーザーを選択
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedUserIndex != null
                  ? () {
                      Navigator.pop(context); // ダイアログを閉じる
                      widget.onUserSelected(); // 選択コールバックを呼び出す
                    }
                  : null, // ユーザーが選択されていない場合は無効
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: const Text('選択する'),
            ),
          ],
        ),
      ),
    );
  }
}
