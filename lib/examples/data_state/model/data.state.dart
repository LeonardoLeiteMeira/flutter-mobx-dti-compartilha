import 'package:flutter/material.dart' show SizedBox, Widget;
import 'package:mobx/mobx.dart';

part 'data.state.g.dart';

typedef Initial = Widget Function();
typedef Success<T> = Widget Function(T? data);
typedef SuccessLoadable<T> = Widget Function(T? data, bool loading);
typedef Error = Widget Function(String? error);

typedef LoadingResult = void Function(bool loading);
typedef SuccessResult<T> = void Function(T? data);
typedef ErrorResult = void Function(String? error);

enum StateType { INITIAL, SUCCESS, RELOADING, ERROR }

class DataState<T> = _DataStateBase<T> with _$DataState;

abstract class _DataStateBase<T> with Store {
  _DataStateBase({StateType state = StateType.INITIAL}) : _state = state;

  @observable
  StateType _state;

  StateType get state => _state;

  T? _data;
  T? get data => _data;

  String? _error;
  String? get error => _error;

  @action
  void setInitial() {
    _state = StateType.INITIAL;
  }

  @action
  void setLoading() {
    _state = StateType.RELOADING;
  }

  @action
  void setData(T? data) {
    _state = StateType.SUCCESS;
    _data = data;
  }

  @action
  void setError(String? error) {
    _state = StateType.ERROR;
    _error = error;
  }

  Widget handleState(Initial initial, Success<T> success, [Error? error]) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        if (error == null) {
          return const SizedBox();
        } else {
          return error(_error);
        }
      default:
        return success(_data);
    }
  }

  Widget handleStateReloadable(
      Initial initial, SuccessLoadable<T> successLoadable,
      [Error? error]) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        if (error == null) {
          return const SizedBox();
        } else {
          return error(_error);
        }
      default:
        return successLoadable(_data, _state == StateType.RELOADING);
    }
  }

  ReactionDisposer handleReactionState(
      {LoadingResult? loading, SuccessResult<T>? success, ErrorResult? error}) {
    return reaction((_) => _state, (_) {
      switch (_state) {
        case StateType.RELOADING:
          if (loading != null) loading(true);
          break;
        case StateType.ERROR:
          if (loading != null) loading(false);
          if (error != null) error(_error);
          break;
        case StateType.SUCCESS:
          if (loading != null) loading(false);
          if (success != null) success(_data);
          break;
        case StateType.INITIAL:
          break;
      }
    });
  }
}
