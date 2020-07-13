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

### Tweaks

- [ ] Create single bw-container which replaces 
front and back containers (the spacing is handled by 
front and back panels)

### Bug Fixes

- [ ] Address bar does not move out of the way when scrolling

### Refactoring

Upcoming
-------------------------------------------------------------

### Better Pages and Links

#### Features

- [x] Back-colored centered full-page layout
- [x] Custom 404 page

#### Tweaks

- [x] Redesign post snippet grid
- [ ] Post snippet read more buttons are pushed to the bottom of the row (and to the right)
- [ ] Space out post snippets more on mobile
- [ ] Read more button on post snippets is full width on mobile
- [ ] Intermediate grid row in tablet width which keeps some grid stuff
- [ ] Add more support for social media links

Changelog
-------------------------------------------------------------

### v2.0.0: The better sliding thing

It's a new release because it's different n' stuff

#### Tweaks

- [x] Create .bw-app div which should encapsulate all 
backwhite content!
- [x] Fix sliding animation so that it actually slides 
off instead of compressing

#### Bug Fixes

- [x] Front page does not show up when switching back to 
desktop after opening back on mobile

### v1.2.0: More Style Elements!

#### Features

- [x] `.bw-emph-button` which automatically switches between 
raised and cutout depending on context
- [x] `.bw-border-button` with border around button

#### Tweaks

- [x] Menu buttons need wider click area
- [x] Menu buttons need more emphasis

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