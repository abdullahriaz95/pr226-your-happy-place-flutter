
import 'dart:convert';

InformationResponse informationResponseFromJson(String str) => InformationResponse.fromJson(json.decode(str));

String informationResponseToJson(InformationResponse data) => json.encode(data.toJson());

class InformationResponse {
    InformationResponse({
        this.key,
        this.value,
    });

    String? key;
    String? value;

    factory InformationResponse.fromJson(Map<String, dynamic> json) => InformationResponse(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}
