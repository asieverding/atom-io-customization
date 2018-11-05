# Atom.io Customization

This repository offers an automatic install script for __Atom.io__ customization! :fire:
This Atom.io setup includes a fully IDE with Debugger for PHP / Web development.
Also a functionality for running Electron / NodeJS Apps from toolbar is included.


### Requirements

- Atom.io
- Node.js

##### To get things work:

- Apache
- PHP
- PEAR / PECL (PHP package manager)
- XDebug for PHP (`pecl install xdebug`)


### Installation Guide

1. Clone / download repository to your local computer
2. ...


### Included Atom.io packages

Packages from [https://atom.io/packages](https://atom.io/packages) ⇒ `apm install package-name`

- [x] atom-beautify
- [x] atom-debug-ui
- [x] atom-html-preview
- [x] atom-ide-debugger-node
- [x] atom-ide-ui
- [x] atom-toolbar-preferred
- [x] browser-plus
- [x] busy-signal
- [x] color-picker
- [x] docblockr
- [x] file-icons
- [x] ide-php
- [x] intentions
- [x] language-swift
- [x] linter
- [x] linter-csslint
- [x] linter-htmlhint
- [x] linter-jshint
- [x] linter-jsonlint
- [x] linter-less
- [x] linter-markdown
- [x] linter-php
- [x] linter-sass-lint
- [x] linter-swiftc
- [x] linter-ui-default
- [x] linter-xmllint
- [x] markdown-writer
- [x] minimap
- [x] minimap-linter
- [x] monokai
- [x] multi-cursor
- [x] npm-plus
- [x] one-dark-monokai
- [x] open-in-browser
- [x] php-debug
- [x] php-hyperclick
- [x] semantic-ui
- [x] teletype
- [x] tool-bar
- [x] touchbar


### Included Node.js packages

Packages from [https://www.npmjs.com/](https://www.npmjs.com/) ⇒ `npm install package-name`

- [x] asar
- [x] electron-packager
- [x] jshint
- [x] jsonlint
- [x] less
- [x] npm
- [x] sass-lint


### Included configuration files

##### Configuration files for Atom.io & packages ⇒ `~/.atom` Directory

- config.cson
- github.cson
- init.coffee
- keymap.cson
- snippets.cson
- styles.less

##### Configuration files for Linters ⇒ `~/` Directory

- .jshintrc
- .htmlhintrc
- ...

##### Configuration files for XDebug ⇒ `./extra` inside Directory which contains `php.ini`

- xdebug.php.ini

__Note:__ _Set the IP address in XDebug ini file / php-debug settings to your local ip, which you've got by your router._


### License

[![WTFPL License](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)](https://github.com/Teddy95/atom-io-customization/blob/master/LICENSE)
