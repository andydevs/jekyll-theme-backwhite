---
layout:   post
title:    "The Single Most Beautiful Piece of Syntax Ever Invented"
date:     "2017-11-07 15:23:12 -0500"
edited:   true
keywords: python decorators python3 metaprogramming
---

Let's say you're writing some nice functions in python:

```python
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

def exp(x):
    """
    Computes the exponential of x
    """
    return sum((x**n)/factorial(n) for n in range(1000))

def sin(x):
    """
    Computes the sin of x
    """
    return sum((-1**n)*x**(2*n+1)/factorial(2*n+1) for n in range(1000))

def cos(x):
    """
    Computes the cos of x
    """
    return sum((-1**n)*x*(2*n)/factorial(2*n) for n in range(1000))
```

But you want your nice functions to work on lists as well, being called on each element if you pass a list. You may want to do a list comprehension or a map call, but if you're developing something like NumPy, you would want to make your code as clean and as concise as possible, so you just want something like this:

```python
arr = [1, 2, 3, 4, 5]

farr = factorial(arr) # [1, 2, 6, 24, 120]
```

Let's add this functionality to each of our nice functions.

```python
def factorial(n):
    """
    Computes the factorial of n
    """
    if type(n) is list:
        return [factorial(nk) for nk in n]
    else:
        if n == 0: return 1
        else: return n*factorial(n-1)

def exp(x):
    """
    Computes the exponential of x
    """
    if type(x) is list:
        return [exp(xk) for xk in x]
    else:
        return sum((x**n)/factorial(n) for n in range(1000))

def sin(x):
    """
    Computes the sin of x
    """
    if type(x) is list:
        return [sin(xk) for xk in x]
    else:
        return sum((-1**(n-1))*x**(2*n+1)/factorial(2*n+1) for n in range(1000))

def cos(x):
    """
    Computes the cos of x
    """
    if type(x) is list:
        return [cos(xk) for xk in x]
    else:
        return sum((-1**n)*x*(2*n)/factorial(2*n) for n in range(1000))
```

Well, now our nice functions don't look so nice anymore... It seems like we're writing a lot of redundant code. Is there a way to just write this code once and add it to our functions to make them nice again?

What if we did this?

```python
def elementwise(func):
    """
    Adds elementwise functionality to the function
    """
    def elementwise_wrapper(val):
        """
        Elementwise wrapper
        """
        if type(val) is list:
            return [func(elem) for elem in val]
        else:
            return func(val)

    # Return wrapper
    return elementwise_wrapper

def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)
factorial = elementwise(factorial)

def exp(x):
    """
    Computes the exponential of x
    """
    return sum((x**n)/factorial(n) for n in range(1000))
exp = elementwise(exp)

def sin(x):
    """
    Computes the sin of x
    """
    return sum((-1**n)*x**(2*n+1)/factorial(2*n+1) for n in range(1000))
sin = elementwise(sin)

def cos(x):
    """
    Computes the cos of x
    """
    return sum((-1**n)*x*(2*n)/factorial(2*n) for n in range(1000))
cos = elementwise(cos)
```

What's going on here? How are we defining functions within functions? How are we returning them? How are we passing them as arguments? How does this even work?

Let's go over a few things before explaining what this does.

## First-Class Closure Wrapper Functions

First, python functions are "first-class" functions. This means that they are values, and they can be defined within other functions, returned, and passed around just like other values. You can do something like this for example:

```python
def count_to_three():
    print ('one...two...three!')

# Saving the function in another variable!
counter = count_to_three

count_to_three() # prints 'one...two...three!'
counter() # Also prints 'one...two...three!'
```

It's completely valid! You can also do something like this:

```python
def create_greeting():
    greeting = 'Hello '

    def greet(name):
        print(greeting + name)

    # Returning the function we created (just like any other value)
    return greet

greet = create_greeting()
greet('George') # prints ('Hello George')
greet('Dave') # prints ('Hello Dave')
```

But wait! If you're calling the `greet` function outside the `create_greeting` function, wouldn't it not have access to the `greeting` variable since it's not in that scope anymore?

Actually, no. Python functions are also what are called "closures". A closure holds all the variables of the environment it was in even after it has left that environment. So, since the `greet` function is a closure, it still holds the `greeting` variable even after it's been returned.

_EDIT: Future Andy here to explain some specifics. A closure is not the function itself. Rather, it's a record of the function AND it's immediate environment. It really has more to do with implementation of the language, but it is still a feature of the language. Anyways, I will now quietly excuse myself and hop back in this time machine._

This also works for function arguments as well!

```python
def create_greeting(greeting):
    def greet(name):
        print(greeting + name)

    return greet

greet = create_greeting('We meet again, ')
greet('George') # prints 'We meet again, George'
greet('Dave') # prints 'We meet again, Dave'
```

Using these tools, we can create what's called a function factory, that can take some parameters and return a function generated from those parameters.

