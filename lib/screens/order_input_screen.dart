import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import '../models/fleet_routing_model.dart' as fleet_model;

const String kGoogleApiKey = 'AIzaSyApH0OAcrcn7tobzhy_I-vEciHInXknxrU';

class LocationPoint {
  String address;
  double lat;
  double lng;

  LocationPoint({required this.address, required this.lat, required this.lng});
}

class Order {
  List<LocationPoint> pickupAddresses;
  List<LocationPoint> dropoffAddresses;
  String? shipmentType;
  String? label;
  double? penaltyCost;

  Order({
    List<LocationPoint>? pickupAddresses,
    List<LocationPoint>? dropoffAddresses,
    this.shipmentType,
    this.label,
    this.penaltyCost,
  }) : pickupAddresses = pickupAddresses ?? [],
       dropoffAddresses = dropoffAddresses ?? [];
}

class OrderInputScreen extends StatefulWidget {
  const OrderInputScreen({super.key});

  @override
  State<OrderInputScreen> createState() => _OrderInputScreenState();
}

class _OrderInputScreenState extends State<OrderInputScreen> {
  final List<Order> _orders = [Order()];

  void _addOrder() => setState(() => _orders.add(Order()));
  void _removeOrder(int index) => setState(() => _orders.removeAt(index));
  void _addPickupPoint(int orderIndex) => setState(
    () => _orders[orderIndex].pickupAddresses.add(
      LocationPoint(address: '', lat: 0, lng: 0),
    ),
  );
  void _addDropoffPoint(int orderIndex) => setState(
    () => _orders[orderIndex].dropoffAddresses.add(
      LocationPoint(address: '', lat: 0, lng: 0),
    ),
  );
  void _removePickupPoint(int orderIndex, int pointIndex) =>
      setState(() => _orders[orderIndex].pickupAddresses.removeAt(pointIndex));
  void _removeDropoffPoint(int orderIndex, int pointIndex) =>
      setState(() => _orders[orderIndex].dropoffAddresses.removeAt(pointIndex));

  Widget _buildPlacesAutocompleteField(
    int orderIndex,
    int pointIndex,
    bool isPickup,
  ) {
    final controller = TextEditingController(
      text:
          isPickup
              ? _orders[orderIndex].pickupAddresses[pointIndex].address
              : _orders[orderIndex].dropoffAddresses[pointIndex].address,
    );

    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: kGoogleApiKey,
      inputDecoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        hintText: 'Nhập địa chỉ',
      ),
      debounceTime: 400,
      countries: const ["vn"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (prediction) async {
        final address = prediction.description ?? '';
        final lat = double.tryParse(prediction.lat ?? '') ?? 0.0;
        final lng = double.tryParse(prediction.lng ?? '') ?? 0.0;

        setState(() {
          final point = LocationPoint(address: address, lat: lat, lng: lng);
          if (isPickup) {
            _orders[orderIndex].pickupAddresses[pointIndex] = point;
          } else {
            _orders[orderIndex].dropoffAddresses[pointIndex] = point;
          }
        });
      },
      itemClick: (prediction) {
        controller.text = prediction.description!;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      },
    );
  }

  Widget _buildPointField(int orderIndex, int pointIndex, bool isPickup) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isPickup ? Colors.green[10] : Colors.blue[10],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPickup ? Colors.green : Colors.blue,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildPlacesAutocompleteField(
              orderIndex,
              pointIndex,
              isPickup,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.grey),
            onPressed:
                () =>
                    isPickup
                        ? _removePickupPoint(orderIndex, pointIndex)
                        : _removeDropoffPoint(orderIndex, pointIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(int index) {
    final order = _orders[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đơn hàng ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20, color: Colors.grey),
                  onPressed: () => _removeOrder(index),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Điểm lấy:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...order.pickupAddresses.asMap().entries.map(
              (e) => _buildPointField(index, e.key, true),
            ),
            TextButton.icon(
              onPressed: () => _addPickupPoint(index),
              icon: const Icon(Icons.add_circle, color: Colors.grey),
              label: const Text(
                'Thêm điểm lấy',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Điểm trả:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...order.dropoffAddresses.asMap().entries.map(
              (e) => _buildPointField(index, e.key, false),
            ),
            TextButton.icon(
              onPressed: () => _addDropoffPoint(index),
              icon: const Icon(Icons.add_circle, color: Colors.grey),
              label: const Text(
                'Thêm điểm trả',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _orders.length + 1,
        itemBuilder:
            (context, index) =>
                index < _orders.length
                    ? _buildOrderCard(index)
                    : Center(
                      child: TextButton.icon(
                        onPressed: _addOrder,
                        icon: const Icon(Icons.add, color: Colors.blue),
                        label: const Text(
                          'Thêm đơn hàng',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
      ),
    );
  }
}
