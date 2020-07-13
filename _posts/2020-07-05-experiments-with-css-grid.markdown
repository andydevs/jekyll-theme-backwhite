---
layout: post
title: Experiments in CSS Grid
keywords: andydevs blog css-grid css grid gradient
excerpt_separator: "<!--content-->"
date: 2020-07-05 17:14 -0400
edited: true
---
A while back, I watched a [video lecture](https://youtu.be/7kVeCqQCxlk) from 
Coding Tech where a blogger showed how he designed his entire blog website just using CSS Grid, with no help from Bootstrap or any other style library.

Needless to say, I was intrigued.

I wanted to try it myself. So, I used CSS Grid to design a homepage for a mock blog website.

<!--content-->

I "drew" this layout (using google drawings)

_Desktop_

![Desktop](/assets/images/experiments-with-css-grid/desktop.jpg)

_Mobile_

![Mobile](/assets/images/experiments-with-css-grid/mobile.jpg)

I'll be using SCSS for this project, as it makes the code more concise and easy to read. This will, though, work for CSS as well, it just takes a bit more coding. The "Icon Grid" and "Icon Row" areas in the diagram will be filled with Icons that I've gotten from FontAwesome's free icon library.

Check out the project on [GitHub](https://github.com/andydevs/css-grid-blog-homepage-example) for more details on the coding and tools used to make this website.

## Starting with the Content

The first thing I did was add the HTML content in.

```html
<div class="main-layout">
    <div class="menu menu-layout">
        <p>Menu Content</p>
    </div>

    <div class="post-snippet main">
        <h1 class="title">Example Header</h1>
        <p class="snippet">Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
            Voluptate adipisci laborum tempore quam recusandae harum 
            vero optio nemo, dolorem quaerat? Nemo necessitatibus 
            vero eligendi eius, minima unde eos voluptatibus tenetur... Lorem ipsum 
            dolor sit amet consectetur adipisicing elit. Rerum doloremque quibusdam 
            molestias? Alias, labore impedit libero ea dolore neque provident molestiae 
            deleniti autem nulla veniam architecto sit exercitationem perferendis praesentium? 
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae ab nihil eaque...</p>
        <p class="buttons">
            <a href="#" class="button save-button">Save</a>
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet second-1">
        <h2 class="title">Example Header</h2>
        <p class="snippet">Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
            Voluptate adipisci laborum tempore quam recusandae harum 
            vero optio nemo, dolorem quaerat? Nemo necessitatibus 
            vero eligendi eius, minima unde eos voluptatibus tenetur...</p>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet second-2">
        <h2 class="title">Example Header</h2>
        <p class="snippet">Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
            Voluptate adipisci laborum tempore quam recusandae harum 
            vero optio nemo, dolorem quaerat? Nemo necessitatibus 
            vero eligendi eius, minima unde eos voluptatibus tenetur...</p>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet second-3">
        <h2 class="title">Example Header</h2>
        <p class="snippet">Lorem ipsum dolor, sit amet consectetur adipisicing elit. 
            Voluptate adipisci laborum tempore quam recusandae harum 
            vero optio nemo, dolorem quaerat? Nemo necessitatibus 
            vero eligendi eius, minima unde eos voluptatibus tenetur...</p>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-1">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-2">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-3">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-4">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-5">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-6">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-7">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <div class="post-snippet third-8">
        <h3 class="title">Example Header</h3>
        <p class="buttons">
            <a href="#" class="button read-button">Read</a>
        </p>
    </div>

    <footer class="footer">
        <div>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                Atque ratione officia minima esse, enim ducimus adipisci 
                voluptates non iure iste commodi eius, porro recusandae. 
                Debitis libero sapiente odio placeat atque?
            </p>
            <center>
                Copyright &copy; Anshul Kharbanda (andydevs) 2020
            </center>
        </div>
    </footer>
</div>
```

We have all of our content under one layout div, which will use CSS Grid to control the placement of all of our components. In it, we have our menu (which I've kept blank for now), followed by post snippets of various sizes, and finally a footer. In the hypothetical blog I would be making, the `main` snippet would be a featured post of the day, and the `second` and `third` other highlighted posts to put on the main page.

After some css styling, here's what that looks like

![Dummy Content](/assets/images/experiments-with-css-grid/styled-content.png)

## First grid

To make a grid we use `display: grid`, then define the number and size of the rows and columns in the grid, using `grid-template-rows` and `grid-template-columns`.

```scss
.main-layout {
    ...

    // CSS Grid
    display: grid;
    grid-template-rows: repeat(5, 1fr);
    grid-template-columns: repeat(8, 1fr);
}
```

`grid-template-rows: repeat(5, 1fr)` tells CSS to divide the vertical free space into five equally spaced rows. Likewise, `grid-template-columns: repeat(8, 1fr)` will divide the horizontal free space into eight equally spaced columns. The result is a 5x8 grid of equally sized cells that we can play around in.

Now the real magic happens. Using `grid-template-areas`, we can assign cells on this grid into named areas. 

```scss
.main-layout {
    ...

    // Grid areas
    grid-template-areas:
        "main     main     main     second-1 second-1 second-1 second-1 menu     menu"
        "main     main     main     second-1 second-1 second-1 second-1 menu     menu"
        "main     main     main     second-2 second-2 third-1  third-2  third-3  third-4"
        "second-3 second-3 second-3 second-2 second-2 third-5  third-6  third-7  third-8"
        "second-3 second-3 second-3 second-2 second-2 footer   footer   footer   footer";
}
```

Then, in our contained elements, we set `grid-area` to the named area we want the element to be in

```scss
$second-count: 3;
$third-count: 12;

.menu {
    grid-area: menu;
}

.main {
    grid-area: main;
}

@for $i from 1 through $second-count {
    .second-#{$i} {
        grid-area: second-#{$i};
    }
}

@for $i from 1 through $third-count {
    .third-#{$i} {
        grid-area: third-#{$i};
    }
}

.footer {
    grid-area: footer;
}
```

and the element will automatically fill that area!

![First Grid](/assets/images/experiments-with-css-grid/first-grid.png)

## Mobile grid

So we have our grid, which looks nice on a desktop screen. But we know that most of our page's viewers will be coming from mobile devices.

Let's see what our website looks like on mobile.

![Mobile Problem](/assets/images/experiments-with-css-grid/problem-mobile.png)

Barely even functional. We obviously need to restyle our page to fit mobile devices. Thankfully, CSS Grid can help us with that. First, I created an scss mixin for detecting mobile screens. Then, all we need to do is change the grid properties in the `.main-layout` class when we're on a mobile screen.

```scss
$responsive-mobile-size: 830px !default;

@mixin on-mobile {
    @media only screen and (max-width: $responsive-mobile-size) {
        @content;
    }
}

.main-layout {
    ...

    @include on-mobile {
        // CSS Grid
        display: grid;
        grid-template-rows: auto 1.5fr repeat(3, 1fr) repeat(5, auto);
        grid-template-columns: repeat(2, 1fr);

        // Grid areas
        grid-template-areas: 
            "menu     menu"
            "main     main"
            "second-1 second-1"
            "second-2 second-2"
            "second-3 second-3"
            "third-1  third-2"
            "third-3  third-4"
            "third-5  third-6"
            "third-7  third-8"
            "footer   footer";
    }
}
```

![Mobile Grid](/assets/images/experiments-with-css-grid/better-mobile-grid.png)

Yeah, that's it! That's all ya gotta do. You can arrange these blocks anywhere, and the divs will follow!

A few notes on `grid-template-rows`, since there's a lot of stuff going on there. Both `grid-template-rows` and `grid-template-columns` are lists of defined row and column sizes. `auto` just scales the height of the row or width of the column to fit the content. The `fr` values scales the rows/columns evenly. `repeat` repeats a single value a given number of times. Here I have the menu be only as tall as it needs to be to fit the content. The `main` post snippet rows should be about 1.5 times as big as the `second` snippets. And, finally, the `third` snippets and the `footer` would only be as tall as they need to be.'

You also may have noticed that I've created two columns for this layout when I've only needed one so far. Mobile devices still have space for the `third` snippets to be in rows of two, so that's how I have them.

![Mobile Grid Bottom](/assets/images/experiments-with-css-grid/mobile-grid-bottom.png)

## Menu

Now onto the menu. I added the icons I was going to use, along with a title.

```html
<div class="menu menu-layout">
    <h1 class='title'>
        CSS Grid Example Homepage
    </h1>
    <div class='icon-1'>
        <a href="#" class="icon">
            <span class="fas fa-envelope"></span>
        </a>
    </div>
    <div class='icon-2'>
        <a href="#" class="icon">
            <span class="fab fa-facebook"></span>
        </a>
    </div>
    <div class='icon-3'>
        <a href="#" class="icon">
            <span class="fab fa-twitter"></span>
        </a>
    </div>
    <div class='icon-4'>
        <a href="#" class="icon">
            <span class="fab fa-instagram"></span>
        </a>
    </div>
    <div class='icon-5'>
        <a href="#" class="icon">
            <span class="fab fa-pinterest"></span>
        </a>
    </div>
</div>
```

![Menu Content](/assets/images/experiments-with-css-grid/menu-content.png)

Now we're making our first nested grid, or a gridded element within a grid. The code is as simple as always:

```scss
.menu-layout {
    ...

    // Create grid layout
    display: grid;
    grid-template-rows: repeat(3, 1fr);
    grid-template-columns: repeat(3, 1fr);
    grid-template-areas: 
        "title  title  icon-1"
        "title  title  icon-2"
        "icon-3 icon-4 icon-5";
}

.menu {
    .title {
        grid-area: title;
    }

    @for $i from 1 through 5 {
        .icon-#{i} {
            grid-area: icon-#{i};
        }
    }
}
```

![Menu Grid](/assets/images/experiments-with-css-grid/menu-grid.png)

So now we have a problem. The elements are arranged in a grid, but they're not really centered.

CSS grid can handle this as well! In fact, all you need is to set one attribute.

```scss
.menu {
    ...
    place-items: center;
    ...
}
```

![Menu Centered](/assets/images/experiments-with-css-grid/menu-centered.png)

And, of course, for mobile, all you need to do is change the layout.

```scss
.menu {
    ...

    // Mobile styling
    @include on-mobile {
        display: grid;
        grid-template-rows: repeat(2, auto);
        grid-template-columns: repeat(5, 1fr);
        place-items: center;
        grid-template-areas: 
            "title  title  title  title  title"
            "icon-1 icon-2 icon-3 icon-4 icon-5";
    }

    ...
}
```

![Menu Mobile](/assets/images/experiments-with-css-grid/menu-mobile.png)

## Setting Tablet Layout

The last thing I wanted to do was create an intermediate layout for tablets.

When we open the webpage on a tablet, right now we'll get the desktop layout.

![Tablet Problem](/assets/images/experiments-with-css-grid/tablet-problem.png)

It does work, but it doesn't work as well. It's a bit compressed horizontally. Fortunately, with CSS Grid and SCSS, 
it's not too difficult to add another layout option for tablets.

First off, I made another mixin.

```scss
$responsive-tablet-size: 1200px !default;

@mixin on-tablet {
    @media only screen and (max-width: $responsive-tablet-size) {
        @content;
    }
}
```

Now, there's a major caveat with the way I've written these media queries.
They check if the screen width is _less than_ the given width in the query. 
CSS also works from top to bottom, meaning that media queries are processed 
in the order that they are in the file.

So, say I put the `on-tablet` media query underneath the `on-mobile`
media query. On a mobile device, it will check to see if the screen
width is less than the mobile width, which it is. So, it will style
accordingly. Then, it will check to see if the screen width is less
than the tablet width, which it is. So, it will overwrite the mobile
styling and give you the tablet layout on mobile!

Not what we want.

So, it's important to make sure that the `on-tablet` media query comes
_before_ the `on-mobile` one. That way, on a mobile device, it will
set the tablet style, but then it will overwrite that style with the
mobile media query, and give us what we want. On a tablet, the mobile
query will fail, and we won't have to worry about it.

Just like before, we just change the layout and the divs will follow suit!

```scss
.main-layout {
    ...

    // Grid areas on tablet
    @include on-tablet {
        // CSS Grid
        display: grid;
        grid-template-rows: repeat(8, 1fr);
        grid-template-columns: repeat(6, 1fr);

        // Grid areas
        grid-template-areas: 
            "menu     menu     menu     menu     menu     menu"
            "main     main     main     main     second-1 second-1"
            "main     main     main     main     second-1 second-1"
            "main     main     main     main     second-1 second-1"
            "second-2 second-2 second-2 second-1 second-1 second-1"
            "second-2 second-2 second-2 second-2 third-1  third-2"
            "second-3 second-3 second-3 third-3  third-4  third-5"
            "second-3 second-3 second-3 third-6  third-7  third-8"
            "footer   footer   footer   footer   footer   footer";
    }

    // Mobile styling comes after!
    ...
}

...

.menu-layout {
    ...

    // Tablet styling
    @include on-tablet {
        display: grid;
        grid-template-rows: repeat(2, 1fr);
        grid-template-columns: repeat(4, 1fr);
        place-items: center;
        grid-template-areas: 
            "title  title  title  icon-1"
            "icon-2 icon-3 icon-4 icon-5";
    }

    // Again, mobile styling comes after.
    ...
}
```

![Tablet Layout](/assets/images/experiments-with-css-grid/tablet-layout.png)

## Conclusion

I found that CSS Grid helps if you're working on broad layouts of webpages that also change for multiple device sizes. It's not a tool for every problem. There are instances where Flexbox is much more useful. For example, having a row of buttons
where there could be one or many buttons and they are all scaled evenly in one direction. Nonetheless,
for what it's good for, CSS Grid is incredibly useful.

So yeah, I'm gonna use it for everything now.

Check out the project on [GitHub](https://github.com/andydevs/css-grid-blog-homepage-example) 
and the actual [website](https://css-grid-blog-homepage-example.netlify.app).