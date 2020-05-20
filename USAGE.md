---
layout: page
title: Usage
---

## Back and Front Panels

The core of this design is the back panel (appearing on the right on desktop, and appearing behind on mobile), and the front panel.

These panels are created with `<div class='bw-back'>` and `<div class='bw-front'>` respectively.

```html
<body>
    <div class='bw-back'>
        <p>Back (menu)</p>
    </div>
    <div class='bw-front'>
        <p>Front (content)</p>
    </div>
</body>
```

![Back Front Panels](./doc-images/back-front-panels.png)

Wrap all the content in these panels with their appropriate containers to provide spacing.

```html
<body>
    <div class='bw-back'>
        <div class='bw-back-container'>
            <p>Back (menu)</p>
        </div>
    </div>
    <div class='bw-front'>
        <div class='bw-front-container'>
            <p>Front (content)</p>
        </div>
    </div>
</body>
```

![Back Front Containers](./doc-images/back-front-containers.png)

## Headers

Both the back and the front panel in the example have headers at the top. Headers have a title and a series of actions (usually icon buttons).

Backwhite comes with fontawesome solid and brand icons. Use them just like you would in any other app.

This is an example of a header in the front panel.

```html
<div class='bw-header'>
    <h1 class='bw-title'>Example Header</h1>
    <button class='bw-action'>
        <span class='fas fa-check'></span>
    </button>
    <button class="bw-action">
        <span class="fas fa-times"></span>
    </button>
</div>
```

![Front Header](./doc-images/front-header.png)

This is an example of a header in the back panel.

```html
<div class='bw-header'>
    <button class="bw-action">
        <span class="fas fa-times"></span>
    </button>
    <button class='bw-action'>
        <span class='fas fa-check'></span>
    </button>
    <h1 class='bw-title'>Example Header</h1>
</div>
```

![Back Header](./doc-images/back-header.png)

## Controlling Mobile Sliding

The front and back usually start with main headers. These are what will contain the buttons controlling the sliding on mobile. The front panel header would usually contain the title of the page. The back panel header would contain the title of the site. On each of these there would be one button which handles opening and closing.

```html
<body>
    <div class="bw-back">
        <div class="bw-back-container">
            <div class='bw-header'>
                <button class="bw-action bw-show-on-mobile bw-close">
                    <span class="fas fa-chevron-left"></span>
                </button>
                <h1 class='bw-title'>Example Header</h1>
            </div>
        </div>
    </div>
    <div class="bw-front">
        <div class="bw-front-container">
            <div class='bw-header'>
                <h1 class='bw-title'>Example Header</h1>
                <button class="bw-action bw-show-on-mobile bw-open">
                    <span class="fas fa-chevron-right"></span>
                </button>
            </div>
        </div>
    </div>
</body>
```

_Desktop_

![Header Desktop](./doc-images/header-desktop.png)

_Mobile Page_

![Header Mobile Page](./doc-images/header-mobile-page.png)

_Mobile Menu_

![Header Mobile Menu](./doc-images/header-mobile-menu.png)

`.bw-show-on-mobile` will hide the button on desktop and show it on mobile. `.bw-open` and `.bw-close` are preprogrammed classes which trigger the opening and closing of the menu respectively when clicked. Font awesone's chevron icons are being used here.

## Back Menu Links

Links are organized on the back menu using a table.

```html
<table class="bw-links">
    <tr>
        <td><a href='#'>About</a></td>
        <td><a href='#'>Contact</a></td>
        <td><a href='#'>Post of the Day</a></td>
    </tr>
    <tr>
        <td><a href='#'>Web Design</a></td>
        <td><a href='#'>Hardware</a></td>
        <td><a href='#'>Machine Learning</a></td>
    </tr>
    <tr>
        <td>
            <a href="#">
                <span class="fab fa-youtube"></span> Youtube
            </a>
        </td>
        <td>
            <a href="#">
                <span class="fab fa-github"></span> Github
            </a>
        </td>
        <td>
            <a href="#">
                <span class="fab fa-linkedin"></span> Linkedin
            </a>
        </td>
    </tr>
</table>
```

![Header Links](./doc-images/header-links.png)

