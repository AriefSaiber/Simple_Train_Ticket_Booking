import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/components/trainbooking/seat_select_comp.dart';
import 'package:train_ticket_book/constants.dart';
import 'package:train_ticket_book/controller/seat_select_ctrl.dart';
import 'package:train_ticket_book/model/trainbooking/seat_select_mdl.dart';
import 'package:train_ticket_book/view/trainbooking/booking_summary_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class SeatSelect extends StatefulWidget {
  const SeatSelect({super.key});

  @override
  State<SeatSelect> createState() => _SeatSelectState();
}

final SeatSelectController seatCtrl = Get.put(SeatSelectController());

class _SeatSelectState extends State<SeatSelect> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          seatCtrl.selectedSeat.value = '';
        }
        return;
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'Select Seat (${seatCtrl.selectedSeat.value})'),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(seatMdl.times.length, (index) {
                    return seatComp().timeContainer(context, index);
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
          () => seatCtrl.selectedSeat.value.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    // Handle action when seat is selected
                    Get.to(BookingSummaryView());
                    print("Proceed with seat: ${seatCtrl.selectedSeat.value}");
                  },
                  child: Container(child: Icon(Icons.check)),
                  backgroundColor: Colors.green,
                  elevation: 10,
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }

  
}
