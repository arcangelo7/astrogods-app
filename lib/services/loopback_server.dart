import 'dart:async';
import 'dart:io';

class LoopbackServer {
  HttpServer? _server;
  final String title;
  final String message;

  LoopbackServer({
    required this.title,
    required this.message,
  });

  Future<String> start() async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    return 'http://localhost:${_server!.port}/callback';
  }

  Future<void> waitForCallback() async {
    if (_server == null) {
      throw StateError('Server not started. Call start() first.');
    }

    final completer = Completer<void>();

    _server!.listen((request) async {
      if (request.uri.path == '/callback') {
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.html
          ..write(_getSuccessPage());
        await request.response.close();

        await _server?.close();
        _server = null;

        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });

    await completer.future;
  }

  Future<void> close() async {
    await _server?.close();
    _server = null;
  }

  String _getSuccessPage() {
    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>AstroGods</title>
  <link rel="icon" type="image/png" sizes="16x16" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAL9UExURQwuMQ4vNCJcTxhTQw0/OChhUA8pNQ88Og4pNhIuOx9MSRA9OgwxMg41NBA5OBI9OxNBPhVEQBVHQRZLQxVMQxZOQhdQQhlTRA0vMQ0yMxtVRhtVRgwwNA0xNBtXRxpXRg0xNR1ZSA4vNBxZSQwsNBtXRwkpMhpVRgkoMRpURwkqNBhSRQgnMxdORAklMRZLQwwnMxNIQA0mMxBCPQwlMg4pNRFAPQ9AOxArOA8rNxE9OxE+PA4qNhAtOA0uOAwuOAkrNgguNwgvOAkwOAwzOQ02Nw44Nw87OA41NRE6ORY8OR05MyI2LiM1LCE7MRxJPRtTRRpTRQ00NBg9Oi1CNiQsJB8gGxwaFxkWFRENDg4SFBoxKh5RQxtWRw41N1VeRzQxIxgZFxUbGiQvJic3LSEsJQkKECEZFyI6MRxXSB1YSQ4yNl5qU1JNOBkZFRksKRc/OxZHQRdMQhtOQRs3LxcYFx0kHx5TRBtZSSZAPZ6TayQjHRYoJxM9PBNBPxRGQRVKQhRNQhhQQx5GOigsJCQ/MxtXSFhjUq6fdRsfHBU3NxI9PBNBPhREQBVJQhZMQhVNQiRYSFRpTzA4LB5PQXt9ZcCvgyQrJxI3OhI7OxQ/PhRCQBVGQhZKQxVMQx1TRpikfVRcRiJGOHyAaePPnkJHOxAyNxA4OhI8PBJAPxNEQRRIQxVLQxpRRra5kI6TciJANF1mWffhrZWObxczNg81OxE6PBE+PhFBPxNGQRNIQixaTNXMnayshSRKPCo9P9C9jurXpmRvYA4yOQ41OxE7PRI+Pw9CPnGIb+jZqJqhfRdLQgwoNG9zX9fFl+DSpoiNdjFNShg+PxhBQCdMRGF2XdfPo9XKm2Z/ZxBFPwwnNBkyOouJbsy9ktXHm8O4jqCeepSUca6ofeTSntXHlpSZdiBNRQ9CPQ0qNhs1PHh9aMS4jNnImODRoufVouLOmrOnem55XSNMRBA/PQ4rNwwtOCxHRl5sXXeAamdzYDxSSiJBPhE5OQ86Of///x8GkC0AAABIdFJOUwAAAAAAAAAAAAAAADKOzOv5/v7568yOMlbf31Yy398yjo7MzOvr+fn+/v7++fnr68zMjo4y398yVt/fVjKOzOv5/v7568yOMpMJs+AAAAABYktHRP7SAMJTAAAAB3RJTUUH6gEJEBEqrye9yAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNi0wMS0wOVQxNjoxNzowOCswMDowMFmjBoEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjYtMDEtMDlUMTU6MTU6MTgrMDA6MDBdawJQAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI2LTAxLTA5VDE2OjE3OjQyKzAwOjAwX9HOVgAAARtJREFUGNMBEAHv/gAAAQwNDg8QERITFBUWFwIDAAQYGUhJSktMTU5PUFEaGwUAHB1SU1RVVldYWVpbXF0eHwAgXlNfYGFiY2RlZmdoaWohACJrbG1ub3BxcnN0dXZ3eCMAJHl6e3x9fn+AgYKDhIWGJQAmh4iJiouMjY6PkJGSk5QnACiVlpeYmZqbnJ2en6ChoikAKqOkpaanqKmqq6ytrq+wKwAssbKztLW2t7i5uru8vb4tAC6/wMHCw8TFxrjHyMnKyy8AMMzNzs/Q0dLT1NXW19jZMQAy2tvc3d7f4OHi4+Tl5uczADQ16Onq6+zt7u/w8fLzNjcABjg59PX29/j5+vv8/To7BwAICTw9Pj9AQUJDREVGRwoL8Et+j3V+iZAAAAAASUVORK5CYII=">
  <link rel="shortcut icon" type="image/png" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAL9UExURQwuMQ4vNCJcTxhTQw0/OChhUA8pNQ88Og4pNhIuOx9MSRA9OgwxMg41NBA5OBI9OxNBPhVEQBVHQRZLQxVMQxZOQhdQQhlTRA0vMQ0yMxtVRhtVRgwwNA0xNBtXRxpXRg0xNR1ZSA4vNBxZSQwsNBtXRwkpMhpVRgkoMRpURwkqNBhSRQgnMxdORAklMRZLQwwnMxNIQA0mMxBCPQwlMg4pNRFAPQ9AOxArOA8rNxE9OxE+PA4qNhAtOA0uOAwuOAkrNgguNwgvOAkwOAwzOQ02Nw44Nw87OA41NRE6ORY8OR05MyI2LiM1LCE7MRxJPRtTRRpTRQ00NBg9Oi1CNiQsJB8gGxwaFxkWFRENDg4SFBoxKh5RQxtWRw41N1VeRzQxIxgZFxUbGiQvJic3LSEsJQkKECEZFyI6MRxXSB1YSQ4yNl5qU1JNOBkZFRksKRc/OxZHQRdMQhtOQRs3LxcYFx0kHx5TRBtZSSZAPZ6TayQjHRYoJxM9PBNBPxRGQRVKQhRNQhhQQx5GOigsJCQ/MxtXSFhjUq6fdRsfHBU3NxI9PBNBPhREQBVJQhZMQhVNQiRYSFRpTzA4LB5PQXt9ZcCvgyQrJxI3OhI7OxQ/PhRCQBVGQhZKQxVMQx1TRpikfVRcRiJGOHyAaePPnkJHOxAyNxA4OhI8PBJAPxNEQRRIQxVLQxpRRra5kI6TciJANF1mWffhrZWObxczNg81OxE6PBE+PhFBPxNGQRNIQixaTNXMnayshSRKPCo9P9C9jurXpmRvYA4yOQ41OxE7PRI+Pw9CPnGIb+jZqJqhfRdLQgwoNG9zX9fFl+DSpoiNdjFNShg+PxhBQCdMRGF2XdfPo9XKm2Z/ZxBFPwwnNBkyOouJbsy9ktXHm8O4jqCeepSUca6ofeTSntXHlpSZdiBNRQ9CPQ0qNhs1PHh9aMS4jNnImODRoufVouLOmrOnem55XSNMRBA/PQ4rNwwtOCxHRl5sXXeAamdzYDxSSiJBPhE5OQ86Of///x8GkC0AAABIdFJOUwAAAAAAAAAAAAAAADKOzOv5/v7568yOMlbf31Yy398yjo7MzOvr+fn+/v7++fnr68zMjo4y398yVt/fVjKOzOv5/v7568yOMpMJs+AAAAABYktHRP7SAMJTAAAAB3RJTUUH6gEJEBEqrye9yAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyNi0wMS0wOVQxNjoxNzowOCswMDowMFmjBoEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjYtMDEtMDlUMTU6MTU6MTgrMDA6MDBdawJQAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDI2LTAxLTA5VDE2OjE3OjQyKzAwOjAwX9HOVgAAARtJREFUGNMBEAHv/gAAAQwNDg8QERITFBUWFwIDAAQYGUhJSktMTU5PUFEaGwUAHB1SU1RVVldYWVpbXF0eHwAgXlNfYGFiY2RlZmdoaWohACJrbG1ub3BxcnN0dXZ3eCMAJHl6e3x9fn+AgYKDhIWGJQAmh4iJiouMjY6PkJGSk5QnACiVlpeYmZqbnJ2en6ChoikAKqOkpaanqKmqq6ytrq+wKwAssbKztLW2t7i5uru8vb4tAC6/wMHCw8TFxrjHyMnKyy8AMMzNzs/Q0dLT1NXW19jZMQAy2tvc3d7f4OHi4+Tl5uczADQ16Onq6+zt7u/w8fLzNjcABjg59PX29/j5+vv8/To7BwAICTw9Pj9AQUJDREVGRwoL8Et+j3V+iZAAAAAASUVORK5CYII=">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
      color: white;
    }
    .container {
      text-align: center;
      padding: 40px;
    }
    h1 { margin-bottom: 16px; }
    p { opacity: 0.8; }
  </style>
</head>
<body>
  <div class="container">
    <h1>$title</h1>
    <p>$message</p>
  </div>
</body>
</html>
''';
  }
}