## Back Menu Footer

The footer goes in the back menu within an element with the class `.bw-footer`.

```html
<footer class="bw-footer">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
        eiusmod tempor incididunt ut labore et dolore magna aliqua. 
        Ut enim ad minim veniam, quis nostrud exercitation ullamco 
        laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate 
        velit esse cillum dolore eu fugiat nulla pariatur. 
        Excepteur sint occaecat cupidatat non proident, sunt in 
        culpa qui officia deserunt mollit anim id est laborum.</p>
</footer>
```

![Header Links Footer](./doc-images/header-links-footer.png)

## Responsive Tables

Tables are scaled so that every cell is as wide as the widest text cell. This means that the tables will overflow over the edge. In backwhite, these tables are wrapped in a horizontal scroll wrapper div to allow for horizontal scrolling between tables.

```html
<div class='bw-horiz-scroll-wrapper'>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Town</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Joe</td>
                <td>22</td>
                <td>Allentown</td>
                <td>joe@schmoes.goes</td>
            </tr>
            <tr>
                <td>Jim</td>
                <td>20</td>
                <td>Gainsville</td>
                <td>jim@shims.dims</td>
            </tr>
            <tr>
                <td>Steven</td>
                <td>32</td>
                <td>Birmington</td>
                <td>steven@schmultz.gultz</td>
            </tr>
        </tbody>
    </table>
</div>
```

![Responsive Table](./doc-images/responsive-table.png)

## Grid Rows

Backwhite supports bootstrap-like grid rows. Each grid row is a `.bw-row` div, and can contain any number of `.bw-col-[x]` divs, where x is any number from 1 to 12. To make a complete row, all x values must add up to exactly 12.

```html
<h2>Grid Rows</h2>

<div class="bw-row">
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure 
            provident reiciendis explicabo magnam doloremque 
            officiis sit officia consequatur adipisci? Omnis 
            eos eius porro!</p>
    </div>
</div>

<div class="bw-row">
    <div class="bw-col-4">
        <h3><code>bw-col-4</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
    </div>
    <div class="bw-col-4">
        <h3><code>bw-col-4</code></h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
            Tempore unde iure nobis. Quos tempora laudantium beatae, 
            aliquam repellat praesentium velit eius voluptatum blanditiis 
            sed ullam! Necessitatibus cupiditate inventore similique voluptatem!</p>
    </div>
    <div class="bw-col-4">
        <h3><code>bw-col-4</code></h3>
        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
            Facilis voluptas natus ipsam voluptatibus aspernatur neque 
            minima odit ipsum aliquid et? Dolorum corporis distinctio 
            delectus quidem nesciunt unde non ducimus voluptate?</p>
    </div>
</div>

<div class="bw-row">
    <div class="bw-col-6">
        <h3><code>bw-col-6</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
    </div>
    <div class="bw-col-6">
        <h3><code>bw-col-6</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
    </div>
</div>

<div class="bw-row">
    <div class="bw-col-10">
        <h3><code>bw-col-10</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro! Lorem ipsum dolor 
            sit, amet consectetur adipisicing elit. Possimus, unde numquam. 
            Fugiat et, sed beatae mollitia magni dolores omnis deserunt, 
            inventore dolorem suscipit possimus labore quasi unde temporibus 
            adipisci ex!</p>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
            Ad molestiae delectus id accusantium alias molestias aspernatur 
            animi, unde sequi veritatis. Eveniet est dolorem ullam voluptatum 
            odio molestias laudantium dolores ea? Lorem ipsum dolor sit amet 
            consectetur adipisicing elit. Adipisci sed, architecto quidem 
            possimus amet velit voluptas ex eos placeat, iste provident 
            suscipit at ipsam numquam nobis totam natus veniam aliquid?</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
    </div>
</div>

<div class="bw-row">
    <div class="bw-col-6">
        <h3><code>bw-col-6</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
            Iure ad aliquam facere. Sequi illum mollitia excepturi enim! 
            Blanditiis explicabo, libero fugiat asperiores velit magni 
            voluptatem cumque tempore corporis quia quaerat.</p>
    </div>
    <div class="bw-col-2">
        <h3><code>bw-col-2</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Nostrum hic nihil, facilis, autem alias eaque iure provident 
            reiciendis explicabo magnam doloremque officiis sit officia 
            consequatur adipisci? Omnis eos eius porro!</p>
    </div>
    <div class="bw-col-4">
        <h3><code>bw-col-4</code></h3>
        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
            Facilis voluptas natus ipsam voluptatibus aspernatur neque 
            minima odit ipsum aliquid et? Dolorum corporis distinctio 
            delectus quidem nesciunt unde non ducimus voluptate? Lorem 
            ipsum dolor sit amet consectetur adipisicing elit. Dolores, 
            culpa ad in enim earum iste pariatur ratione voluptas esse 
            ut officia inventore debitis beatae vel dolore odit nam eius. 
            Culpa.</p>
    </div>
</div>

<div class="bw-row">
    <div class="bw-col-12">
        <h3><code>bw-col-12</code></h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
             Quis dolor eius iure necessitatibus dolores alias ex pariatur! 
             Dolores corporis voluptas natus a quos voluptate? Sapiente 
             laboriosam fugiat possimus velit atque. Lorem ipsum dolor sit amet 
             consectetur adipisicing elit. Ratione sapiente error, repellat 
             vel ut distinctio consequatur dolorem quidem molestias nisi 
             neque nobis eum eligendi aliquam placeat numquam iusto deleniti 
             aspernatur? Lorem ipsum dolor sit, amet consectetur adipisicing elit.
             Vitae numquam quas quaerat? Iusto quaerat exercitationem deleniti 
             aliquid quas error tempora eligendi necessitatibus eaque, quo quisquam! 
             Est amet ea natus maiores.</p>
        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit.
             Aut eius laboriosam velit voluptates corrupti illo quia. Autem quos 
             excepturi dolore praesentium? Aut fuga fugiat praesentium blanditiis 
             eum et iusto facere! Lorem ipsum dolor sit amet consectetur adipisicing 
             elit. Quaerat eaque recusandae facilis ut laborum vero repudiandae 
             consequatur debitis quam adipisci reprehenderit voluptas, velit 
             praesentium provident, pariatur architecto earum molestias repellendus! 
             Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquam 
             accusantium id impedit pariatur quae sit vel tenetur. Voluptate 
             necessitatibus omnis repellat totam eum, quo perspiciatis, ad error 
             commodi animi quibusdam!</p>
    </div>
</div>
```

