import 'package:dart_oidc/dart_oidc.dart';
import 'package:flutter/material.dart';

final oidcClient = OidcClient(
  config: OidcClientConfig(
    authority: 'https://example.com/oidc',
    clientId: 'your-client-id',
    redirectUri: 'your-redirect-uri',
    scopes: ['openid', 'profile', 'email'],
  ),
);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              final user = await oidcClient.getUser();

              if (user == null) {
                // User is not authenticated. Redirect them to the OIDC provider's login page.
                oidcClient.redirectToLogin();
              } else {
                // User is authenticated. You can access the user's claims using the `user.claims` map.
                print(user.claims);
              }
            },
            child: Text('Sign in with OIDC'),
          ),
        ),
    );
  }
}