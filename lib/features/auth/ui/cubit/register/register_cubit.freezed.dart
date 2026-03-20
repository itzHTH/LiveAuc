// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState()';
}


}

/// @nodoc
class $RegisterStateCopyWith<$Res>  {
$RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( OtpSent value)?  otpSent,TResult Function( VerifyOtpSuccess value)?  verifyOtpSuccess,TResult Function( RegisterSuccess value)?  registerSuccess,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case OtpSent() when otpSent != null:
return otpSent(_that);case VerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( OtpSent value)  otpSent,required TResult Function( VerifyOtpSuccess value)  verifyOtpSuccess,required TResult Function( RegisterSuccess value)  registerSuccess,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case OtpSent():
return otpSent(_that);case VerifyOtpSuccess():
return verifyOtpSuccess(_that);case RegisterSuccess():
return registerSuccess(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( OtpSent value)?  otpSent,TResult? Function( VerifyOtpSuccess value)?  verifyOtpSuccess,TResult? Function( RegisterSuccess value)?  registerSuccess,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case OtpSent() when otpSent != null:
return otpSent(_that);case VerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  otpSent,TResult Function( String registerToken)?  verifyOtpSuccess,TResult Function( Auth auth)?  registerSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case OtpSent() when otpSent != null:
return otpSent();case VerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that.registerToken);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.auth);case Error() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  otpSent,required TResult Function( String registerToken)  verifyOtpSuccess,required TResult Function( Auth auth)  registerSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case OtpSent():
return otpSent();case VerifyOtpSuccess():
return verifyOtpSuccess(_that.registerToken);case RegisterSuccess():
return registerSuccess(_that.auth);case Error():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  otpSent,TResult? Function( String registerToken)?  verifyOtpSuccess,TResult? Function( Auth auth)?  registerSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case OtpSent() when otpSent != null:
return otpSent();case VerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that.registerToken);case RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.auth);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements RegisterState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.initial()';
}


}




/// @nodoc


class Loading implements RegisterState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.loading()';
}


}




/// @nodoc


class OtpSent implements RegisterState {
  const OtpSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterState.otpSent()';
}


}




/// @nodoc


class VerifyOtpSuccess implements RegisterState {
  const VerifyOtpSuccess(this.registerToken);
  

 final  String registerToken;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpSuccessCopyWith<VerifyOtpSuccess> get copyWith => _$VerifyOtpSuccessCopyWithImpl<VerifyOtpSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpSuccess&&(identical(other.registerToken, registerToken) || other.registerToken == registerToken));
}


@override
int get hashCode => Object.hash(runtimeType,registerToken);

@override
String toString() {
  return 'RegisterState.verifyOtpSuccess(registerToken: $registerToken)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $VerifyOtpSuccessCopyWith(VerifyOtpSuccess value, $Res Function(VerifyOtpSuccess) _then) = _$VerifyOtpSuccessCopyWithImpl;
@useResult
$Res call({
 String registerToken
});




}
/// @nodoc
class _$VerifyOtpSuccessCopyWithImpl<$Res>
    implements $VerifyOtpSuccessCopyWith<$Res> {
  _$VerifyOtpSuccessCopyWithImpl(this._self, this._then);

  final VerifyOtpSuccess _self;
  final $Res Function(VerifyOtpSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? registerToken = null,}) {
  return _then(VerifyOtpSuccess(
null == registerToken ? _self.registerToken : registerToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterSuccess implements RegisterState {
  const RegisterSuccess(this.auth);
  

 final  Auth auth;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSuccessCopyWith<RegisterSuccess> get copyWith => _$RegisterSuccessCopyWithImpl<RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSuccess&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'RegisterState.registerSuccess(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $RegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterSuccessCopyWith(RegisterSuccess value, $Res Function(RegisterSuccess) _then) = _$RegisterSuccessCopyWithImpl;
@useResult
$Res call({
 Auth auth
});




}
/// @nodoc
class _$RegisterSuccessCopyWithImpl<$Res>
    implements $RegisterSuccessCopyWith<$Res> {
  _$RegisterSuccessCopyWithImpl(this._self, this._then);

  final RegisterSuccess _self;
  final $Res Function(RegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(RegisterSuccess(
null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as Auth,
  ));
}


}

/// @nodoc


class Error implements RegisterState {
  const Error(this.error);
  

 final  String error;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RegisterState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
