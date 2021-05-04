import 'package:meta/meta.dart';
import './model.dart';

class ImageResults {
  final ImageRepository repository;
  final Cache cache;
  ImageResults({
    @required this.repository,
    @required this.cache,
  });
}
