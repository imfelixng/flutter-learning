import 'package:flutter_demo_mvp/mvp/presenter.dart';

import 'counter_view.dart';

class CounterPresenter extends Presenter<CounterView> {
  
  int count = 0;

  // handle logic

  increment() {
    count++;
    getView().onIncrement(count);
  }
  
  decrement() {
    count--;
    getView().onDecrement(count);
  }
}