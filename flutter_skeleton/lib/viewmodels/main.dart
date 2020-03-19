
import 'package:npskeleton/providers.dart/ui.dart';

class MainUI {
  final UIProvider _uiProvider;
  MainUI(this._uiProvider);
  notify() {
    _uiProvider.refresh();
  }
}
