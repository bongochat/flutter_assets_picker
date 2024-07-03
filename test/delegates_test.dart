//
// [Author] Alex (https://github.com/bongochat)
// [Date] 2022/9/19 11:52
//

import 'package:flutter_test/flutter_test.dart';
import 'package:assets_picker/assets_picker.dart';

void main() {
  test('Sort paths correctly', () {
    final List<PathWrapper<AssetPathEntity>> paths =
        <PathWrapper<AssetPathEntity>>[
      PathWrapper<AssetPathEntity>(
        path: AssetPathEntity(id: 'id2', name: 'Screenshots'),
      ),
      PathWrapper<AssetPathEntity>(
        path: AssetPathEntity(id: 'id1', name: 'Camera'),
      ),
      PathWrapper<AssetPathEntity>(
        path: AssetPathEntity(id: 'id0', name: 'All', isAll: true),
      ),
    ];
    SortPathDelegate.common.sort(paths);
    expect(paths[0], (PathWrapper<AssetPathEntity> e) => e.path.isAll);
    expect(
      paths[1],
      (PathWrapper<AssetPathEntity> e) => e.path.name == 'Camera',
    );
    expect(
      paths[2],
      (PathWrapper<AssetPathEntity> e) => e.path.name == 'Screenshots',
    );
  });
}
