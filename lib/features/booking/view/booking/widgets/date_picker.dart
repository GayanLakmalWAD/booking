import 'package:booking/core/utils/colors.dart';
import 'package:booking/features/booking/model/date.dart';
import 'package:booking/features/booking/providers/selected_date_provider.dart';
import 'package:booking/features/booking/providers/total_provider.dart';
import 'package:booking/features/rooms/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

Future openDatePicker(BuildContext context, Room room) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: Consumer(builder: (context, ref, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 250,
                  width: 100.w,
                  child: SfDateRangePicker(
                    backgroundColor: AppColors.kPrimaryColor,
                    // initialSelectedDate: cropCycleProvider.selectedSowingDate == 'Pick a sowing date' ? DateTime.now() : DateTime.parse(cropCycleProvider.selectedSowingDate),
                    selectionMode: DateRangePickerSelectionMode.range,
                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) async {
                      print(args.value.toString());
                      String dateCount = "1";
                      String price = room.price;

                      //
                      var startDate = await args.value.startDate;
                      var endDate = await args.value.endDate;
                      if (startDate != null && endDate != null) {
                        DateTime start = DateFormat("yyyy-MM-dd").parse(startDate.toString());
                        DateTime end = DateFormat("yyyy-MM-dd").parse(endDate.toString());

                        final Duration duration = end.difference(start);

                        if(((start.month == DateTime.october) && (start.day == 3)) &&
                            ((end.month == DateTime.october) && (end.day == 6))){
                          price = 1000.toString();
                        }

                        dateCount = duration.inDays.toString();

                        ref.read(selectedDateProvider.notifier).setSelectedDate = SelectedDate(
                          startDate: start.toString(),
                          endDate: end.toString(),
                          dateCount: dateCount,
                        );
                      } else {
                        ref.read(selectedDateProvider.notifier).setSelectedDate = SelectedDate(
                          startDate: DateFormat("yyyy-MM-dd").parse(startDate.toString()).toString(),
                          endDate: DateFormat("yyyy-MM-dd").parse(startDate.toString()).toString(),
                          dateCount: "1",
                        );
                      }
                      ref.read(totalProvider.notifier).setTotal =
                          (double.parse(price) * double.parse(dateCount)).toString();
                    },
                  ),
                ),
                Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: AppColors.kGreyColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.kPrimaryColor),
                      ),
                      child: const Center(
                        child: Text("Okay"),
                      ),
                    ))
              ],
            );
          }),
        );
      });
}