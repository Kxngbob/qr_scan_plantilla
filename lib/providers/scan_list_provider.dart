import 'package:flutter/cupertino.dart';
import 'package:qr_scan/model/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;

    if (nouScan.tipo == tipoSeleccionado) {
      this.scans.add(nouScan);
      notifyListeners();
    }
    return nouScan;
  }

  carregarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregarScansPerTipus(String tipus) async {
    final scans = await DBProvider.db.getScansPerTipo(tipus);

    this.scans = scans ?? [];
    tipoSeleccionado = tipus;
    notifyListeners();
  }



  esborraTots() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
    
  }


}