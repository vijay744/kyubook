import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:kyubook/core/constants.dart';
import 'package:kyubook/core/failuer.dart';
import 'package:kyubook/core/network_helper.dart';
import 'package:kyubook/data/models/model_character.dart';

abstract class FetchRickNMortyRepository {
  Future<Either<Failuer, ModelCharacter>> fetchCharacters();
}

class FetchRickNMortyRepositoryImpl extends FetchRickNMortyRepository {
  @override
  Future<Either<Failuer, ModelCharacter>> fetchCharacters() async {
    try {
      Response response =
          await NetworkHelper.getInstance().get(Constants.CHARACTER_API);
      if (response.statusCode == 200) {


        return Right(ModelCharacter.fromJson(jsonDecode(response.body)));
      } else {
        return Left(Failuer(
            message: "Error ${response.statusCode} while fetching data"));
      }
    } catch (e,st) {
      print(st.toString());
      return Left(Failuer(message: "Something went wrong"));
    }
  }
}
