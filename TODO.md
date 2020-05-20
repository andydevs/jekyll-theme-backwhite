jekyll-theme-backwhite: TODO
===========================================================

Notes
-----------------------------------------------------------

This is now the source of truth for the project, as the
theme was meant to be used for my jekyll site

Backlog
-----------------------------------------------------------

### Build Tooling

- [ ] Automate version update
- [ ] Travis n stuff

### Features

- [ ] Support for categories
- [ ] Touch response on mobile

### Tweaks

### Refactoring

- [ ] Rewrite javascript files in coffeescript

### Documentation

- [ ] Write introduction page
- [x] Write usage page
- [ ] Write elements showcase page

Upcoming
-----------------------------------------------------------

### Better In Some Ways

#### Features

- [ ] Main content gutters larger desktops
- [x] `.bw-small`, `.bw-medium`, `.bw-large`, 
        `.bw-mega` classes

#### Tweaks

- [x] Images centered by default
- [x] Fix headers and p to all have the same display type 
        and spacing (in one scss block)
- [x] Change `h1` font-size to mega-font-size
- [x] Remove font size attribute from `.bw-title` (is
        provided by size classes or elements)

#### Refactoring and Maintainence

- [x] Add _config.yml
- [x] Fix index.html to use the layouts and includes
- [x] Change `<div class='bw-footer'>` to 
        `<footer class='bw-footer'>` in html page

### More Style Elements!

- [ ] `.bw-emph-button` which automatically switches between 
        raised and cutout depending on context
- [ ] `.bw-border-button` with border around button

### New Pages

#### Features

- [ ] Centered full-page thing (for logins n such)
- [ ] Also a back-colored centered full-page
- [ ] Custom 404 page
- [ ] .bw-raised block (for a full back)

#### Tweaks

- [ ] Create single bw-container which replaces 
front and back containers (the spacing is handled by 
front and back)
- [ ] Create .bw-app div which should encapsulate 
all backwhite content!
- [ ] Intermediate grid row in tablet width which 
keeps some grid stuff
- [ ] Move position attributes in .bw-back to right 
under position attribute


Changelog
-----------------------------------------------------------

### v1.0.4

- [x] Updated Website

### v1.0.3

- [x] Updated changelog

### v1.0.2

- [x] Added homepage and documentation to packages
- [x] Added CHANGELOG