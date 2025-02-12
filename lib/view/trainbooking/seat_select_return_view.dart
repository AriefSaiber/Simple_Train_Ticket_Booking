import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/components/trainbooking/seat_select_comp.dart';
import 'package:train_ticket_book/constants.dart';
import 'package:train_ticket_book/controller/seat_select_ctrl.dart';
import 'package:train_ticket_book/model/trainbooking/seat_select_mdl.dart';
import 'package:train_ticket_book/view/homepage_view.dart';
import 'package:train_ticket_book/view/trainbooking/booking_summary_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class SeatReturnSelect extends StatefulWidget {
  const SeatReturnSelect({super.key});

  @override
  State<SeatReturnSelect> createState() => _SeatReturnSelectState();
}

final SeatSelectController seatCtrl = Get.put(SeatSelectController());

class _SeatReturnSelectState extends State<SeatReturnSelect> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          seatCtrl.selectedReturnSeat.value = '';
        }
        return;
      },
      child: Obx(
        () => Scaffold(
          appBar: CustomAppBar(title: 'Returning Seat (${gCtrl.selectedReturnTrain.value})'),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(seatMdl.times.length, (index) {
                      return seatComp().timeContainer(context, index, seatCtrl.selectedReturnIndex);
                    }),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return seatComp().bookingContainer(
                      setState: () => setState(() {}),
                      pageindex: index,
                      selectedSeat: seatCtrl.selectedReturnSeat,
                    );
                  },
                  childCount: 6,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: Screen.H(context) * 0.1,
                ),
              )
            ],
          ),
          floatingActionButton: Obx(
            () => seatCtrl.selectedReturnSeat.value.isNotEmpty
                ? FloatingActionButton(
                    onPressed: () {
                      gCtrl.selectedReturnTime.value = seatMdl.times[seatCtrl.selectedReturnIndex.value];
                      gCtrl.selectedReturnSeat.value = seatCtrl.selectedReturnSeat.value;
                      Get.to(BookingSummaryView());
                    },
                    child: Container(child: Icon(Icons.check)),
                    backgroundColor: Colors.green,
                    elevation: 10,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