![Grid Rows Desktop](./doc-images/grid-rows-desktop.png)

On a tablet (or a smaller laptop screen), and on mobile, the grid rows align vertically.

![Grid Rows Tablet](./doc-images/grid-rows-tablet.png)

## Content Gutters

On larger desktops, it is much more visually appealing to center content and shorten the width. Backwhite provides the `.bw-content-gutters` class which can be used to wrap content in a centered, appropriately spaced container

```html
<div class='bw-header'>
    <!-- ... header ... -->
</div>
<div class='bw-content-gutters'>
    <!-- ... content ... -->
</div>
```

![Content Gutters](./doc-images/content-gutters.png)

## Cutouts

Another part that backwhite styling provides is cutouts. A cutout is a special emphasised part of the document that appears cut out from the front part, using the back as it's background.

```html
<div class="bw-cutout">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Curabitur quis urna nec lorem finibus mattis vel et odio. 
        Ut lectus nunc, accumsan eu mi in, finibus dapibus felis. 
        Morbi feugiat laoreet turpis ut sollicitudin. Donec id metus 
        metus. Etiam vestibulum vitae dolor eu finibus. Vivamus in 
        urna vitae purus fringilla porttitor vel sed nisi. Maecenas 
        accumsan sapien vitae lectus tincidunt, ac maximus elit dapibus. 
        Vestibulum ante ipsum primis in faucibus orci luctus et ultrices 
        posuere cubilia Curae;</p>
</div>
```

![Cutout](./doc-images/cutout.png)

You can add headers to cutouts as well

