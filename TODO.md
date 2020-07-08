jekyll-theme-backwhite: TODO
=============================================================

Notes
-------------------------------------------------------------

This is now the source of truth for the project, as the
theme was meant to be used for my jekyll site

Backlog
-------------------------------------------------------------

### Build Tooling

- [ ] Travis n stuff
- [ ] Automate version update

### Features

- [ ] Touch response on mobile
- [ ] Support for categories
- [ ] Liquid chunk tag plugin

### Bug Fixes

- [ ] Front page does not show up when switching back to 
        desktop after opening back on mobile

Upcoming
-------------------------------------------------------------

### More Style Elements!

#### Features

- [ ] `.bw-emph-button` which automatically switches between 
        raised and cutout depending on context
- [ ] `.bw-border-button` with border around button

#### Tweaks

- [x] Menu buttons need wider click area
- [ ] Menu buttons need more emphasis

#### Refactoring

- [ ] Move doc-images to assets/images/doc folder

### New Pages

#### Features

- [ ] Centered full-page thing (for logins n such)
- [ ] Also a back-colored centered full-page
- [ ] Custom 404 page
- [ ] `.bw-raised` block (for a full back)

#### Tweaks

- [ ] Create .bw-app div which should encapsulate 
all backwhite content!
- [ ] Create single bw-container which replaces 
front and back containers (the spacing is handled by 
front and back panels)
- [ ] Intermediate grid row in tablet width which 
keeps some grid stuff

#### Refactoring

- [ ] Move position attributes in .bw-back to right 
under position attribute


Changelog
-------------------------------------------------------------

### v1.1.2

- [x] Write javascript files plainly...
- [x] Write usage page
- [x] Write elements showcase page
- [x] Write introduction page
- [x] Fix spacing for figure tags

### v1.1.1

- [x] Fixed bug where main link does not redirect to homepage

### v1.1.0: Better In Some Ways

#### Features

- [x] Main content gutters larger desktops
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

### v1.0.4

- [x] Updated Website

### v1.0.3

- [x] Updated changelog

### v1.0.2

- [x] Added homepage and documentation to packages
- [x] Added CHANGELOG