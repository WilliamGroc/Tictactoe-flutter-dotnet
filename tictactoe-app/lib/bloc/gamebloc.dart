import 'dart:async';

class Gamebloc {
  StreamController<List<String>> gridState = StreamController.broadcast();
  StreamController<String> isWinner = StreamController.broadcast();

  String _nextValue = 'X';
  List<String> _state = List.filled(9, '');

  static Gamebloc? _instance;

  static Gamebloc getInstance() {
    _instance ??= Gamebloc();
    return _instance!;
  }

  void resetState() {
    _state = List.filled(9, '');
    gridState.add(_state);

    isWinner.add('');
  }

  bool get hasWin {
    return _checkLine || _checkCols || _checkCross;
  }

  bool get _checkLine {
    var isEnd = false;
    for (var i = 0; i < 3; i++) {
      isEnd = _state
              .getRange(i * 3, i * 3 + 3)
              .every((element) => element == _nextValue) ||
          isEnd;
    }

    return isEnd;
  }

  bool get _checkCols {
    var isEnd = false;

    for (var i = 0; i < 3; i++) {
      isEnd = [_state[i], _state[i + 3], _state[i + 6]]
              .every((element) => element == _nextValue) ||
          isEnd;
    }

    return isEnd;
  }

  bool get _checkCross {
    var isEnd = false;

    isEnd = [_state[0], _state[4], _state[8]]
            .every((element) => element == _nextValue) ||
        isEnd;

    isEnd = [_state[2], _state[4], _state[6]]
            .every((element) => element == _nextValue) ||
        isEnd;

    return isEnd;
  }

  Stream<List<String>> get gridStream {
    return gridState.stream;
  }

  Stream<String> get winnerStream {
    return isWinner.stream;
  }

  void setCase(int index) async {
    if (_state[index] == '' && !hasWin) {
      _state[index] = _nextValue;
      gridState.add(_state);

      if (hasWin) {
        isWinner.add(_nextValue);
      } else if (!_state.any((element) => element == '')) {
        isWinner.add('PAT');
      } else {
        _nextValue = _nextValue == 'O' ? 'X' : 'O';
      }
    }
  }
}
