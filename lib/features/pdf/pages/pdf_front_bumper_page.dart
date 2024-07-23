import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/cubit/cubit.dart';
import '../../../core/util/cubit/state.dart';
import 'package:screenshot/screenshot.dart';

class PdfFrontBumberPage extends StatefulWidget {
  const PdfFrontBumberPage({super.key});

  @override
  State<PdfFrontBumberPage> createState() => _PdfFrontBumberPageState();
}

class _PdfFrontBumberPageState extends State<PdfFrontBumberPage> {
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: appBloc.frontBumberController,
      child: _pdfFrontBumberPageView(),
    );
  }

  ///* Order invoice view
  Widget _pdfFrontBumberPageView() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Container(
              width: 1000,
              margin: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 6,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'الإكصدام الأمامي',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  space20Vertical(),
                  Image.asset(
                    'assets/images/Untitled-1-04.png',
                    width: 200,
                    height: 200,
                  ),
                  space20Vertical(),
                  Container(
                    width: double.infinity,
                    height: 1500,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 6,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.bpJTixcJ9eRwEFjKsApJ8QHaEo?pid=ImgDet&rs=1',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