```python
def create_linear_function(scale, add):
    """
    Creates simple y = m*x + b linear functions
    """
    def linear(val):
        return scale*val + add

    return linear

# Generated functions
linear2_1 = create_linear_function(2, 1)
linear3_2 = create_linear_function(3, 2)

print(linear2_1(3)) # prints 7
print(linear2_1(2.1)) # prints 5.2
print(linear3_2(2.1)) # prints 8.3
```

This is cool enough on it's own, but we can do more.

We can create function factories with function parameters.

```python
def elementwise(func):
    """
    Adds elementwise functionality to the function
    """
    def elementwise_wrapper(val):
        """
        Elementwise wrapper
        """
        if type(val) is list:
            return [func(elem) for elem in val]
        else:
            return func(val)

    # Return wrapper
    return elementwise_wrapper
```

This brings us to the first part of that fancy new code. Here we define a function factory which takes a function and generates another function from it. The generated function takes in a value and checks if it's a list. If it is, it calls the given function on each element of that list and returns the list. Otherwise, it just calls the given function on the pure value.

We say that this function "wraps" the elementwise code around the given function. Hence, it's called a "wrapper".

```python
# Here's our original function
def cool_function(x):
    return 2*x**2 + 3

# Elementwise wraps code around the original function
even_cooler_function = elementwise(cool_function)

# Creating this:
def even_cooler_function(x):
    # Elementwise wrap
    if type(x) is list:
        # Original function
        return [2*xi**2 + 3 for xi in x]
    else:
        # Original function
        return 2*x**2 + 3
```

Wrappers are insanely useful at creating modular code which we can add to functions.

So now we can add this wrapper to all of our functions like this:

```python
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)
factorial = elementwise(factorial)

def exp(x):
    """
    Computes the exponential of x
    """
    return sum((x**n)/factorial(n) for n in range(1000))
exp = elementwise(exp)

def sin(x):
    """
    Computes the sin of x
    """
    return sum((-1**n)*x**(2*n+1)/factorial(2*n+1) for n in range(1000))
sin = elementwise(sin)

def cos(x):
    """
    Computes the cos of x
    """
    return sum((-1**n)*x*(2*n)/factorial(2*n) for n in range(1000))
cos = elementwise(cos)
```

And with that, our functions are back to being nice again! All thanks to the wonderful properties of first-class closure wrapper functions.

But oh no, my friend, python does not stop there. This code isn't pretty enough! We have a better way of writing this.

## BOOM! Decorators!

```python
@elementwise
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

@elementwise
def exp(x):
    """
    Computes the exponential of x
    """
    return sum((x**n)/factorial(n) for n in range(1000))

@elementwise
def sin(x):
    """
    Computes the sin of x
    """
    return sum((-1**n)*x**(2*n+1)/factorial(2*n+1) for n in range(1000))

@elementwise
def cos(x):
    """
    Computes the cos of x
    """
    return sum((-1**n)*x*(2*n)/factorial(2*n) for n in range(1000))
```

Nothing major happened. This is literally shorthand for what we just did. All the `@` says is "Take the below function, call the wrapper function on it, and save the result to the same variable". That's it!

Is this not the single most beautiful piece of syntax ever invented?

Do you want to add another decorator? You can do that! Let's make another wrapper which can parse string arguments

```python
def parse_string(func):
    """
    Adds numerical string parsing to the function
    """
    def parse_string_wrapper(val):
        """
        Parse string wrapper function
        """
        if type(val) is str:
            if '.' in val or 'e' in val or 'E' in val:
                return str(func(float(val)))
            else:
                return str(func(int(val)))
        else:
            return func(val)

    # Return wrapper
    return parse_string_wrapper
```

Now you can add two decorators at once!

```python
@elementwise
@parse_string
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)
```

Again, this just translates to

```python
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)
factorial = parse_string(factorial)
factorial = elementwise(factorial)
```

Let's go even more meta and create a decorator factory. For example, what if we want to scale our outputs by a particular factor?

```python
def scale(r):
    """
    Creates a scale wrapper which scales the output of the function by r
    """
    def scalar(func):
        """
        Scales the output of the function
        """
        def scalar_wrapper(val):
            """
            Scalar wrapper.
            """
            return r*func(val)
        return scalar_wrapper
    return scalar
```

We can directly add the function call as a decorator to our function

```python
@scale(3)
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

factorial(5) # Returns (5!)*3 = 360
```

And this doesn't just work for functions. It works for all callables in python! Basically, anything that you "call" with a function can be a decorator.

You can create a decorator from a class constructor

```python
class BetterFunction:
    def __init__(self, func):
        self._func = func

    def __call__(*args, **kwargs):
        self._func(*args, **kwargs)

    def map(self, array):
        return [self._func(elem) for elem in array]

@BetterFunction
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

# factorial is now an instance of BetterFunction

factorial.map([1, 2, 3, 4, 5]) # [1, 2, 6, 24, 120]
```

You can use decorators just to perform side-effects on functions, like creating a registry

```python
registry = dict()
def register(func):
    registry[func.__name__] = func
    return func # Make sure you return the function

@register
def my_function(x):
    return x**2

# Registry now has 'my_function': <function my_function at 0xabcdef0123456789>
```

