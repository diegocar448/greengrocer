import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_result.freezed.dart';

@freezed
class HomeResult<T> with _$HomeResult<T> {
  // <T> tipo da classe, nesse caso podemos definir como tipo categorias ou outro, por exemplo
  factory HomeResult.success(List<T> data) = Success;
  factory HomeResult.error(String message) = Error;
}
