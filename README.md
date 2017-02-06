# SuperbGitHub

GitHub authentication providers for [Superb][].

[Superb]: https://github.com/thoughtbot/Superb

## Usage

SuperbGitHub implements two different authentication flows.
Choose the flow that best suits your application's needs.

### Web Application Flow using Safari View Controller

`GitHubOAuthProvider` implements the GitHub OAuth
[web application flow][oauth-web] using [Safari View Controller][safari].

 1. Register your provider:

    ```swift
    // GitHub+Providers.swift

    import Superb
    import SuperbGitHub

    extension GitHubOAuthProvider {
      static var shared: GitHubOAuthProvider {
        return Superb.register(
          GitHubOAuthProvider(
            clientId: "<your client id>",
            clientSecret: "<your client secret>",
            redirectURI: URL(string: "<your chosen redirect URI>")!
          )
        )
      }
    }
    ```

    Don't forget to add your app's URL scheme to your Info.plist.

 2. Handle redirects:

    ```swift
    // AppDelegate.swift

    @UIApplicationMain
    final class AppDelegate: UIResponder, UIApplicationDelegate {
      // ...

      func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
        return Superb.handleAuthenticationRedirect(url, options: options)
      }
    }
    ```

 3. Use `RequestAuthorizer` to perform authorized API requests:

    ```swift
    // GitHubAPIClient.swift

    struct GitHubAPIClient {
      static let oauthClient = GitHubAPIClient(
        requestAuthorizer: RequestAuthorizer(
          authorizationProvider: GitHubOAuthProvider.shared
        )
      )

      // ...

      func getProfile(completionHandler: @escaping (Result<Profile, SuperbError>) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.github.com/user")!)

        authorizer.performAuthorized(request) { result in
          switch result {
          case let .success(data, _):
            let profile = parseProfile(from: data)
            completionHandler(.success(profile))

          case let .failure(error):
            completionHandler(.failure(error))
          }
        }
      }
    }

    // later
    let api = GitHubAPIClient.oauthClient
    api.getProfile { result in
      // ...
    }
    ```

[oauth-web]: https://developer.github.com/v3/oauth/#web-application-flow
[safari]: https://developer.apple.com/reference/safariservices/sfsafariviewcontroller

### Non-Web Application Flow using Basic Auth

`GitHubBasicAuthProvider` implements the GitHub OAuth [non-web application flow][oauth-non-web]
using a simple `UIAlertController` to prompt the user for their credentials.
The credentials are then used to [create a personal access token][create-token],
and the user's credentials are discarded.

 1. Register your provider:

    ```swift
    // GitHub+Providers.swift

    import Superb
    import SuperbGitHub

    extension GitHubBasicAuthProvider {
      static var shared: GitHubBasicAuthProvider {
        return Superb.register(
          GitHubBasicAuthProvider()
        )
      }
    }
    ```

 2. Use `RequestAuthorizer` to perform authorized API requests:

    ```swift
    // GitHubAPIClient.swift

    extension GitHubAPIClient {
      static let basicAuthClient = GitHubAPIClient(
        requestAuthorizer: RequestAuthorizer(
          authorizationProvider: GitHubBasicAuthProvider.shared
        )
      )
    }

    // later
    let api = GitHubAPIClient.basicAuthClient
    api.getProfile { result in
      // ...
    }
    ```

[oauth-non-web]: https://developer.github.com/v3/oauth/#non-web-application-flow
[create-token]: https://developer.github.com/v3/oauth_authorizations/#create-a-new-authorization

## Contributing

See the [CONTRIBUTING][] document.
Thank you, [contributors][]!

[CONTRIBUTING]: CONTRIBUTING.md
[contributors]: https://github.com/thoughtbot/SuperbGitHub/graphs/contributors

## License

SuperbGitHub is Copyright (c) 2017 thoughtbot, inc.
It is free software, and may be redistributed
under the terms specified in the [LICENSE][] file.

[LICENSE]: LICENSE

## About

![thoughtbot](https://thoughtbot.com/logo.png)

SuperbGitHub is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software!
See [our other projects][community]
or [hire us][hire] to help build your product.

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com/hire-us?utm_source=github
