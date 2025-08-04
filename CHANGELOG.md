# Changelog

## NEXT / 2025-MM-DD

- Governance:

  Changes described here are effective 2024-12-31.

  - Update gem management details to use markdown files for everything, enabled
    in part by [flavorjones/hoe-markdown][hoe-markdown]. Several files were
    renamed to be more consistent with standard practices.

  - Updated security notes with an [age][age] public key rather than pointing to
    Keybase.io and a PGP public key which I no longer use. The use of the
    [Tidelift security contact][tidelift] is recommended over direct disclosure.

  Changes described below are effective 2025-08-04.

  - Contributions to minitar-cli now require a DCO certification.

## 1.0.0 / 2024-08-07

- Updated for compatibility with minitar 1.0.0.

## 0.12 / 2024-08-06

- Updated for compatibility with minitar 0.12.

## 0.9 / 2024-07-02

- Updated for compatibility with minitar 0.9. Provided in [#4][pull-4] by
  @david22swan. Thanks!

## 0.8 / 2019-01-05

- Updated for compatibility with minitar 0.8

## 0.7 / 2018-02-19

- Updated for compatibility with minitar 0.7

## 0.6.1 / 2017-02-08

- Fixed an issue where `bin/minitar` was not loading zlib for compressed files.

## 0.6 / 2017-02-07

- Hello, minitar-cli. This is a new gem containing code originally from
  archive-tar-minitar.

- Enhancements:

  - Extracted `bin/minitar` from [minitar][minitar].
  - Replaced Satoru Takabayashi’s [Ruby Progress Bar][Ruby Progress Bar] with
    [busyloop/powerbar][busyloop/powerbar].
  - Added filename filtering to `minitar list`.

- Bugs:

  - Fixed a problem where `bin/minitar create` would not include dotfiles on
    Unix systems.

- Development:

  - Modernized minitar tooling around Hoe.
  - Added travis and coveralls.

[Ruby Progress Bar]: https://namazu.org/~satoru/ruby-progressbar/
[age]: https://github.com/FiloSottile/age
[busyloop/powerbar]: https://github.com/busyloop/powerbar
[hoe-markdown]: https://github.com/flavorjones/hoe-markdown
[minitar]: https://github.com/halostatue/minitar
[pull-4]: https://github.com/halostatue/minitar-cli/pull/4
[tidelift]: https://tidelift.com/security
