import 'package:peanut_app/utils/app_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  static final SocketService _singleton = SocketService._internal();

  factory SocketService() {
    return _singleton;
  }

  SocketService._internal() {
    print('aoiuoiuiu');
    initializeSocket();
  }

  void initializeSocket() {
    // Replace 'BASE_URL = 'w://192.168.1.15:3039/v1/api'
      socket = IO.io('ws://192.168.1.15:3039', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,

    });
  // Xử lý kết nối
  socket.on('connect', (_) {
    print('connected to server');
    socket.emit("salutations", "Hello!" );
  });

  // Xử lý ngắt kết nối
  socket.on('disconnect', (_) {
    print('disconnected from server');
  });

  // Xử lý lỗi kết nối
  socket.on('connect_error', (error) {
    print('Connection Error: $error');
  });

  socket.on('connect_timeout', (_) {
    print('Connection Timeout');
  });

  socket.on('error', (error) {
    print('Error: $error');
  });
  // Xử lý sự kiện tùy chỉnh 'update'
  socket.on('update', (data) {
    print('Update received: $data');
    // Xử lý dữ liệu nhận được
  });

  // Ví dụ hàm để gửi dữ liệu tới server
  Future.delayed(Duration(seconds: 2), () {
    socket.emit('new-data', 'Hello from Flutter!');
  });

  // Kết nối socket
  socket.connect();
   socket.on('new-data', (data) {
    print('alooo: $data');
    // Xử lý dữ liệu nhận được
  });
  }

  void sendData(String event, dynamic data) {
    socket.emit(event, data);
  }

  void closeConnection() {
    socket.disconnect();
  }
}
