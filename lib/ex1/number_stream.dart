import 'dart:async';

class NumberStream{
  NumberStream(){
    var timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(count == 10){
        timer.cancel();
      }
      else{
        _controller.sink.add(count);
        count++;
      }
    });
  }

  var count = 1;

  final _controller = StreamController<int>.broadcast();

  Stream<int> get stream => _controller.stream;
}