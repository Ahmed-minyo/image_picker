import 'package:task/data/dataSource/local-data-manager.dart';
import 'package:task/data/dataSource/local_data_manager.impl.dart';


class ImageRepo{
  LocalDataManagerImpl localDataManagerImpl;

  ImageRepo(this.localDataManagerImpl);

  Future<void> saveImage(String image) async {
    await localDataManagerImpl.writeData(CachingKey.IMAGES, image );
  }

  Future<String> getImage() async {
    return await localDataManagerImpl.readString(CachingKey.IMAGES);
  }

}