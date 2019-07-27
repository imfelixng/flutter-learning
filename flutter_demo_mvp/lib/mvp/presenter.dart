import 'mvp_view.dart';


// mapping 1 - 1 with view

class Presenter<T extends MvpView> {

  T view;

  attachView(T view) {
    this.view = view;
  }

  deAttachView() {
    this.view = null;
  }

  T getView() => view;

}