// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TripModel _$TripModelFromJson(Map<String, dynamic> json) {
  return _TripModel.fromJson(json);
}

/// @nodoc
mixin _$TripModel {
  String get id => throw _privateConstructorUsedError;
  String get passengerId => throw _privateConstructorUsedError;
  String? get driverId => throw _privateConstructorUsedError;
  LatLng get pickupLocation => throw _privateConstructorUsedError;
  LatLng get dropoffLocation => throw _privateConstructorUsedError;
  String get pickupAddress => throw _privateConstructorUsedError;
  String get dropoffAddress => throw _privateConstructorUsedError;
  TripStatus get status => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  int get passengerCount => throw _privateConstructorUsedError;
  List<String>? get waypoints => throw _privateConstructorUsedError;

  /// Serializes this TripModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripModelCopyWith<TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) then) =
      _$TripModelCopyWithImpl<$Res, TripModel>;
  @useResult
  $Res call({
    String id,
    String passengerId,
    String? driverId,
    LatLng pickupLocation,
    LatLng dropoffLocation,
    String pickupAddress,
    String dropoffAddress,
    TripStatus status,
    double? price,
    double? distance,
    int? duration,
    PaymentMethod? paymentMethod,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? createdAt,
    String? notes,
    int passengerCount,
    List<String>? waypoints,
  });
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res, $Val extends TripModel>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? passengerId = null,
    Object? driverId = freezed,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupAddress = null,
    Object? dropoffAddress = null,
    Object? status = null,
    Object? price = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? paymentMethod = freezed,
    Object? scheduledAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? notes = freezed,
    Object? passengerCount = null,
    Object? waypoints = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            passengerId: null == passengerId
                ? _value.passengerId
                : passengerId // ignore: cast_nullable_to_non_nullable
                      as String,
            driverId: freezed == driverId
                ? _value.driverId
                : driverId // ignore: cast_nullable_to_non_nullable
                      as String?,
            pickupLocation: null == pickupLocation
                ? _value.pickupLocation
                : pickupLocation // ignore: cast_nullable_to_non_nullable
                      as LatLng,
            dropoffLocation: null == dropoffLocation
                ? _value.dropoffLocation
                : dropoffLocation // ignore: cast_nullable_to_non_nullable
                      as LatLng,
            pickupAddress: null == pickupAddress
                ? _value.pickupAddress
                : pickupAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            dropoffAddress: null == dropoffAddress
                ? _value.dropoffAddress
                : dropoffAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TripStatus,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            distance: freezed == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as double?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as PaymentMethod?,
            scheduledAt: freezed == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            passengerCount: null == passengerCount
                ? _value.passengerCount
                : passengerCount // ignore: cast_nullable_to_non_nullable
                      as int,
            waypoints: freezed == waypoints
                ? _value.waypoints
                : waypoints // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TripModelImplCopyWith<$Res>
    implements $TripModelCopyWith<$Res> {
  factory _$$TripModelImplCopyWith(
    _$TripModelImpl value,
    $Res Function(_$TripModelImpl) then,
  ) = __$$TripModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String passengerId,
    String? driverId,
    LatLng pickupLocation,
    LatLng dropoffLocation,
    String pickupAddress,
    String dropoffAddress,
    TripStatus status,
    double? price,
    double? distance,
    int? duration,
    PaymentMethod? paymentMethod,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? createdAt,
    String? notes,
    int passengerCount,
    List<String>? waypoints,
  });
}

