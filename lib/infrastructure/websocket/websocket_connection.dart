import 'dart:async';

import 'package:front/infrastructure/auth/value_objects/access_token.dart';
import 'package:front/infrastructure/websocket/config/websocket_config.dart';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

final logger = Logger();

abstract class WebsocketConnection<T> {
  final WebsocketConfig config;
  final AccessToken accessToken;
  late WebSocketChannel _channel;
  late StreamSubscription _subscription;
  Timer? _heartbeat;
  void Function()? onConnectionLost;
  bool _closing = false;

  final pathname = '';
  final heartbeatTimer = 10;
  final _controller = StreamController<T>.broadcast();

  WebSocketChannel get channel => _channel;

  messageHandler(List<int> message) {
    logger.i('Received: $message');
    try {
      // final resp = T.fromBuffer(message);
      // safeAdd(resp.data);
    } catch (e) {
      logger.e('Failed to parse: $e');
    }
  }

  void safeAdd(T data) {
    if (!_controller.isClosed) {
      try {
        _controller.add(data);
        // logger.i("Battle added safely");
      } catch (e, st) {
        logger.e("safeAdd failed: $e\n$st");
      }
    }
  }

  getWsUri() {
    return Uri.parse(
      'ws://${config.host}:${config.port}/$pathname?token=${accessToken.value}',
    );
  }

  connect() {
    final uri = getWsUri();
    // logger.i('Connecting to $uri');
    _channel = WebSocketChannel.connect(uri);

    _subscription = _channel.stream.listen(
      (message) => messageHandler(message),
      onError: (error) {
        logger.e('WebSocket error: $error');
      },
      onDone: () {
        logger.w('WebSocket closed');
        if (!_closing) {
          onConnectionLost?.call();
        }
      },
    );

    _heartbeat = Timer.periodic(
      Duration(seconds: heartbeatTimer),
      (_) => ping(),
    );
  }

  WebsocketConnection(this.config, this.accessToken) {
    connect();

    // _controller.stream.listen(
    //   (data) {
    //     // logger.i("Controller event: data = $data");
    //   },
    //   onError: (err, st) {
    //     logger.e("Controller event: error = $err\n$st");
    //   },
    //   onDone: () {
    //     logger.w("Controller event: stream DONE (closed)");
    //   },
    //   cancelOnError: false,
    // );
  }

  Stream<T> get messages => _controller.stream;

  void send(T message) {
    // logger.i('Sending: $message');
    _channel.sink.add(message);
  }

  void ping() {
    // final req = BattleRequest()..ping = Empty();
    // _channel.sink.add(req.writeToBuffer());
  }

  Future<void> close() async {
    _closing = true;

    // logger.i('WebSocket is going to close');
    _heartbeat?.cancel();
    await _subscription.cancel();
    await _channel.sink.close(status.normalClosure);
    await _controller.close();
    logger.i('WebSocket connection closed');
  }
}
