// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState()';
}


}

/// @nodoc
class $ForgetPasswordStateCopyWith<$Res>  {
$ForgetPasswordStateCopyWith(ForgetPasswordState _, $Res Function(ForgetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgetPasswordState].
extension ForgetPasswordStatePatterns on ForgetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( FpLoading value)?  loading,TResult Function( FpOtpSent value)?  otpSent,TResult Function( FpVerifyOtpSuccess value)?  verifyOtpSuccess,TResult Function( FpResetSuccess value)?  resetSuccess,TResult Function( FpError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case FpLoading() when loading != null:
return loading(_that);case FpOtpSent() when otpSent != null:
return otpSent(_that);case FpVerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that);case FpResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case FpError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( FpLoading value)  loading,required TResult Function( FpOtpSent value)  otpSent,required TResult Function( FpVerifyOtpSuccess value)  verifyOtpSuccess,required TResult Function( FpResetSuccess value)  resetSuccess,required TResult Function( FpError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case FpLoading():
return loading(_that);case FpOtpSent():
return otpSent(_that);case FpVerifyOtpSuccess():
return verifyOtpSuccess(_that);case FpResetSuccess():
return resetSuccess(_that);case FpError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( FpLoading value)?  loading,TResult? Function( FpOtpSent value)?  otpSent,TResult? Function( FpVerifyOtpSuccess value)?  verifyOtpSuccess,TResult? Function( FpResetSuccess value)?  resetSuccess,TResult? Function( FpError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case FpLoading() when loading != null:
return loading(_that);case FpOtpSent() when otpSent != null:
return otpSent(_that);case FpVerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that);case FpResetSuccess() when resetSuccess != null:
return resetSuccess(_that);case FpError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  otpSent,TResult Function( String resetToken)?  verifyOtpSuccess,TResult Function()?  resetSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case FpLoading() when loading != null:
return loading();case FpOtpSent() when otpSent != null:
return otpSent();case FpVerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that.resetToken);case FpResetSuccess() when resetSuccess != null:
return resetSuccess();case FpError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  otpSent,required TResult Function( String resetToken)  verifyOtpSuccess,required TResult Function()  resetSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case FpLoading():
return loading();case FpOtpSent():
return otpSent();case FpVerifyOtpSuccess():
return verifyOtpSuccess(_that.resetToken);case FpResetSuccess():
return resetSuccess();case FpError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  otpSent,TResult? Function( String resetToken)?  verifyOtpSuccess,TResult? Function()?  resetSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case FpLoading() when loading != null:
return loading();case FpOtpSent() when otpSent != null:
return otpSent();case FpVerifyOtpSuccess() when verifyOtpSuccess != null:
return verifyOtpSuccess(_that.resetToken);case FpResetSuccess() when resetSuccess != null:
return resetSuccess();case FpError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgetPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.initial()';
}


}




/// @nodoc


class FpLoading implements ForgetPasswordState {
  const FpLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FpLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.loading()';
}


}




/// @nodoc


class FpOtpSent implements ForgetPasswordState {
  const FpOtpSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FpOtpSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.otpSent()';
}


}




/// @nodoc


class FpVerifyOtpSuccess implements ForgetPasswordState {
  const FpVerifyOtpSuccess(this.resetToken);
  

 final  String resetToken;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FpVerifyOtpSuccessCopyWith<FpVerifyOtpSuccess> get copyWith => _$FpVerifyOtpSuccessCopyWithImpl<FpVerifyOtpSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FpVerifyOtpSuccess&&(identical(other.resetToken, resetToken) || other.resetToken == resetToken));
}


@override
int get hashCode => Object.hash(runtimeType,resetToken);

@override
String toString() {
  return 'ForgetPasswordState.verifyOtpSuccess(resetToken: $resetToken)';
}


}

/// @nodoc
abstract mixin class $FpVerifyOtpSuccessCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $FpVerifyOtpSuccessCopyWith(FpVerifyOtpSuccess value, $Res Function(FpVerifyOtpSuccess) _then) = _$FpVerifyOtpSuccessCopyWithImpl;
@useResult
$Res call({
 String resetToken
});




}
/// @nodoc
class _$FpVerifyOtpSuccessCopyWithImpl<$Res>
    implements $FpVerifyOtpSuccessCopyWith<$Res> {
  _$FpVerifyOtpSuccessCopyWithImpl(this._self, this._then);

  final FpVerifyOtpSuccess _self;
  final $Res Function(FpVerifyOtpSuccess) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resetToken = null,}) {
  return _then(FpVerifyOtpSuccess(
null == resetToken ? _self.resetToken : resetToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FpResetSuccess implements ForgetPasswordState {
  const FpResetSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FpResetSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.resetSuccess()';
}


}




/// @nodoc


class FpError implements ForgetPasswordState {
  const FpError(this.error);
  

 final  String error;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FpErrorCopyWith<FpError> get copyWith => _$FpErrorCopyWithImpl<FpError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FpError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ForgetPasswordState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $FpErrorCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $FpErrorCopyWith(FpError value, $Res Function(FpError) _then) = _$FpErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$FpErrorCopyWithImpl<$Res>
    implements $FpErrorCopyWith<$Res> {
  _$FpErrorCopyWithImpl(this._self, this._then);

  final FpError _self;
  final $Res Function(FpError) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FpError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
