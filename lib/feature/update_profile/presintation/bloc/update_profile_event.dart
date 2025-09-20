part of 'update_profile_bloc.dart';

abstract class UpdateProfileEvent {}

class UpdateBtnEvent extends UpdateProfileEvent {
  String? name;
  int? avaterId;
  String? phone;
  String? email;

  UpdateBtnEvent({this.email, this.name, this.phone, this.avaterId});
}

class DeleteProfileEvent extends UpdateProfileEvent {}