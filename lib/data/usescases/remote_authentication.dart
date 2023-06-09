import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';

import '../http/http_client.dart';

class RemoteAuthentication{
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(url: url, 
      method: 'post', 
      body: RemoteAuthenticationParams.fromDomain(params).toJson()
    );
  } 
}

class RemoteAuthenticationParams {
  final Strinf email;
  final String password;

  RemoteAuthenticationParams({
    @required this.email,
    @required this.password
  })

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
    RemoteAuthenticationParams(email: params.email, password: params.secret);

  //Converte para um Json
  Map toJson() => {'email': email, 'password': password};
}