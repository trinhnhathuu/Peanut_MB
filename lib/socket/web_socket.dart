// lib/websocket_service.dart
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:peanut_app/utils/app_constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketService {
  late WebSocketChannel _channel;

  // Hàm khởi tạo nhận vào URL của WebSocket server
  // Replace 'WS_URL = 'ws://192.168.1.15:3039/v1/api'
  void initializeSocket({String url = BASE_URL}) {
    print('aloooooooooooooooo 111111');

    //  final Map<String, dynamic> headers = {
    //   'x-api-key': '761b3272de8b74357a603060ac4100b593f2debd4daf6064aa1605a0b6fbf83532473d5390f0aa6cad1b5211852b8d61e9670744f3f3e1ebc4b8707da86a82f6'
    //   // Thêm các header khác nếu cần
    // };
        _channel = IOWebSocketChannel.connect(url);
    // Lắng nghe tin nhắn từ server
    _channel.stream.listen((message) {
      print('aloooooooooooooooo');
      print('Received: $message');
      sendMessage('Hello from Flutter client');
      sendNewData('Acknowledged: $message');
    });
  }

  // Gửi tin nhắn tới server
  void sendMessage(String message) {
    if (_channel != null) {
      _channel.sink.add(message);
      print('Sent message: $message');
    }
  }

  void sendNewData(String newData) {
  if (_channel != null) {
    _channel.sink.add(newData);
    print('Sent new data: $newData'); // In ra dữ liệu mới đã gửi
  }
}

  // Đóng kết nối WebSocket
  void dispose() {
    _channel.sink.close();
    print('colsed');
  }
}

