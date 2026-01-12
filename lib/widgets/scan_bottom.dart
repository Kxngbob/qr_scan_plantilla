import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//port 'package:qr_scan/model/scan_model.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
//port 'package:qr_scan/utils/utils.dart';



class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon( 
        Icons.filter_center_focus,
      ),
      onPressed: () {
        print('Botó polsat!');
        //String barcodeScanRes = 'geo:39.7259514,2.9110671,16';
        String barcodeScanRes = 'https://paucasesnovescifp.cat';
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        //ScanModel nouScan = ScanModel(valor: barcodeScanRes);
        scanListProvider.nouScan(barcodeScanRes);
        String barcodeScanRes1 = 'geo:39.7259514,2.9110671,16';
        scanListProvider.nouScan(barcodeScanRes1);
        //launchURL(context, nouScan);
      },
    );
  }
}
