import 'package:npskeleton/providers.dart/ui.dart';

class ExampleUI {
  final UIProvider _uiProvider;
  ExampleUI(this._uiProvider);
  bool startedLoading = false;
  bool firstAnimationFinished = false;
  bool dataAvailable = false;

  initLoadButton() {
    startedLoading = false;
    firstAnimationFinished = false;
    dataAvailable = false;
  }

  setBool(String valname, bool value) {
    switch (valname) {
      case "startedLoading":
        startedLoading = value;
        break;
      case "dataAvailable":
        dataAvailable = value;
        break;
      case "firstAnimationFinished":
        firstAnimationFinished = value;
        break;
    }
    _uiProvider.refresh();
  }
}
