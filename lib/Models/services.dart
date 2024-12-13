class ServiceResponse {
  final String status;
  final String statusMessage;
  final ServiceData response;

  ServiceResponse({
    required this.status,
    required this.statusMessage,
    required this.response,
  });

  // Factory constructor to parse JSON
  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      response: ServiceData.fromJson(json['response']),
    );
  }

  // Method to convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_message': statusMessage,
      'response': response.toJson(),
    };
  }
}

// Model class for the response data
class ServiceData {
  final List<ServiceMaster> servicemaster;
  final List<PackageDetail> packagedetail;

  ServiceData({
    required this.servicemaster,
    required this.packagedetail,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      servicemaster: (json['servicemaster'] as List)
          .map((item) => ServiceMaster.fromJson(item))
          .toList(),
      packagedetail: (json['packagedetail'] as List)
          .map((item) => PackageDetail.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'servicemaster': servicemaster.map((e) => e.toJson()).toList(),
      'packagedetail': packagedetail.map((e) => e.toJson()).toList(),
    };
  }
}

// Model class for ServiceMaster
class ServiceMaster {
  final String serviceId;
  final String serviceName;
  final String serviceShortDetail;
  final String serviceLongDetail;
  final String serviceImage;

  ServiceMaster({
    required this.serviceId,
    required this.serviceName,
    required this.serviceShortDetail,
    required this.serviceLongDetail,
    required this.serviceImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) {
    return ServiceMaster(
      serviceId: json['service_id'],
      serviceName: json['service_name'],
      serviceShortDetail: json['service_short_detail'],
      serviceLongDetail: json['service_long_detail'],
      serviceImage: json['serviceimage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'service_name': serviceName,
      'service_short_detail': serviceShortDetail,
      'service_long_detail': serviceLongDetail,
      'serviceimage': serviceImage,
    };
  }
}

// Model class for PackageDetail
class PackageDetail {
  final String packageId;
  final String serviceId;
  final String packageName;
  final String packagePrice;
  final String facility1;
  final String facility2;
  final String facility3;
  final String facility4;
  final String facility5;
  final String facility6;
  final String facility7;

  PackageDetail({
    required this.packageId,
    required this.serviceId,
    required this.packageName,
    required this.packagePrice,
    required this.facility1,
    required this.facility2,
    required this.facility3,
    required this.facility4,
    required this.facility5,
    required this.facility6,
    required this.facility7,
  });

  factory PackageDetail.fromJson(Map<String, dynamic> json) {
    return PackageDetail(
      packageId: json['package_id'],
      serviceId: json['service_id'],
      packageName: json['package_name'],
      packagePrice: json['package_price'],
      facility1: json['facility_1'],
      facility2: json['facility_2'],
      facility3: json['facility_3'],
      facility4: json['facility_4'],
      facility5: json['facility_5'],
      facility6: json['facility_6'],
      facility7: json['facility_7'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'service_id': serviceId,
      'package_name': packageName,
      'package_price': packagePrice,
      'facility_1': facility1,
      'facility_2': facility2,
      'facility_3': facility3,
      'facility_4': facility4,
      'facility_5': facility5,
      'facility_6': facility6,
      'facility_7': facility7,
    };
  }
}