You can even decorate classes!

```python
@register
class MyClass:
    def __init__(self, arg):
        self._arg = arg

# Registry now has 'MyClass': <class 'MyClass'>
```

And yes, `@classmethod`, `@staticmethod`, and `@property` are just examples of decorators.

## To Sum Up...

The true core of decorators is a combination of modular functionality and metaprogramming to create more expressive, concise, and powerful code. It's just one of the many reasons why I think Python is such an amazing language to code in, and it's something that I hope other languages (**cough**Java**cough**) can learn from and adopt.

## Footnotes

### What order should you apply your decorators?

You may have noticed that I placed the `parse_string` decorator under the `elementwise` decorator. This is because `elementwise` is to be called first, checking if the value is an array, and then unpacking it. Then `parse_string` is called, checking if the value is a numerical string.

```python
@elementwise # Called first
@parse_string # Called next
def exp(x):
    """
    Computes the exponential of n
    """
    return sum((x**n)/factorial(n) for n in range(1000))

exp(2) # Works
exp('2.3') # Works
exp([0.1, 2]) # Works
exp([0.1, 2, '0.5', '4']) # Works
```

If they were placed in the opposite order, the function will first check if the value is a string, and then check if it's an array. This wouldn't pick up on string elements within an array, for example.

```python
@parse_string # Called first
@elementwise # Called next
def exp(x):
    """
    Computes the exponential of n
    """
    return sum((x**n)/factorial(n) for n in range(1000))

exp(2) # Works
exp('2.3') # Works
exp([0.1, 2]) # Works
exp([1, 2.3, '2e3']) # Doesn't work!
```

Remember, these are wrapper functions. You can think of them like nesting Russian dolls. The outermost decorator wraps around the inner decorators and is called first. The hard-coded version of the function would be something like this:

```python
# This:
@elementwise
@parse_string
def exp(x):
    """
    Computes the exponential of n
    """
    return sum((x**n)/factorial(n) for n in range(1000))

# Creates this:
def exp(x):
    # elementwise wrapper
    if type(x) is list:
        val = []
        for xi in x:

            # parse_string wrapper
            if type(xi) is str:
                if '.' in xi or 'e' in xi or 'E' in xi:
                    # function
                    val.append(str(sum((float(xi)**n)/factorial(n) for n in range(1000))))
                else:
                    # function
                    val.append(str(sum((int(xi)**n)/factorial(n) for n in range(1000))))
            else:
                # function
                val.append(sum((xi**n)/factorial(n) for n in range(1000)))

        return val
    else:

        # parse_string wrapper
        if type(x) is str:
            if '.' in x or 'e' in x or 'E' in x:
                # function
                return str(sum((float(x)**n)/factorial(n) for n in range(1000)))
            else:
                # function
                return str(sum((int(x)**n)/factorial(n) for n in range(1000)))
        else:
            # function
            return sum((x**n)/factorial(n) for n in range(1000))
```

Sure makes you appreciate the power of decorators, don't it?

### Preserving Properties of the Wrapped Function

Note that, since you are creating a new object from the original function/class, you may be overwriting properties like documentation and argument specs.

```python
def elementwise(func):
    """
    Adds elementwise functionality to the function
    """
    def elementwise_wrapper(val):
        """
        Elementwise wrapper
        """
        if type(val) is list:
            return [func(elem) for elem in val]
        else:
            return func(val)

    # Return wrapper
    return elementwise_wrapper

@elementwise
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

factorial.__doc__ # is now "Elementwise wrapper", Not "Computes the factorial of n" like we want it to be
```

The way to get around this is to use a proprietary decorator constructor called `wraps` (provided in the `functools` module), that takes the wrapped function as a parameter and overwrites the properties of the wrapper with those of the wrapping function

```python
from functools import wraps # Import this

def elementwise(func):
    """
    Adds elementwise functionality to the function
    """
    @wraps(func) # Add this
    def elementwise_wrapper(val):
        """
        Elementwise wrapper
        """
        if type(val) is list:
            return [func(elem) for elem in val]
        else:
            return func(val)

    # Return wrapper
    return elementwise_wrapper

@elementwise
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

factorial.__doc__ # is still "Computes the factorial of n"
```

The decorator constructor `wraps` is an implementation of `update_wrapper` (also provided in `functools`), which takes the wrapped object and the wrapper object, and transfers properties accordingly. This can be used in class-constructor decorators.

```python
from functools import update_wrapper # Import this

class BetterFunction:
    def __init__(self, func):
        self._func = func
        update_wrapper(self, func) # Add this here

    def __call__(*args, **kwargs):
        self._func(*args, **kwargs)

    def map(self, array):
        return [self._func(elem) for elem in array]

@BetterFunction
def factorial(n):
    """
    Computes the factorial of n
    """
    if n == 0: return 1
    else: return n*factorial(n-1)

# factorial is now an instance of BetterFunction

factorial.map([1, 2, 3, 4, 5]) # [1, 2, 6, 24, 120]

factorial.__doc__ # is still "Computes the factorial of n"
```
