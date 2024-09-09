part of 'website_content_mangement_cubit.dart';

@immutable
abstract class WebsiteContentMangementState {}

class WebsiteContentMangementInitial extends WebsiteContentMangementState {}
class WebsiteContentMangementLoading extends WebsiteContentMangementState {}
class WebsiteContentMangementSucess extends WebsiteContentMangementState {}
class WebsiteContentMangementFail extends WebsiteContentMangementState {}
class GetWebsiteContentMangementByIdLoading extends WebsiteContentMangementState {}
class GetWebsiteContentMangementByIdSucess extends WebsiteContentMangementState {}
class GetWebsiteContentMangementByIdFail extends WebsiteContentMangementState {}
class RemoveWebsiteContentMangementLoading extends WebsiteContentMangementState {}
class RemoveWebsiteContentMangementSucess extends WebsiteContentMangementState {}
class RemoveWebsiteContentMangementFail extends WebsiteContentMangementState {}
class EditwebsiteContentMangementstate extends WebsiteContentMangementState {}
class RemoveDataState extends WebsiteContentMangementState {}
class AddWebsiteContentMangementLoading extends WebsiteContentMangementState {}
class AddWebsiteContentMangementSucess extends WebsiteContentMangementState {}
class AddWebsiteContentMangementFail extends WebsiteContentMangementState {}
class UploadImage extends WebsiteContentMangementState {}
