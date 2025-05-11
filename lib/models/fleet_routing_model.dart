import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fleet_routing_model.g.dart'; // file will be generated

@JsonSerializable(explicitToJson: true)
class ShipmentModel {
  final List<Shipment> shipments;
  final List<Vehicle> vehicles;
  final String globalStartTime;
  final String globalEndTime;
  final double? globalDurationCostPerHour;
  final List<DurationDistanceMatrix>? durationDistanceMatrices;
  final List<String>? durationDistanceMatrixSrcTags;
  final List<String>? durationDistanceMatrixDstTags;
  final List<TransitionAttributes>? transitionAttributes;
  final List<ShipmentTypeIncompatibility>? shipmentTypeIncompatibilities;
  final List<ShipmentTypeRequirement>? shipmentTypeRequirements;
  final List<PrecedenceRule>? precedenceRules;
  final int? maxActiveVehicles;

  ShipmentModel({
    required this.shipments,
    required this.vehicles,
    required this.globalStartTime,
    required this.globalEndTime,
    this.globalDurationCostPerHour,
    this.durationDistanceMatrices,
    this.durationDistanceMatrixSrcTags,
    this.durationDistanceMatrixDstTags,
    this.transitionAttributes,
    this.shipmentTypeIncompatibilities,
    this.shipmentTypeRequirements,
    this.precedenceRules,
    this.maxActiveVehicles,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Shipment {
  final String? displayName;
  final List<VisitRequest> pickups;
  final List<VisitRequest> deliveries;
  final Map<String, Load>? loadDemands;
  final List<int>? allowedVehicleIndices;
  final List<double>? costsPerVehicle;
  final List<int>? costsPerVehicleIndices;
  final String? pickupToDeliveryAbsoluteDetourLimit;
  final String? pickupToDeliveryTimeLimit;
  final String? shipmentType;
  final String? label;
  final bool? ignore;
  final double? penaltyCost;
  final double? pickupToDeliveryRelativeDetourLimit;

  Shipment({
    this.displayName,
    required this.pickups,
    required this.deliveries,
    this.loadDemands,
    this.allowedVehicleIndices,
    this.costsPerVehicle,
    this.costsPerVehicleIndices,
    this.pickupToDeliveryAbsoluteDetourLimit,
    this.pickupToDeliveryTimeLimit,
    this.shipmentType,
    this.label,
    this.ignore,
    this.penaltyCost,
    this.pickupToDeliveryRelativeDetourLimit,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VisitRequest {
  final LatLng? arrivalLocation;
  final Waypoint? arrivalWaypoint;
  final LatLng? departureLocation;
  final Waypoint? departureWaypoint;
  final List<String> tags;
  final List<TimeWindow> timeWindows;
  final String duration;
  final double? cost;
  final Map<String, Load>? loadDemands;
  final List<String>? visitTypes;
  final String? label;

  VisitRequest({
    this.arrivalLocation,
    this.arrivalWaypoint,
    this.departureLocation,
    this.departureWaypoint,
    required this.tags,
    required this.timeWindows,
    required this.duration,
    this.cost,
    this.loadDemands,
    this.visitTypes,
    this.label,
  });

  factory VisitRequest.fromJson(Map<String, dynamic> json) =>
      _$VisitRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VisitRequestToJson(this);
}

@JsonSerializable()
class LatLng {
  final double latitude;
  final double longitude;

  LatLng({required this.latitude, required this.longitude});

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);

  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Waypoint {
  final bool? sideOfRoad;
  final Location? location;
  final String? placeId;

  Waypoint({this.sideOfRoad, this.location, this.placeId});

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}

@JsonSerializable()
class Location {
  final LatLng latLng;
  final int? heading;

  Location({required this.latLng, this.heading});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class TimeWindow {
  final String? startTime;
  final String? endTime;
  final String? softStartTime;
  final String? softEndTime;
  final double? costPerHourBeforeSoftStartTime;
  final double? costPerHourAfterSoftEndTime;

  TimeWindow({
    this.startTime,
    this.endTime,
    this.softStartTime,
    this.softEndTime,
    this.costPerHourBeforeSoftStartTime,
    this.costPerHourAfterSoftEndTime,
  });

  factory TimeWindow.fromJson(Map<String, dynamic> json) =>
      _$TimeWindowFromJson(json);

  Map<String, dynamic> toJson() => _$TimeWindowToJson(this);
}

@JsonSerializable()
class Load {
  final String amount;

  Load({required this.amount});

  factory Load.fromJson(Map<String, dynamic> json) => _$LoadFromJson(json);

  Map<String, dynamic> toJson() => _$LoadToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Vehicle {
  final String? displayName;
  @JsonKey(unknownEnumValue: TravelMode.TRAVEL_MODE_UNSPECIFIED)
  final TravelMode? travelMode;
  final RouteModifiers? routeModifiers;
  final LatLng? startLocation;
  final Waypoint? startWaypoint;
  final LatLng? endLocation;
  final Waypoint? endWaypoint;
  final List<String>? startTags;
  final List<String>? endTags;
  final List<TimeWindow>? startTimeWindows;
  final List<TimeWindow>? endTimeWindows;
  @JsonKey(unknownEnumValue: UnloadingPolicy.UNLOADING_POLICY_UNSPECIFIED)
  final UnloadingPolicy? unloadingPolicy;
  final Map<String, LoadLimit>? loadLimits;
  final double? costPerHour;
  final double? costPerTraveledHour;
  final double? costPerKilometer;
  final double? fixedCost;
  final bool? usedIfRouteIsEmpty;
  final DurationLimit? routeDurationLimit;
  final DurationLimit? travelDurationLimit;
  final DistanceLimit? routeDistanceLimit;
  final Map<String, String>? extraVisitDurationForVisitType;
  final BreakRule? breakRule;
  final String? label;
  final bool? ignore;
  final double? travelDurationMultiple;

  Vehicle({
    this.displayName,
    this.travelMode,
    this.routeModifiers,
    this.startLocation,
    this.startWaypoint,
    this.endLocation,
    this.endWaypoint,
    this.startTags,
    this.endTags,
    this.startTimeWindows,
    this.endTimeWindows,
    this.unloadingPolicy,
    this.loadLimits,
    this.costPerHour,
    this.costPerTraveledHour,
    this.costPerKilometer,
    this.fixedCost,
    this.usedIfRouteIsEmpty,
    this.routeDurationLimit,
    this.travelDurationLimit,
    this.routeDistanceLimit,
    this.extraVisitDurationForVisitType,
    this.breakRule,
    this.label,
    this.ignore,
    this.travelDurationMultiple,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

@JsonEnum()
enum TravelMode {
  @JsonValue('TRAVEL_MODE_UNSPECIFIED')
  TRAVEL_MODE_UNSPECIFIED,
  @JsonValue('DRIVING')
  DRIVING,
  @JsonValue('WALKING')
  WALKING,
}

@JsonSerializable()
class RouteModifiers {
  final bool? avoidTolls;
  final bool? avoidHighways;
  final bool? avoidFerries;
  final bool? avoidIndoor;

  RouteModifiers({
    this.avoidTolls,
    this.avoidHighways,
    this.avoidFerries,
    this.avoidIndoor,
  });

  factory RouteModifiers.fromJson(Map<String, dynamic> json) =>
      _$RouteModifiersFromJson(json);

  Map<String, dynamic> toJson() => _$RouteModifiersToJson(this);
}

@JsonEnum()
enum UnloadingPolicy {
  @JsonValue('UNLOADING_POLICY_UNSPECIFIED')
  UNLOADING_POLICY_UNSPECIFIED,
  @JsonValue('LAST_IN_FIRST_OUT')
  LAST_IN_FIRST_OUT,
  @JsonValue('FIRST_IN_FIRST_OUT')
  FIRST_IN_FIRST_OUT,
}

@JsonSerializable(explicitToJson: true)
class LoadLimit {
  final String? softMaxLoad;
  final double? costPerUnitAboveSoftMax;
  final Interval? startLoadInterval;
  final Interval? endLoadInterval;
  final String? maxLoad;

  LoadLimit({
    this.softMaxLoad,
    this.costPerUnitAboveSoftMax,
    this.startLoadInterval,
    this.endLoadInterval,
    this.maxLoad,
  });

  factory LoadLimit.fromJson(Map<String, dynamic> json) =>
      _$LoadLimitFromJson(json);

  Map<String, dynamic> toJson() => _$LoadLimitToJson(this);
}

@JsonSerializable()
class Interval {
  final String? min;
  final String? max;

  Interval({this.min, this.max});

  factory Interval.fromJson(Map<String, dynamic> json) =>
      _$IntervalFromJson(json);

  Map<String, dynamic> toJson() => _$IntervalToJson(this);
}

@JsonSerializable()
class DurationLimit {
  final String? maxDuration;
  final String? softMaxDuration;
  final String? quadraticSoftMaxDuration;
  final double? costPerHourAfterSoftMax;
  final double? costPerSquareHourAfterQuadraticSoftMax;

  DurationLimit({
    this.maxDuration,
    this.softMaxDuration,
    this.quadraticSoftMaxDuration,
    this.costPerHourAfterSoftMax,
    this.costPerSquareHourAfterQuadraticSoftMax,
  });

  factory DurationLimit.fromJson(Map<String, dynamic> json) =>
      _$DurationLimitFromJson(json);

  Map<String, dynamic> toJson() => _$DurationLimitToJson(this);
}

@JsonSerializable()
class DistanceLimit {
  final String? maxMeters;
  final String? softMaxMeters;
  final double? costPerKilometerBelowSoftMax;
  final double? costPerKilometerAboveSoftMax;

  DistanceLimit({
    this.maxMeters,
    this.softMaxMeters,
    this.costPerKilometerBelowSoftMax,
    this.costPerKilometerAboveSoftMax,
  });

  factory DistanceLimit.fromJson(Map<String, dynamic> json) =>
      _$DistanceLimitFromJson(json);

  Map<String, dynamic> toJson() => _$DistanceLimitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BreakRule {
  final List<BreakRequest> breakRequests;
  final List<FrequencyConstraint>? frequencyConstraints;

  BreakRule({required this.breakRequests, this.frequencyConstraints});

  factory BreakRule.fromJson(Map<String, dynamic> json) =>
      _$BreakRuleFromJson(json);

  Map<String, dynamic> toJson() => _$BreakRuleToJson(this);
}

@JsonSerializable()
class BreakRequest {
  final String earliestStartTime;
  final String latestStartTime;
  final String minDuration;

  BreakRequest({
    required this.earliestStartTime,
    required this.latestStartTime,
    required this.minDuration,
  });

  factory BreakRequest.fromJson(Map<String, dynamic> json) =>
      _$BreakRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BreakRequestToJson(this);
}

@JsonSerializable()
class FrequencyConstraint {
  final String minBreakDuration;
  final String maxInterBreakDuration;

  FrequencyConstraint({
    required this.minBreakDuration,
    required this.maxInterBreakDuration,
  });

  factory FrequencyConstraint.fromJson(Map<String, dynamic> json) =>
      _$FrequencyConstraintFromJson(json);

  Map<String, dynamic> toJson() => _$FrequencyConstraintToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DurationDistanceMatrix {
  final List<Row> rows;
  final String? vehicleStartTag;

  DurationDistanceMatrix({required this.rows, this.vehicleStartTag});

  factory DurationDistanceMatrix.fromJson(Map<String, dynamic> json) =>
      _$DurationDistanceMatrixFromJson(json);

  Map<String, dynamic> toJson() => _$DurationDistanceMatrixToJson(this);
}

@JsonSerializable()
class Row {
  final List<String> durations;
  final List<double>? meters;

  Row({required this.durations, this.meters});

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);

  Map<String, dynamic> toJson() => _$RowToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TransitionAttributes {
  final String? srcTag;
  final String? excludedSrcTag;
  final String? dstTag;
  final String? excludedDstTag;
  final double? cost;
  final double? costPerKilometer;
  final DistanceLimit? distanceLimit;
  final String? delay;

  TransitionAttributes({
    this.srcTag,
    this.excludedSrcTag,
    this.dstTag,
    this.excludedDstTag,
    this.cost,
    this.costPerKilometer,
    this.distanceLimit,
    this.delay,
  });

  factory TransitionAttributes.fromJson(Map<String, dynamic> json) =>
      _$TransitionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$TransitionAttributesToJson(this);
}

@JsonSerializable()
class ShipmentTypeIncompatibility {
  final List<String> types;
  @JsonKey(
    unknownEnumValue: IncompatibilityMode.INCOMPATIBILITY_MODE_UNSPECIFIED,
  )
  final IncompatibilityMode incompatibilityMode;

  ShipmentTypeIncompatibility({
    required this.types,
    required this.incompatibilityMode,
  });

  factory ShipmentTypeIncompatibility.fromJson(Map<String, dynamic> json) =>
      _$ShipmentTypeIncompatibilityFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentTypeIncompatibilityToJson(this);
}

@JsonEnum()
enum IncompatibilityMode {
  @JsonValue('INCOMPATIBILITY_MODE_UNSPECIFIED')
  INCOMPATIBILITY_MODE_UNSPECIFIED,
  @JsonValue('NOT_PERFORMED_BY_SAME_VEHICLE')
  NOT_PERFORMED_BY_SAME_VEHICLE,
  @JsonValue('NOT_IN_SAME_VEHICLE_SIMULTANEOUSLY')
  NOT_IN_SAME_VEHICLE_SIMULTANEOUSLY,
}

@JsonSerializable()
class ShipmentTypeRequirement {
  final List<String> requiredShipmentTypeAlternatives;
  final List<String> dependentShipmentTypes;
  @JsonKey(unknownEnumValue: RequirementMode.REQUIREMENT_MODE_UNSPECIFIED)
  final RequirementMode requirementMode;

  ShipmentTypeRequirement({
    required this.requiredShipmentTypeAlternatives,
    required this.dependentShipmentTypes,
    required this.requirementMode,
  });

  factory ShipmentTypeRequirement.fromJson(Map<String, dynamic> json) =>
      _$ShipmentTypeRequirementFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentTypeRequirementToJson(this);
}

@JsonEnum()
enum RequirementMode {
  @JsonValue('REQUIREMENT_MODE_UNSPECIFIED')
  REQUIREMENT_MODE_UNSPECIFIED,
  @JsonValue('PERFORMED_BY_SAME_VEHICLE')
  PERFORMED_BY_SAME_VEHICLE,
  @JsonValue('IN_SAME_VEHICLE_AT_PICKUP_TIME')
  IN_SAME_VEHICLE_AT_PICKUP_TIME,
  @JsonValue('IN_SAME_VEHICLE_AT_DELIVERY_TIME')
  IN_SAME_VEHICLE_AT_DELIVERY_TIME,
}

@JsonSerializable()
class PrecedenceRule {
  final bool? firstIsDelivery;
  final bool? secondIsDelivery;
  final String? offsetDuration;
  final int? firstIndex;
  final int? secondIndex;

  PrecedenceRule({
    this.firstIsDelivery,
    this.secondIsDelivery,
    this.offsetDuration,
    this.firstIndex,
    this.secondIndex,
  });

  factory PrecedenceRule.fromJson(Map<String, dynamic> json) =>
      _$PrecedenceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$PrecedenceRuleToJson(this);
}
