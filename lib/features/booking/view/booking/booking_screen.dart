import 'package:booking/core/utils/colors.dart';
import 'package:booking/core/utils/dimensions.dart';
import 'package:booking/core/utils/styles.dart';
import 'package:booking/features/booking/view/booking/widgets/confirm_button.dart';
import 'package:booking/features/booking/view/booking/widgets/date_picker.dart';
import 'package:booking/core/reusable/custom_textfield.dart';
import 'package:booking/features/booking/view/booking/widgets/selected_date.dart';
import 'package:booking/features/booking/view/booking/widgets/total.dart';
import 'package:booking/features/rooms/models/room.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookingScreen extends StatelessWidget {
  final Room room;

  BookingScreen({
    super.key,
    required this.room,
  });

  final TextEditingController customerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text("Customer Details"),
        backgroundColor: AppColors.kSecondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Room : ",
                        style: poppinsMedium.copyWith(
                          fontSize: Dimensions.h3,
                        ),
                      ),
                      TextSpan(
                        text: room.name,
                        style: poppinsBold.copyWith(
                          fontSize: Dimensions.h3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomTextField(
                controller: customerNameController,
                hintText: "Customer Name",
                textStyle: poppinsMedium.copyWith(fontSize: Dimensions.h3, height: 1.5),
                prefixIconUrl: const Icon(Icons.supervised_user_circle_rounded, size: 20),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 50,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColors.kGreyColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.kPrimaryColor)),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Dates",
                            style: poppinsMedium.copyWith(
                              fontSize: Dimensions.h3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  openDatePicker(context, room);
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              const SelectedDateWidget(),
              const TotalWidget(),
              const SizedBox(
                height: 25.0,
              ),
              ConfirmButton(
                customerNameController: customerNameController,
                room: room,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