```html
<div class="bw-cutout">
    <div class="bw-header">
        <h3 class="bw-title">Cutout Title</h3>
        <button class="bw-action">
            <span class="fas fa-plus"></span>
        </button>
        <button class="bw-action">
            <span class="fas fa-trash"></span>
        </button>
    </div>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Curabitur quis urna nec lorem finibus mattis vel et odio. 
        Ut lectus nunc, accumsan eu mi in, finibus dapibus felis. 
        Morbi feugiat laoreet turpis ut sollicitudin. Donec id metus 
        metus. Etiam vestibulum vitae dolor eu finibus. Vivamus in 
        urna vitae purus fringilla porttitor vel sed nisi. Maecenas 
        accumsan sapien vitae lectus tincidunt, ac maximus elit dapibus. 
        Vestibulum ante ipsum primis in faucibus orci luctus et ultrices 
        posuere cubilia Curae;</p>
</div>
```

![Cutout Header](./doc-images/cutout-header.png)

Blockquotes and pre/code sections are automatically formatted as cutouts

```html
<blockquote>
    Lorem ipsum dolor sit, amet consectetur adipisicing elit. Commodi 
    officia ipsum optio illum. Sunt fugiat nemo veritatis tempora 
    voluptas ea laudantium? Explicabo ipsa error distinctio nihil 
    nostrum exercitationem hic tempora.
</blockquote>
```

![Cutout Blockquote](./doc-images/cutout-blockquote.png)

```html
<pre><code>def myfunction(arg1, arg2):
    """
    Docstring for myfunction
    """
    return arg1 + arg2, arg1/arg2</code></pre>
```

![Cutout Code](./doc-images/cutout-code.png)

## Buttons

Backwhite provides three button types. `.bw-text-button` is a button formatted simply as text. `.bw-cutout-button` is a button formatted like a cutout. Use this in a front-formatted section. For the back and cutouts, there is `.bw-raised-button`.

```html
<p><button class="bw-text-button">Text Button</button></p>
<p><button class="bw-cutout-button">Cutout Button</button></p>
<div class="bw-cutout">
    <p><button class="bw-raised-button">Raised Button</button></p>
</div>
```

![Buttons](./doc-images/buttons.png)

## Font sizing

Bw provides `.bw-small`, `.bw-normal`, `.bw-medium`, `.bw-large`, and `.bw-mega` classes to control font sizes.

```html
<p class="bw-mega">Mega Font Size</p>
<p class="bw-large">Large Font Size</p>
<p class="bw-medium">Medium Font Size</p>
<p class="bw-normal">Normal Font Size</p>
<p class="bw-small">Small Font Size</p>
```

![Font Sizes](./doc-images/font-sizes.png)

## Forms

### Block Forms

Backwhite Forms are created with the `bw-form` class.

```html
<form class='bw-form' action='...'>

</form>
```

Form entries are organized into rows (in a div called `.bw-form-row`). Each of these rows contain one or more input fields. An input field is actually a group containing a label and an input, contained in a `.bw-input-group`. This handles coupling the input and label and styling them as a single entity. Input groups are automatically scaled to fill the width of the row (using flexbox). 

```html
<div class="bw-form-row">
    <div class="bw-input-group">
        <label for="first-name">First Name:</label>
        <input type="text" name="first-name">
    </div>

    <div class="bw-input-group">
        <label for="last-name">Last Name:</label>
        <input type="text" name="last-name">
    </div>
</div>
```

`.bw-input-group` also works for selects.

```html
<div class="bw-input-group">
    <label for="race">Race:</label>
    <select name="race">
        <option disabled selected>Select...</option>
        <option value="caucasian">Caucasian</option>
        <option value="african-afam">African/African American</option>
        <option value="asian-pac">Asian/Pacific Islander</option>
    </select>
</div>
```

Checkbox and file inputs are special and use `.bw-checkbox-group` and `.bw-file-group` respectively. 

```html
<div class="bw-checkbox-group">
    <label for="hispanic-latino">Hispanic/Latino</label>
    <input type="checkbox" name="hispanic-latino">
</div>

...

<div class="bw-file-group">
    <label for="upload">Upload File:</label>
    <input type="file" name="upload">
</div>
```

