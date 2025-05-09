import 'package:flutter_vendor_peymantahkim/models/vendor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// statenotifier: statenotifire is a class provider by riverpod package that
// helps in managing the state
// it is a designed to notify listeners about the state changes
class VendorProvider extends StateNotifier<Vendor?> {
  VendorProvider()
      : super(Vendor(
            id: '',
            fullName: '',
            email: '',
            state: '',
            city: '',
            locality: '',
            role: '',
            password: ''));

  // getter method to extract value from a object
  Vendor? get vendor => state;

  // setter method to set value to a object
  void setVendor(String vendorJson) {
    state = Vendor.fromJson(vendorJson);
  }

  // method to clear the vendor user state
  void signOut() {
    state = null;
  }
}

// make the data accessible within the application
final vendorProvider = StateNotifierProvider<VendorProvider, Vendor?>((ref) {
  return VendorProvider();
});
