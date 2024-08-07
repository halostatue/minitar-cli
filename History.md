# History

## 1.0.0 / 2024-08-07

- Updated for compatibility with minitar 1.0.0.

## 0.12 / 2024-08-06

- Updated for compatibility with minitar 0.12.

## 0.9 / 2024-07-02

- Updated for compatibility with minitar 0.9. Provided in [#4][#4] by
  david22swan. Thanks!

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

[minitar]: https://github.com/halostatue/minitar
[Ruby Progress Bar]: https://namazu.org/~satoru/ruby-progressbar/
[busyloop/powerbar]: https://github.com/busyloop/powerbar
[#4]: https://github.com/halostatue/minitar-cli/pull/4
