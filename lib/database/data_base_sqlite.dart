import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseSqlite {
  Future<void> openConnection() async {
    //o path é aonde ele vai guardar o banco de dados, qual pasta que é
    // openDatabase(path)

    //nome da pasta que vai ficar no celular do usuario
    final dataBasePath = await getDatabasesPath();

    //SqliteVitu -> nome da pasta, mais agora lembre-se eu to utilizando / mais no android é \, por isso precisamos do package path
    // dataBasePath += "/SqliteVitu";

    final dataBaseFinalPath = join(dataBasePath, "SqliteVitu");

    await openDatabase(dataBaseFinalPath,
        version:
            1, // se precisar atualizar o banco de dados é preciso mudar a versão
        onCreate: (Database db, int version) {
      //onCreate -> é chamado apenas quand o banco não existir(ou seja na primeira vez no app)

      print('onCreate chamado');
      final batch = db.batch();
      batch.execute('''
      create table teste(
        id Integer primary key autoincrement,
        nome varchar(200)
      )

''');

      batch.commit();
    }, onUpgrade: (Database db, int oldVersion, int version) {
      print('onUpgrade chamado');
      //ele faz o seguinte
      //a oldVersion sua é a 1 e agora o tem uma nova versão que é a 2, então faça o upgrade para a versao 2
    }, onDowngrade: (Database db, int oldVersion, int version) {
      print('onDowngrade chamado');
      //para voltar na versão anterior
    });
  }
}
