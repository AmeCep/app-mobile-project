
import 'dart:convert';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
    final String vendorId;
    final String businessName;
    final String phoneNumber;
    final String countryValue;
    final String stateValue;
    final String cityValue;
    final String taxTypeSelection;
    final String rncNumber;
    final String image;
    final String email;
    final bool approved;

    VendorModel({
        required this.vendorId,
        required this.businessName,
        required this.phoneNumber,
        required this.countryValue,
        required this.stateValue,
        required this.cityValue,
        required this.taxTypeSelection,
        required this.rncNumber,
        required this.image,
        required this.email,
        required this.approved,
    });

    factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        vendorId: json["vendorId"],
        businessName: json["businessName"],
        phoneNumber: json["phoneNumber"],
        countryValue: json["countryValue"],
        stateValue: json["stateValue"],
        cityValue: json["cityValue"],
        taxTypeSelection: json["taxTypeSelection"],
        rncNumber: json["rncNumber"],
        image: json["image"],
        email: json["email"],
        approved: json["approved"],
    );

    Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "businessName": businessName,
        "phoneNumber": phoneNumber,
        "countryValue": countryValue,
        "stateValue": stateValue,
        "cityValue": cityValue,
        "taxTypeSelection": taxTypeSelection,
        "rncNumber": rncNumber,
        "image": image,
        "email": email,
        "approved": approved,
    };
}
