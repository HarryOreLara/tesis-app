part of 'forum_v2_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }



class ForumV2State extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final TitleForum titleForum;
  final DescriptionForum descriptionForum;
  final List<Forum> forums;

  const ForumV2State(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.titleForum = const TitleForum.pure(),
      this.descriptionForum = const DescriptionForum.pure(),
      this.forums = const  []});

  ForumV2State copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          TitleForum? titleForum,
          List<Forum>? forums,
          DescriptionForum? descriptionForum,}) =>
      ForumV2State(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          titleForum: titleForum ?? this.titleForum,
          forums: forums ?? this.forums,
          descriptionForum: descriptionForum ?? this.descriptionForum);

  @override
  List<Object> get props => [formStatus, isValid, titleForum, descriptionForum, forums];
}

final class ForumV2Initial extends ForumV2State {}
