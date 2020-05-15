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

### Tweaks

- [ ] Use CSS Grid to style the homepage

### Refactoring

Upcoming
-----------------------------------------------------------

### New Style Options

#### Features

- [ ] `.bw-small`, `.bw-medium`, `.bw-large`, 
`.bw-mega` classes
- [ ] `.bw-emph-button` which automatically switches between 
raised and cutout depending on context
- [ ] `.bw-border-button` with border around button\

#### Tweaks

- [ ] Fix headers and p to all have `display: block`, 
`color: inherit`, and `margin-vertical: $spacing-unit` 
(in one scss block)
- [ ] Change `h1` font-size to mega-font-size
- [ ] Remove font size attribute from `.bw-title` (is
provided by size classes or elements)

#### Refactoring and Maintainence

- [ ] Add _config.yml
- [ ] Fix index.html to use the layouts and includes 
- [ ] Move .bw-links to _misc.scss
- [ ] Change `<div class='bw-footer'>` to 
`<footer class='bw-footer'>` in html page

### Images

- [ ] Back menu main thumbnail image
- [ ] Images centered by default

### Panels and Containers

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