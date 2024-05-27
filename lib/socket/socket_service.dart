import 'package:peanut_app/utils/app_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void initializeSocket() {
    // Replace 'BASE_URL = 'http://192.168.1.15:3039/v1/api' 
      socket = IO.io(BASE_URL, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
    });
    socket.connect();
    // Handle connection
    socket.on('connect', (_) {
      print('connected to server');
    });

    // Handle disconnection
    socket.on('disconnect', (_) {
      print('disconnected from server');
    });

    // Handle custom event 'update'
    socket.on('update', (data) {
      print('Update received: $data');
      // Handle the received data
    });

    // Example function to emit data to the server
    void sendData(dynamic data) {
      socket.emit('new-data', data);
    }
  }
}
