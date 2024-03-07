import 'package:bu_ride/app/orders/providers/order_providers.dart';
import 'package:bu_ride/app/orders/widgets/pop_up.dart';
import 'package:bu_ride/models/order_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OrderCard extends ConsumerStatefulWidget {
  final OrderModel order;
  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderCardState();
}

class _OrderCardState extends ConsumerState<OrderCard> {
  bool showModal = false;
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    final orderStateNotifier =
        ref.read(orderRideStateNotifierProvider.notifier);
    return Container(
      height: 200.rH(context),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 26.rH(context),
        horizontal: 26.rW(context),
      ),
      decoration: BoxDecoration(
        color: backk,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.order.firstName.txt16(
                  fontWeight: FontWeight.w700,
                  color: greyy,
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: redColor,
                    ),
                    5.sbW(context),
                    'DELETE'
                        .txt14(
                      color: redColor,
                    )
                        .tap(onTap: () {
                      orderStateNotifier.deleteOrder(
                          order: widget.order, context: context);
                    }),
                  ],
                ),
                30.sbW(context),
                PopUpOverlay(
                  visible: showModal,
                  follower: Alignment.topCenter,
                  target: Alignment.bottomCenter,
                  modal: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      // height: 400,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: grey600),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SeparatedColumn(
                        mainAxisSize: MainAxisSize.min,
                        separatorBuilder: () => const SizedBox(height: 5),
                        children: List.generate(
                          RideStatus.values.length,
                          (index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: widget.order.rideStatus ==
                                            RideStatus.values[index] ||
                                        _hoveredIndex == index
                                    ? RideStatus.values[index].color
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RideStatus.values[index].status
                                      .toCapitalized()
                                      .txt(
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: widget.order.rideStatus ==
                                                    RideStatus.values[index] ||
                                                _hoveredIndex == index
                                            ? neutralWhite
                                            : null,
                                      ),
                                  widget.order.rideStatus ==
                                              RideStatus.values[index] ||
                                          _hoveredIndex == index
                                      ? const Icon(
                                          PhosphorIconsBold.check,
                                          size: 20,
                                          color: neutralWhite,
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ).tap(
                              onTap: () {
                                orderStateNotifier.editOrder(
                                  order: widget.order.copyWith(
                                      rideStatus: RideStatus.values[index]),
                                  context: context,
                                );
                                // editorStateNotifier.changeShadow(
                                //     newShadow: ShadowPreset.values[index]);
                                setState(() => showModal = false);
                              },
                              onHover: (isHovered) {
                                setState(() {
                                  _hoveredIndex = isHovered ? index : -1;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  onClose: () {
                    setState(() => showModal = false);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.edit),
                      5.sbW(context),
                      'EDIT'.txt14(),
                    ],
                  ).tap(onTap: () {
                    setState(() => showModal = true);
                  }),
                ),
              ],
            ),
            7.5.sbH(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => CustomizableRow(
                  flexValues: const [1, 8],
                  children: [
                    (switch (index) {
                      0 => 'Full Name:',
                      1 => 'Email :',
                      2 => 'Pick-up:',
                      3 => 'Destination:',
                      _ => 'Status:'
                    })
                        .txt(
                      size: 15,
                    ),
                    (switch (index) {
                      0 => '${widget.order.firstName} ${widget.order.lastName}',
                      1 => widget.order.emailAddress,
                      2 => widget.order.pickUpLocation,
                      3 => widget.order.destination,
                      _ => widget.order.rideStatus.status
                    })
                        .txt(
                      size: 15,
                      fontWeight: FontWeight.w700,
                      color: index == 4 ? widget.order.rideStatus.color : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
