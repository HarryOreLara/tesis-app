part of 'forum_v2_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class ForumV2State extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final TitleForum titleForum;
  final DescriptionForum descriptionForum;

  const ForumV2State(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.titleForum = const TitleForum.pure(),
      this.descriptionForum = const DescriptionForum.pure()});

  ForumV2State copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          TitleForum? titleForum,
          DescriptionForum? descriptionForum}) =>
      ForumV2State(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          titleForum: titleForum ?? this.titleForum,
          descriptionForum: descriptionForum ?? this.descriptionForum);

  @override
  List<Object> get props => [formStatus, isValid, titleForum, descriptionForum];
}

final class ForumV2Initial extends ForumV2State {}
