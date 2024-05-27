// lib/websocket_service.dart
import 'package:peanut_app/utils/app_constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class SocketService {
  late WebSocketChannel _channel;

  // Hàm khởi tạo nhận vào URL của WebSocket server
  void initializeSocket({String url = WS_URL}) {
    _channel = IOWebSocketChannel.connect(url);

    // Lắng nghe tin nhắn từ server
    _channel.stream.listen((message) {
      _channel.sink.add('received!');
      _channel.sink.close(status.goingAway);
      print('Received: $message');
      // Xử lý tin nhắn nhận được
      // Ví dụ: Bạn có thể cập nhật trạng thái hoặc gọi callback tại đây
    });
  }

  // Gửi tin nhắn tới server
  void sendMessage(String message) {
    if (_channel != null) {
      _channel.sink.add(message);
    }
  }

  // Đóng kết nối WebSocket
  void dispose() {
    _channel.sink.close();
  }
}
