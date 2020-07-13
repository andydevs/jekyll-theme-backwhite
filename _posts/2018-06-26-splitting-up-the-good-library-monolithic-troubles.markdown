---
layout: post
title:  "Splitting Up the Good Library (Monolithic Troubles)"
date:   "2018-06-26 19:19:00 -0400"
keywords: python3 good metaprogramming
excerpt_separator: <!--more-->
---

_Everyone hates software. It's messy and it get's everywhere._ - [Sam Gallagher](https://github.com/sjgallagher2) 2017

My friend just said it as I was showing this to him and I decided to quote it in the README as a joke, but it's quickly become a recurring theme for my overall experience developing the Good Library.

The Good Library was meant to be a utility library for writing more expressive code, eliminating redundancy, and solidifying some common python practices in code (like Duck-Typing through the use of Interfaces).  For me, it's been an exercise in seeing what I could create using the many meta-programming features and quirks of python (which I will definitely write more about).

However, I've written the library to large enough at this point to make me realize that I ran into a bit of a problem.

<!--more-->

## The Software was Messy and Got Everywhere

Even now, it's become a tall order to maintain, and I have even more features planned for the future than those I've put in the TODO.md file that you may have seen.

It's led to me making an "executive decision" to split the good library up into separate packages containing the individual features in the library, and to learning an important lesson in software design.

## Smaller is Better

It's _much_ easier to manage multiple small packages of code rather than one giant thing of code.

It's now common practice, for example, to split up a web application into several "microservices" that communicate with each other rather than having it all bundled together in one app.

Cloud computing provides access to all the storage, compute power, and infrastructure we need to build whatever we want, and Python, Node, Ruby, and even Java have advanced package/dependency management systems that automatically install all the modules required to run an application.

And with utility libraries like The Good Library, splitting up the code allows you to download the things you want, so you don't have to download the _entire_ library just to get annotations. A lot of these features don't really relate to each other, let alone depend on each other. But I decided to bundle them together in one monolithic package.

There's really no reason to do that anymore.

## In Conclusion

The moral of the story: Always keep your code as small and as compartmentalized as you can. Whenever you have an opportunity to split up a code base, take it. It will save you several headaches.

As for The Good Library, the main package is officially (or will soon be) deprecated, and will be replaced by several packages which will contain the separate features within the original library (along with many others). Look for packages with the prefix "good-" ahead of them.
