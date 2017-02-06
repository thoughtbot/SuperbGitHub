# Contributing

We love contributions from everyone.
By participating in this project,
you agree to abide by the thoughtbot [code of conduct][].

We expect everyone to follow the code of conduct
anywhere in thoughtbot's project codebases,
issue trackers, chatrooms, and mailing lists.

[code of conduct]: https://thoughtbot.com/open-source-code-of-conduct

## Dependencies

SuperbGitHub uses [Carthage][] for dependency management. Running `bin/setup`
will install Carthage if it isn't already installed, then download the
dependencies.

[Carthage]: https://github.com/Carthage/Carthage

## Contributing

1. Fork the repo.
2. Run the tests. We only take pull requests with passing tests, and it's
   great to know that you have a clean slate.
3. Add a test for your change. Only refactoring and documentation changes
   require no new tests. If you are adding functionality or fixing a bug, we
   need a test!
4. Make the test pass.
5. Push to your fork and submit a pull request.

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within three business days (and, typically, one business
day). We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted,

* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution
* Follow the existing style of the project