/// @nodoc
class __$$TripModelImplCopyWithImpl<$Res>
    extends _$TripModelCopyWithImpl<$Res, _$TripModelImpl>
    implements _$$TripModelImplCopyWith<$Res> {
  __$$TripModelImplCopyWithImpl(
    _$TripModelImpl _value,
    $Res Function(_$TripModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? passengerId = null,
    Object? driverId = freezed,
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? pickupAddress = null,
    Object? dropoffAddress = null,
    Object? status = null,
    Object? price = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? paymentMethod = freezed,
    Object? scheduledAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = freezed,
    Object? notes = freezed,
    Object? passengerCount = null,
    Object? waypoints = freezed,
  }) {
    return _then(
      _$TripModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        passengerId: null == passengerId
            ? _value.passengerId
            : passengerId // ignore: cast_nullable_to_non_nullable
                  as String,
        driverId: freezed == driverId
            ? _value.driverId
            : driverId // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickupLocation: null == pickupLocation
            ? _value.pickupLocation
            : pickupLocation // ignore: cast_nullable_to_non_nullable
                  as LatLng,
        dropoffLocation: null == dropoffLocation
            ? _value.dropoffLocation
            : dropoffLocation // ignore: cast_nullable_to_non_nullable
                  as LatLng,
        pickupAddress: null == pickupAddress
            ? _value.pickupAddress
            : pickupAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        dropoffAddress: null == dropoffAddress
            ? _value.dropoffAddress
            : dropoffAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TripStatus,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        distance: freezed == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as double?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod?,
        scheduledAt: freezed == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        passengerCount: null == passengerCount
            ? _value.passengerCount
            : passengerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        waypoints: freezed == waypoints
            ? _value._waypoints
            : waypoints // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TripModelImpl implements _TripModel {
  const _$TripModelImpl({
    required this.id,
    required this.passengerId,
    this.driverId,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
    this.status = TripStatus.pending,
    this.price,
    this.distance,
    this.duration,
    this.paymentMethod,
    this.scheduledAt,
    this.startedAt,
    this.completedAt,
    this.createdAt,
    this.notes,
    this.passengerCount = 1,
    final List<String>? waypoints,
  }) : _waypoints = waypoints;

  factory _$TripModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripModelImplFromJson(json);

  @override
  final String id;
  @override
  final String passengerId;
  @override
  final String? driverId;
  @override
  final LatLng pickupLocation;
  @override
  final LatLng dropoffLocation;
  @override
  final String pickupAddress;
  @override
  final String dropoffAddress;
  @override
  @JsonKey()
  final TripStatus status;
  @override
  final double? price;
  @override
  final double? distance;
  @override
  final int? duration;
  @override
  final PaymentMethod? paymentMethod;
  @override
  final DateTime? scheduledAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? createdAt;
  @override
  final String? notes;
  @override
  @JsonKey()
  final int passengerCount;
  final List<String>? _waypoints;
  @override
  List<String>? get waypoints {
    final value = _waypoints;
    if (value == null) return null;
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TripModel(id: $id, passengerId: $passengerId, driverId: $driverId, pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, pickupAddress: $pickupAddress, dropoffAddress: $dropoffAddress, status: $status, price: $price, distance: $distance, duration: $duration, paymentMethod: $paymentMethod, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, notes: $notes, passengerCount: $passengerCount, waypoints: $waypoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.passengerId, passengerId) ||
                other.passengerId == passengerId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.pickupAddress, pickupAddress) ||
                other.pickupAddress == pickupAddress) &&
            (identical(other.dropoffAddress, dropoffAddress) ||
                other.dropoffAddress == dropoffAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.passengerCount, passengerCount) ||
                other.passengerCount == passengerCount) &&
            const DeepCollectionEquality().equals(
              other._waypoints,
              _waypoints,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    passengerId,
    driverId,
    pickupLocation,
    dropoffLocation,
    pickupAddress,
    dropoffAddress,
    status,
    price,
    distance,
    duration,
    paymentMethod,
    scheduledAt,
    startedAt,
    completedAt,
    createdAt,
    notes,
    passengerCount,
    const DeepCollectionEquality().hash(_waypoints),
  ]);

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      __$$TripModelImplCopyWithImpl<_$TripModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripModelImplToJson(this);
  }
}

abstract class _TripModel implements TripModel {
  const factory _TripModel({
    required final String id,
    required final String passengerId,
    final String? driverId,
    required final LatLng pickupLocation,
    required final LatLng dropoffLocation,
    required final String pickupAddress,
    required final String dropoffAddress,
    final TripStatus status,
    final double? price,
    final double? distance,
    final int? duration,
    final PaymentMethod? paymentMethod,
    final DateTime? scheduledAt,
    final DateTime? startedAt,
    final DateTime? completedAt,
    final DateTime? createdAt,
    final String? notes,
    final int passengerCount,
    final List<String>? waypoints,
  }) = _$TripModelImpl;

  factory _TripModel.fromJson(Map<String, dynamic> json) =
      _$TripModelImpl.fromJson;

  @override
  String get id;
  @override
  String get passengerId;
  @override
  String? get driverId;
  @override
  LatLng get pickupLocation;
  @override
  LatLng get dropoffLocation;
  @override
  String get pickupAddress;
  @override
  String get dropoffAddress;
  @override
  TripStatus get status;
  @override
  double? get price;
  @override
  double? get distance;
  @override
  int? get duration;
  @override
  PaymentMethod? get paymentMethod;
  @override
  DateTime? get scheduledAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get createdAt;
  @override
  String? get notes;
  @override
  int get passengerCount;
  @override
  List<String>? get waypoints;

  /// Create a copy of TripModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
