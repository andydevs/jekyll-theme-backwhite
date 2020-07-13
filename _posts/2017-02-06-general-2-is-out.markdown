---
title:    General 2.0 Is Out!
layout:   post
date:     2017-2-6
keywords: general ruby "general 2.0"
excerpt_separator: <!--more-->
---

UPDATE 9/16/2017: General is gonna go on the backburner for now. I'll still keep it up, since I know people are using it, but don't expect updates. <!--more-->

Well that took forever!

Yes! General 2.0 is finally on RubyGems. Here's a summary of the new features:

## General IO PrePartials!

Now you can include other template files using `@@include [filename]` in your file.

File to include

	@(title)
	@(author)
	@(subject)
	@(date)

Including file

	@@include file

	@(content)

Resulting File

	@(title)
	@(author)
	@(subject)
	@(date)

	@(content)

You can also extend other files using `@@extend [filename]`, which will wrap the content of that file at the `@@yield` around the extending file, like so:

File to Extend

	<!doctype html>
	<html>
	<title>@(title -> capitalize all)</title>
	<body>
	@@yield
	</body>
	</html>

Extending File

	@@extend file

	<h1>@(name)'s Profile!</h1>
	<p>Favorite Color: @(color)</p>
	<p>Favorite Sport: @(sport)</p>

Resulting File

	<!doctype html>
	<html>
	<title>@(title -> capitalize all)</title>
	<body>
	<h1>@(name)'s Profile!</h1>
	<p>Favorite Color: @(color)</p>
	<p>Favorite Sport: @(sport)</p>
	</body>
	</html>

## Operation Arguments

You can now pass arguments to operations to modify their behavior!

For example: `@(name -> capitalize first)` will capitalize the first letter of the first word in the string, whereas `@(name -> capitalize all)` will capitalize the first letter of every word in the string. You can also pass a GTimeFormat to the time operation to specify the format of time `@(time -> time '@MM:@SS @HH')`.

## To-Array Operations (and the Full Placeholder)

Now you can pass regular data into special operations that turn the data into arrays, which can be used by array templates with the new Full Placeholder `@#`! This passes in a string representation of the entire data set, convenient for to-array operations!

	@[groceries -> split]
		I need to get some @#!
	@[\n].

## Dot-Notation

Nested data can be accessed using dot notation! For example: `{name: {first: 'joe', last: 'schmoe'}}` can be accessed using: `@(name.first) @(name.last)`. This can continue for multiple levels, e.g. `@(person.name.first)`

## .generalized Method

Classes can now be parsed directly by general templates if they implement the `.generalized` method. The method should return a hash of the named data to be parsed by a general.

## Special Characters

Like in HTML, special characters can be written as `@[code];`, to avert confusion and parse errors.

## Conclusion

Details on these features can be found on the [main webpage](http://andydevs.github.io/general) for General.

One last note: You know when you think of making something, and you try to make it not knowing if it's going to work or not, and it doesn't work... and now you're left with a tray of unbaked cake batter in the oven which couldn't rise properly because you put too many eggs in? Well, hidden in the unit tests and the source code are leftover batter lumps of a failed cake of my own. These are the `regex` and `match` methods found in the templates and placeholders.

Yes. I tried to reverse the process and see if I could retrieve data from strings and files rather than put data into them. I'm not abandoning the idea. It's just that the way I was going about it led to some problems (especially with array templates and placeholder operations) I may implement a lighter, shorter version of the reversable template later on (which will still be useful as I mainly intended this to be a means of searching for files of a particular file path format). Untill then, these methods are depricated and will be removed in a later update, so don't bother with them.
