// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_routing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) =>
    ShipmentModel(
      shipments: (json['shipments'] as List<dynamic>)
          .map((e) => Shipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
      globalStartTime: json['globalStartTime'] as String,
      globalEndTime: json['globalEndTime'] as String,
      globalDurationCostPerHour:
          (json['globalDurationCostPerHour'] as num?)?.toDouble(),
      durationDistanceMatrices: (json['durationDistanceMatrices']
              as List<dynamic>?)
          ?.map(
              (e) => DurationDistanceMatrix.fromJson(e as Map<String, dynamic>))
          .toList(),
      durationDistanceMatrixSrcTags:
          (json['durationDistanceMatrixSrcTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      durationDistanceMatrixDstTags:
          (json['durationDistanceMatrixDstTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      transitionAttributes: (json['transitionAttributes'] as List<dynamic>?)
          ?.map((e) => TransitionAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipmentTypeIncompatibilities: (json['shipmentTypeIncompatibilities']
              as List<dynamic>?)
          ?.map((e) =>
              ShipmentTypeIncompatibility.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipmentTypeRequirements:
          (json['shipmentTypeRequirements'] as List<dynamic>?)
              ?.map((e) =>
                  ShipmentTypeRequirement.fromJson(e as Map<String, dynamic>))
              .toList(),
      precedenceRules: (json['precedenceRules'] as List<dynamic>?)
          ?.map((e) => PrecedenceRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxActiveVehicles: (json['maxActiveVehicles'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipmentModelToJson(ShipmentModel instance) =>
    <String, dynamic>{
      'shipments': instance.shipments.map((e) => e.toJson()).toList(),
      'vehicles': instance.vehicles.map((e) => e.toJson()).toList(),
      'globalStartTime': instance.globalStartTime,
      'globalEndTime': instance.globalEndTime,
      'globalDurationCostPerHour': instance.globalDurationCostPerHour,
      'durationDistanceMatrices':
          instance.durationDistanceMatrices?.map((e) => e.toJson()).toList(),
      'durationDistanceMatrixSrcTags': instance.durationDistanceMatrixSrcTags,
      'durationDistanceMatrixDstTags': instance.durationDistanceMatrixDstTags,
      'transitionAttributes':
          instance.transitionAttributes?.map((e) => e.toJson()).toList(),
      'shipmentTypeIncompatibilities': instance.shipmentTypeIncompatibilities
          ?.map((e) => e.toJson())
          .toList(),
      'shipmentTypeRequirements':
          instance.shipmentTypeRequirements?.map((e) => e.toJson()).toList(),
      'precedenceRules':
          instance.precedenceRules?.map((e) => e.toJson()).toList(),
      'maxActiveVehicles': instance.maxActiveVehicles,
    };

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      displayName: json['displayName'] as String?,
      pickups: (json['pickups'] as List<dynamic>)
          .map((e) => VisitRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveries: (json['deliveries'] as List<dynamic>)
          .map((e) => VisitRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      loadDemands: (json['loadDemands'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Load.fromJson(e as Map<String, dynamic>)),
      ),
      allowedVehicleIndices: (json['allowedVehicleIndices'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      costsPerVehicle: (json['costsPerVehicle'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      costsPerVehicleIndices: (json['costsPerVehicleIndices'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      pickupToDeliveryAbsoluteDetourLimit:
          json['pickupToDeliveryAbsoluteDetourLimit'] as String?,
      pickupToDeliveryTimeLimit: json['pickupToDeliveryTimeLimit'] as String?,
      shipmentType: json['shipmentType'] as String?,
      label: json['label'] as String?,
      ignore: json['ignore'] as bool?,
      penaltyCost: (json['penaltyCost'] as num?)?.toDouble(),
      pickupToDeliveryRelativeDetourLimit:
          (json['pickupToDeliveryRelativeDetourLimit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'pickups': instance.pickups.map((e) => e.toJson()).toList(),
      'deliveries': instance.deliveries.map((e) => e.toJson()).toList(),
      'loadDemands':
          instance.loadDemands?.map((k, e) => MapEntry(k, e.toJson())),
      'allowedVehicleIndices': instance.allowedVehicleIndices,
      'costsPerVehicle': instance.costsPerVehicle,
      'costsPerVehicleIndices': instance.costsPerVehicleIndices,
      'pickupToDeliveryAbsoluteDetourLimit':
          instance.pickupToDeliveryAbsoluteDetourLimit,
      'pickupToDeliveryTimeLimit': instance.pickupToDeliveryTimeLimit,
      'shipmentType': instance.shipmentType,
      'label': instance.label,
      'ignore': instance.ignore,
      'penaltyCost': instance.penaltyCost,
      'pickupToDeliveryRelativeDetourLimit':
          instance.pickupToDeliveryRelativeDetourLimit,
    };

VisitRequest _$VisitRequestFromJson(Map<String, dynamic> json) => VisitRequest(
      arrivalLocation: json['arrivalLocation'] == null
          ? null
          : LatLng.fromJson(json['arrivalLocation'] as Map<String, dynamic>),
      arrivalWaypoint: json['arrivalWaypoint'] == null
          ? null
          : Waypoint.fromJson(json['arrivalWaypoint'] as Map<String, dynamic>),
      departureLocation: json['departureLocation'] == null
          ? null
          : LatLng.fromJson(json['departureLocation'] as Map<String, dynamic>),
      departureWaypoint: json['departureWaypoint'] == null
          ? null
          : Waypoint.fromJson(
              json['departureWaypoint'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      timeWindows: (json['timeWindows'] as List<dynamic>)
          .map((e) => TimeWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      cost: (json['cost'] as num?)?.toDouble(),
      loadDemands: (json['loadDemands'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Load.fromJson(e as Map<String, dynamic>)),
      ),
      visitTypes: (json['visitTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$VisitRequestToJson(VisitRequest instance) =>
    <String, dynamic>{
      'arrivalLocation': instance.arrivalLocation?.toJson(),
      'arrivalWaypoint': instance.arrivalWaypoint?.toJson(),
      'departureLocation': instance.departureLocation?.toJson(),
      'departureWaypoint': instance.departureWaypoint?.toJson(),
      'tags': instance.tags,
      'timeWindows': instance.timeWindows.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'cost': instance.cost,
      'loadDemands':
          instance.loadDemands?.map((k, e) => MapEntry(k, e.toJson())),
      'visitTypes': instance.visitTypes,
      'label': instance.label,
    };

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      sideOfRoad: json['sideOfRoad'] as bool?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      placeId: json['placeId'] as String?,
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'sideOfRoad': instance.sideOfRoad,
      'location': instance.location?.toJson(),
      'placeId': instance.placeId,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latLng: LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
      heading: (json['heading'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latLng': instance.latLng,
      'heading': instance.heading,
    };

TimeWindow _$TimeWindowFromJson(Map<String, dynamic> json) => TimeWindow(
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      softStartTime: json['softStartTime'] as String?,
      softEndTime: json['softEndTime'] as String?,
      costPerHourBeforeSoftStartTime:
          (json['costPerHourBeforeSoftStartTime'] as num?)?.toDouble(),
      costPerHourAfterSoftEndTime:
          (json['costPerHourAfterSoftEndTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TimeWindowToJson(TimeWindow instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'softStartTime': instance.softStartTime,
      'softEndTime': instance.softEndTime,
      'costPerHourBeforeSoftStartTime': instance.costPerHourBeforeSoftStartTime,
      'costPerHourAfterSoftEndTime': instance.costPerHourAfterSoftEndTime,
    };

Load _$LoadFromJson(Map<String, dynamic> json) => Load(
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$LoadToJson(Load instance) => <String, dynamic>{
      'amount': instance.amount,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      displayName: json['displayName'] as String?,
      travelMode: $enumDecodeNullable(_$TravelModeEnumMap, json['travelMode'],
          unknownValue: TravelMode.TRAVEL_MODE_UNSPECIFIED),
      routeModifiers: json['routeModifiers'] == null
          ? null
          : RouteModifiers.fromJson(
              json['routeModifiers'] as Map<String, dynamic>),
      startLocation: json['startLocation'] == null
          ? null
          : LatLng.fromJson(json['startLocation'] as Map<String, dynamic>),
      startWaypoint: json['startWaypoint'] == null
          ? null
          : Waypoint.fromJson(json['startWaypoint'] as Map<String, dynamic>),
      endLocation: json['endLocation'] == null
          ? null
          : LatLng.fromJson(json['endLocation'] as Map<String, dynamic>),
      endWaypoint: json['endWaypoint'] == null
          ? null
          : Waypoint.fromJson(json['endWaypoint'] as Map<String, dynamic>),
      startTags: (json['startTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      endTags:
          (json['endTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      startTimeWindows: (json['startTimeWindows'] as List<dynamic>?)
          ?.map((e) => TimeWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTimeWindows: (json['endTimeWindows'] as List<dynamic>?)
          ?.map((e) => TimeWindow.fromJson(e as Map<String, dynamic>))
          .toList(),
      unloadingPolicy: $enumDecodeNullable(
          _$UnloadingPolicyEnumMap, json['unloadingPolicy'],
          unknownValue: UnloadingPolicy.UNLOADING_POLICY_UNSPECIFIED),
      loadLimits: (json['loadLimits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, LoadLimit.fromJson(e as Map<String, dynamic>)),
      ),
      costPerHour: (json['costPerHour'] as num?)?.toDouble(),
      costPerTraveledHour: (json['costPerTraveledHour'] as num?)?.toDouble(),
      costPerKilometer: (json['costPerKilometer'] as num?)?.toDouble(),
      fixedCost: (json['fixedCost'] as num?)?.toDouble(),
      usedIfRouteIsEmpty: json['usedIfRouteIsEmpty'] as bool?,
      routeDurationLimit: json['routeDurationLimit'] == null
          ? null
          : DurationLimit.fromJson(
              json['routeDurationLimit'] as Map<String, dynamic>),
      travelDurationLimit: json['travelDurationLimit'] == null
          ? null
          : DurationLimit.fromJson(
              json['travelDurationLimit'] as Map<String, dynamic>),
      routeDistanceLimit: json['routeDistanceLimit'] == null
          ? null
          : DistanceLimit.fromJson(
              json['routeDistanceLimit'] as Map<String, dynamic>),
      extraVisitDurationForVisitType:
          (json['extraVisitDurationForVisitType'] as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      breakRule: json['breakRule'] == null
          ? null
          : BreakRule.fromJson(json['breakRule'] as Map<String, dynamic>),
      label: json['label'] as String?,
      ignore: json['ignore'] as bool?,
      travelDurationMultiple:
          (json['travelDurationMultiple'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'travelMode': _$TravelModeEnumMap[instance.travelMode],
      'routeModifiers': instance.routeModifiers?.toJson(),
      'startLocation': instance.startLocation?.toJson(),
      'startWaypoint': instance.startWaypoint?.toJson(),
      'endLocation': instance.endLocation?.toJson(),
      'endWaypoint': instance.endWaypoint?.toJson(),
      'startTags': instance.startTags,
      'endTags': instance.endTags,
      'startTimeWindows':
          instance.startTimeWindows?.map((e) => e.toJson()).toList(),
      'endTimeWindows':
          instance.endTimeWindows?.map((e) => e.toJson()).toList(),
      'unloadingPolicy': _$UnloadingPolicyEnumMap[instance.unloadingPolicy],
      'loadLimits': instance.loadLimits?.map((k, e) => MapEntry(k, e.toJson())),
      'costPerHour': instance.costPerHour,
      'costPerTraveledHour': instance.costPerTraveledHour,
      'costPerKilometer': instance.costPerKilometer,
      'fixedCost': instance.fixedCost,
      'usedIfRouteIsEmpty': instance.usedIfRouteIsEmpty,
      'routeDurationLimit': instance.routeDurationLimit?.toJson(),
      'travelDurationLimit': instance.travelDurationLimit?.toJson(),
      'routeDistanceLimit': instance.routeDistanceLimit?.toJson(),
      'extraVisitDurationForVisitType': instance.extraVisitDurationForVisitType,
      'breakRule': instance.breakRule?.toJson(),
      'label': instance.label,
      'ignore': instance.ignore,
      'travelDurationMultiple': instance.travelDurationMultiple,
    };

const _$TravelModeEnumMap = {
  TravelMode.TRAVEL_MODE_UNSPECIFIED: 'TRAVEL_MODE_UNSPECIFIED',
  TravelMode.DRIVING: 'DRIVING',
  TravelMode.WALKING: 'WALKING',
};

const _$UnloadingPolicyEnumMap = {
  UnloadingPolicy.UNLOADING_POLICY_UNSPECIFIED: 'UNLOADING_POLICY_UNSPECIFIED',
  UnloadingPolicy.LAST_IN_FIRST_OUT: 'LAST_IN_FIRST_OUT',
  UnloadingPolicy.FIRST_IN_FIRST_OUT: 'FIRST_IN_FIRST_OUT',
};

RouteModifiers _$RouteModifiersFromJson(Map<String, dynamic> json) =>
    RouteModifiers(
      avoidTolls: json['avoidTolls'] as bool?,
      avoidHighways: json['avoidHighways'] as bool?,
      avoidFerries: json['avoidFerries'] as bool?,
      avoidIndoor: json['avoidIndoor'] as bool?,
    );

Map<String, dynamic> _$RouteModifiersToJson(RouteModifiers instance) =>
    <String, dynamic>{
      'avoidTolls': instance.avoidTolls,
      'avoidHighways': instance.avoidHighways,
      'avoidFerries': instance.avoidFerries,
      'avoidIndoor': instance.avoidIndoor,
    };

LoadLimit _$LoadLimitFromJson(Map<String, dynamic> json) => LoadLimit(
      softMaxLoad: json['softMaxLoad'] as String?,
      costPerUnitAboveSoftMax:
          (json['costPerUnitAboveSoftMax'] as num?)?.toDouble(),
      startLoadInterval: json['startLoadInterval'] == null
          ? null
          : Interval.fromJson(
              json['startLoadInterval'] as Map<String, dynamic>),
      endLoadInterval: json['endLoadInterval'] == null
          ? null
          : Interval.fromJson(json['endLoadInterval'] as Map<String, dynamic>),
      maxLoad: json['maxLoad'] as String?,
    );

Map<String, dynamic> _$LoadLimitToJson(LoadLimit instance) => <String, dynamic>{
      'softMaxLoad': instance.softMaxLoad,
      'costPerUnitAboveSoftMax': instance.costPerUnitAboveSoftMax,
      'startLoadInterval': instance.startLoadInterval?.toJson(),
      'endLoadInterval': instance.endLoadInterval?.toJson(),
      'maxLoad': instance.maxLoad,
    };

Interval _$IntervalFromJson(Map<String, dynamic> json) => Interval(
      min: json['min'] as String?,
      max: json['max'] as String?,
    );

Map<String, dynamic> _$IntervalToJson(Interval instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

DurationLimit _$DurationLimitFromJson(Map<String, dynamic> json) =>
    DurationLimit(
      maxDuration: json['maxDuration'] as String?,
      softMaxDuration: json['softMaxDuration'] as String?,
      quadraticSoftMaxDuration: json['quadraticSoftMaxDuration'] as String?,
      costPerHourAfterSoftMax:
          (json['costPerHourAfterSoftMax'] as num?)?.toDouble(),
      costPerSquareHourAfterQuadraticSoftMax:
          (json['costPerSquareHourAfterQuadraticSoftMax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DurationLimitToJson(DurationLimit instance) =>
    <String, dynamic>{
      'maxDuration': instance.maxDuration,
      'softMaxDuration': instance.softMaxDuration,
      'quadraticSoftMaxDuration': instance.quadraticSoftMaxDuration,
      'costPerHourAfterSoftMax': instance.costPerHourAfterSoftMax,
      'costPerSquareHourAfterQuadraticSoftMax':
          instance.costPerSquareHourAfterQuadraticSoftMax,
    };

DistanceLimit _$DistanceLimitFromJson(Map<String, dynamic> json) =>
    DistanceLimit(
      maxMeters: json['maxMeters'] as String?,
      softMaxMeters: json['softMaxMeters'] as String?,
      costPerKilometerBelowSoftMax:
          (json['costPerKilometerBelowSoftMax'] as num?)?.toDouble(),
      costPerKilometerAboveSoftMax:
          (json['costPerKilometerAboveSoftMax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DistanceLimitToJson(DistanceLimit instance) =>
    <String, dynamic>{
      'maxMeters': instance.maxMeters,
      'softMaxMeters': instance.softMaxMeters,
      'costPerKilometerBelowSoftMax': instance.costPerKilometerBelowSoftMax,
      'costPerKilometerAboveSoftMax': instance.costPerKilometerAboveSoftMax,
    };

BreakRule _$BreakRuleFromJson(Map<String, dynamic> json) => BreakRule(
      breakRequests: (json['breakRequests'] as List<dynamic>)
          .map((e) => BreakRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      frequencyConstraints: (json['frequencyConstraints'] as List<dynamic>?)
          ?.map((e) => FrequencyConstraint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreakRuleToJson(BreakRule instance) => <String, dynamic>{
      'breakRequests': instance.breakRequests.map((e) => e.toJson()).toList(),
      'frequencyConstraints':
          instance.frequencyConstraints?.map((e) => e.toJson()).toList(),
    };

BreakRequest _$BreakRequestFromJson(Map<String, dynamic> json) => BreakRequest(
      earliestStartTime: json['earliestStartTime'] as String,
      latestStartTime: json['latestStartTime'] as String,
      minDuration: json['minDuration'] as String,
    );

Map<String, dynamic> _$BreakRequestToJson(BreakRequest instance) =>
    <String, dynamic>{
      'earliestStartTime': instance.earliestStartTime,
      'latestStartTime': instance.latestStartTime,
      'minDuration': instance.minDuration,
    };

FrequencyConstraint _$FrequencyConstraintFromJson(Map<String, dynamic> json) =>
    FrequencyConstraint(
      minBreakDuration: json['minBreakDuration'] as String,
      maxInterBreakDuration: json['maxInterBreakDuration'] as String,
    );

Map<String, dynamic> _$FrequencyConstraintToJson(
        FrequencyConstraint instance) =>
    <String, dynamic>{
      'minBreakDuration': instance.minBreakDuration,
      'maxInterBreakDuration': instance.maxInterBreakDuration,
    };

DurationDistanceMatrix _$DurationDistanceMatrixFromJson(
        Map<String, dynamic> json) =>
    DurationDistanceMatrix(
      rows: (json['rows'] as List<dynamic>)
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleStartTag: json['vehicleStartTag'] as String?,
    );

Map<String, dynamic> _$DurationDistanceMatrixToJson(
        DurationDistanceMatrix instance) =>
    <String, dynamic>{
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'vehicleStartTag': instance.vehicleStartTag,
    };

Row _$RowFromJson(Map<String, dynamic> json) => Row(
      durations:
          (json['durations'] as List<dynamic>).map((e) => e as String).toList(),
      meters: (json['meters'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$RowToJson(Row instance) => <String, dynamic>{
      'durations': instance.durations,
      'meters': instance.meters,
    };

TransitionAttributes _$TransitionAttributesFromJson(
        Map<String, dynamic> json) =>
    TransitionAttributes(
      srcTag: json['srcTag'] as String?,
      excludedSrcTag: json['excludedSrcTag'] as String?,
      dstTag: json['dstTag'] as String?,
      excludedDstTag: json['excludedDstTag'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      costPerKilometer: (json['costPerKilometer'] as num?)?.toDouble(),
      distanceLimit: json['distanceLimit'] == null
          ? null
          : DistanceLimit.fromJson(
              json['distanceLimit'] as Map<String, dynamic>),
      delay: json['delay'] as String?,
    );

Map<String, dynamic> _$TransitionAttributesToJson(
        TransitionAttributes instance) =>
    <String, dynamic>{
      'srcTag': instance.srcTag,
      'excludedSrcTag': instance.excludedSrcTag,
      'dstTag': instance.dstTag,
      'excludedDstTag': instance.excludedDstTag,
      'cost': instance.cost,
      'costPerKilometer': instance.costPerKilometer,
      'distanceLimit': instance.distanceLimit?.toJson(),
      'delay': instance.delay,
    };

ShipmentTypeIncompatibility _$ShipmentTypeIncompatibilityFromJson(
        Map<String, dynamic> json) =>
    ShipmentTypeIncompatibility(
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      incompatibilityMode: $enumDecode(
          _$IncompatibilityModeEnumMap, json['incompatibilityMode'],
          unknownValue: IncompatibilityMode.INCOMPATIBILITY_MODE_UNSPECIFIED),
    );

Map<String, dynamic> _$ShipmentTypeIncompatibilityToJson(
        ShipmentTypeIncompatibility instance) =>
    <String, dynamic>{
      'types': instance.types,
      'incompatibilityMode':
          _$IncompatibilityModeEnumMap[instance.incompatibilityMode]!,
    };

const _$IncompatibilityModeEnumMap = {
  IncompatibilityMode.INCOMPATIBILITY_MODE_UNSPECIFIED:
      'INCOMPATIBILITY_MODE_UNSPECIFIED',
  IncompatibilityMode.NOT_PERFORMED_BY_SAME_VEHICLE:
      'NOT_PERFORMED_BY_SAME_VEHICLE',
  IncompatibilityMode.NOT_IN_SAME_VEHICLE_SIMULTANEOUSLY:
      'NOT_IN_SAME_VEHICLE_SIMULTANEOUSLY',
};

ShipmentTypeRequirement _$ShipmentTypeRequirementFromJson(
        Map<String, dynamic> json) =>
    ShipmentTypeRequirement(
      requiredShipmentTypeAlternatives:
          (json['requiredShipmentTypeAlternatives'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      dependentShipmentTypes: (json['dependentShipmentTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      requirementMode: $enumDecode(
          _$RequirementModeEnumMap, json['requirementMode'],
          unknownValue: RequirementMode.REQUIREMENT_MODE_UNSPECIFIED),
    );

Map<String, dynamic> _$ShipmentTypeRequirementToJson(
        ShipmentTypeRequirement instance) =>
    <String, dynamic>{
      'requiredShipmentTypeAlternatives':
          instance.requiredShipmentTypeAlternatives,
      'dependentShipmentTypes': instance.dependentShipmentTypes,
      'requirementMode': _$RequirementModeEnumMap[instance.requirementMode]!,
    };

const _$RequirementModeEnumMap = {
  RequirementMode.REQUIREMENT_MODE_UNSPECIFIED: 'REQUIREMENT_MODE_UNSPECIFIED',
  RequirementMode.PERFORMED_BY_SAME_VEHICLE: 'PERFORMED_BY_SAME_VEHICLE',
  RequirementMode.IN_SAME_VEHICLE_AT_PICKUP_TIME:
      'IN_SAME_VEHICLE_AT_PICKUP_TIME',
  RequirementMode.IN_SAME_VEHICLE_AT_DELIVERY_TIME:
      'IN_SAME_VEHICLE_AT_DELIVERY_TIME',
};

PrecedenceRule _$PrecedenceRuleFromJson(Map<String, dynamic> json) =>
    PrecedenceRule(
      firstIsDelivery: json['firstIsDelivery'] as bool?,
      secondIsDelivery: json['secondIsDelivery'] as bool?,
      offsetDuration: json['offsetDuration'] as String?,
      firstIndex: (json['firstIndex'] as num?)?.toInt(),
      secondIndex: (json['secondIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrecedenceRuleToJson(PrecedenceRule instance) =>
    <String, dynamic>{
      'firstIsDelivery': instance.firstIsDelivery,
      'secondIsDelivery': instance.secondIsDelivery,
      'offsetDuration': instance.offsetDuration,
      'firstIndex': instance.firstIndex,
      'secondIndex': instance.secondIndex,
    };
