/*import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VlcVideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VlcVideoPlayerWidget> createState() => _VlcVideoPlayerWidgetState();
}

class _VlcVideoPlayerWidgetState extends State<VlcVideoPlayerWidget> {
  late VlcPlayerController _vlcController;

  @override
  void initState() {
    super.initState();
    _vlcController = VlcPlayerController.network(widget.videoUrl, hwAcc: HwAcc.full);
  }

  @override
  void dispose() {
    _vlcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VlcPlayer(
      controller: _vlcController,
      aspectRatio: 16 / 9,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }
}
*/