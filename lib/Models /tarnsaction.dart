import 'package:flutter/material.dart';

class AmbulancekiList {
  String? transtype;
  int? amount;
  String? category;
  Map<String, dynamic>? user;

  AmbulancekiList({
    this.transtype,
    this.amount,
    this.category,
    this.user,
  });

  AmbulancekiList.fromJson(Map<String, dynamic> json) {
    transtype = json['transType'];
    amount = json['amount'];
    category = json['category'];
    user = json['ofUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transType'] = this.transtype;
    data['amount'] = this.amount;
    data['category'] = this.category;
    data['ofUser'] = this.user;
    return data;
  }
}