At the bottom, `.bw-button-group` will contain form buttons (this should be contained in it's own `.bw-form-row`).

```html
<div class="bw-form-row">
    <div class="bw-button-group">
        <button class="bw-text-button" type="reset">Reset</button>
        <button class="bw-cutout-button" type="submit">Submit</button>
    </div>
</div>
```

Here's an example of an entire form:

```html
<h2>Form</h2>
<form class="bw-form" action="#">
    <div class="bw-form-row">
        <div class="bw-input-group">
            <label for="first-name">First Name:</label>
            <input type="text" name="first-name">
        </div>

        <div class="bw-input-group">
            <label for="last-name">Last Name:</label>
            <input type="text" name="last-name">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-input-group">
            <label for="email">Email:</label>
            <input type="email" name="email">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-input-group">
            <label for="password">Password:</label>
            <input type="password" name="password">
        </div>

        <div class="bw-input-group">
            <label for="verify">Verify Password:</label>
            <input type="password" name="verify">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-input-group">
            <label for="age">Age:</label>
            <input type="number" name="age">
        </div>

        <div class="bw-input-group">
            <label for="gender">Gender:</label>
            <select name="gender">
                <option disabled selected>Select...</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="nonbinary">Non-Binary</option>
            </select>
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-input-group">
            <label for="race">Race:</label>
            <select name="race">
                <option disabled selected>Select...</option>
                <option value="caucasian">Caucasian</option>
                <option value="african-afam">African/African American</option>
                <option value="asian-pac">Asian/Pacific Islander</option>
            </select>
        </div>

        <div class="bw-checkbox-group">
            <label for="hispanic-latino">Hispanic/Latino</label>
            <input type="checkbox" name="hispanic-latino">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-checkbox-group">
            <label for="active-veteran">Active Military or Veteran</label>
            <input type="checkbox" name="active-veteran">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-file-group">
            <label for="upload">Upload File:</label>
            <input type="file" name="upload">
        </div>
    </div>

    <div class="bw-form-row">
        <div class="bw-button-group">
            <button class="bw-text-button" type="reset">Reset</button>
            <button class="bw-cutout-button" type="submit">Submit</button>
        </div>
    </div>
</form>
```

![Block Form](./doc-images/block-form.png)

### Cutout Forms

You can also make a form in a cutout. Remember to use `.bw-raised-button` in this form in place of `.bw-cutout-button`.

```html
<div class="bw-cutout">
    <div class="bw-header">
        <h3 class="bw-title">Cutout Form</h3>
    </div>

    <form class="bw-form" action="#">
        <div class="bw-form-row">
            <div class="bw-input-group">
                <label for="first-name">First Name:</label>
                <input type="text" name="first-name">
            </div>

            <div class="bw-input-group">
                <label for="last-name">Last Name:</label>
                <input type="text" name="last-name">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-input-group">
                <label for="email">Email:</label>
                <input type="email" name="email">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-input-group">
                <label for="password">Password:</label>
                <input type="password" name="password">
            </div>

            <div class="bw-input-group">
                <label for="verify">Verify Password:</label>
                <input type="password" name="verify">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-input-group">
                <label for="age">Age:</label>
                <input type="number" name="age">
            </div>

            <div class="bw-input-group">
                <label for="gender">Gender:</label>
                <select name="gender">
                    <option disabled selected>Select...</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="nonbinary">Non-Binary</option>
                </select>
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-input-group">
                <label for="race">Race:</label>
                <select name="race">
                    <option disabled selected>Select...</option>
                    <option value="caucasian">Caucasian</option>
                    <option value="african-afam">African/African American</option>
                    <option value="asian-pac">Asian/Pacific Islander</option>
                </select>
            </div>

            <div class="bw-checkbox-group">
                <label for="hispanic-latino">Hispanic/Latino</label>
                <input type="checkbox" name="hispanic-latino">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-checkbox-group">
                <label for="active-veteran">Active Military or Veteran</label>
                <input type="checkbox" name="active-veteran">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-file-group">
                <label for="upload">Upload File:</label>
                <input type="file" name="upload">
            </div>
        </div>

        <div class="bw-form-row">
            <div class="bw-button-group">
                <button class="bw-text-button" type="reset">Reset</button>
                <button class="bw-raised-button" type="submit">Submit</button>
            </div>
        </div>
    </form>
</div>
```

![Cutout Form](./doc-images/cutout-form.png)

### Inline Forms

Forms can also take up one row. These are created by `.bw-inline-form`. Buttons in this form are automatically pushed to the right (or left depending on ordering) and are automatically formatted. For example, a search bar:

```html
<form class="bw-inline-form" action="#">
    <div class="bw-input-group">
        <label for="q">Search</label>
        <input type="text" name="q">
    </div>
    <div class="bw-button-group">
        <button type="submit">
            <span class="fas fa-search"></span>
                Search
        </button>
    </div>
</form>
```

![Inline Form](./doc-images/inline-form.png)

## Customization

Backwhite's styling is written in SCSS, with variables determining text size and coloring.

If you're using scss, you can customize Backwhite. In your main scss file, import backwhite's scss.

_main.scss_

```scss
// Declare variables...

// Import statement
@import '[path-to-module]/scss/backwhite.scss'
```

Now, just import the compiled main.css file in your html

```html
<head>
    <!-- meta... -->

    <!-- instead of [path-to-module]/dist/css/backwhite.css -->
    <link rel='sylesheet' href='[path-to-css]/main.css'/>

    <!-- this handles sliding and table responsiveness, so still import this! --->
    <script src='[path-to-module]/dist/js/backwhite.js' charset='utf-8'></script> 
</head>
```

### Colors

The main theme color is controlled by the `$back-color` variable. Changing this changes the entire coloring of the page! Usually this should be a dark color, so to not clash with the white background.


```scss
$back-color: #333; // Default
```

![Default](./doc-images/default.png)

```scss
$back-color: #331616;
```

![Back Color is #331616](./doc-images/back-color-331616.png)

```scss
$back-color: #163318;
```

![Back Color is #163318](./doc-images/back-color-163318.png)

### Spacing

Spacing is controlled by `$spacing-unit`.

```scss
$spacing-unit: 8pt; // Default
```

![Default](./doc-images/default.png)

```scss
$spacing-unit: 4pt;
```

![Spacing Unit is 4pt](./doc-images/spacing-unit-4pt.png)

```scss
$spacing-unit: 16pt;
```

![Spacing Unit is 16pt](./doc-images/spacing-unit-16pt.png)

### Fonts

The main font is controlled with `$font-family`.

```scss
$font-family: "Calibri Light", sans-serif; // Default
```

![Default](./doc-images/default.png)

```scss
$font-family: "Verdana", sans-serif;
```

![Font Family Verdana](./doc-images/font-family-verdana.png)

Code font is controlled by `$code-font-family`.

```scss
$code-font-family: "Consolas", monospace; // Default
```

![Code Default](./doc-images/code-default.png)

_Consolas is provided with Backwhite_

```scss
$code-font-family: "Monaco", monospace;
```

![Code Monaco](./doc-images/code-monaco.png)


### Font Scales

There are 4 font size variables that control the size of different parts of code.

```scss
$large-font-size; // Controls h1 font size
$medium-font-size; // Controls h2, h3, h4 font size
$normal-font-size; // Controls normal font size
$small-font-size; // Controls footer font size
```

### Layout

On desktop, the width of the side menu is controlled by `$desktop-menu-size`.

```scss
$desktop-menu-size: 300px; // Default
```

![Default](./doc-images/default.png)

```scss
$desktop-menu-size: 500px;
```

![Menu Size 500](./doc-images/menu-500.png)

### Responsiveness

#### Mobile

To change the breakpoint when the web app switches to mobile styling, use `$mobile-width`

```scss
$mobile-width: 760px; // Default
```

![Default Responsive](./doc-images/default-resp.png)

```scss
$mobile-width: 900px;
```

![Responsive 900](./doc-images/resp-900.png)

#### Tablet

To change the breakpoint when the web app switches to tablet styling, use `$tablet-width`

```scss
$tablet-width: 1200px; // Default
```

![Default Responsive Tablet](./doc-images/default-resp-tablet.png)

```scss
$tablet-width: 1230px;
```

![Responsive Tablet 1230](./doc-images/resp-tablet-1230.png)