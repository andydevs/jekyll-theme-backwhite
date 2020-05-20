---
layout: post
title: "But What Are Descriptors?"
date: "2019-02-03 15:35:22 -0500"
keywords: python3 metaprogramming descriptors
excerpt_separator: <!--more-->
---

Let's say I have a `Person` class that contains the name, email, and birthday of a person. I want my `Person` class to do the following:

- Provide the name of the person, but not allow it to be changed
- Provide the email of the person and allow it to be changed
- Provide the age of the person, which is calculated in years from their birthday and today's date.

These business rules all have to deal with properties. Objects often have "properties" which are calculated from internal data. In fact, you often just want properties which allow access to other private member variables, enforcing how you access or manipulate objects and their data. <!--more--> Two of our business rules, the ones pertaining to the name and the email of the person, are examples of those kinds of properties. The age, however, is an example of a calculated property.

In Java, you write properties using "get" and "set" methods like so:

```java
class Person {
    // Private member variables
    private String name;
    private String email;
    private Date birthday;

    public Person(String name, String email, Date birthday) {
        this.name = name;
        this.email = email;
        this.birthday = birthday;
    }

    // Name
    public String getName() { return name; }

    // Email
    public String getEmail() { return email; }
    public void setEmail(String value) { email = value; }

    // A Calculated Property
    public int getAge() {
        return Date.today().getYear() - birthday.getYear();
    }
}
```

You get and set the property by calling the appropriate method. For example, if you want to get the email, you call `person.getEmail()`. Likewise, if you want to set the email, you use `person.setEmail("[new-name]")`.

In C#, you have the nicer `{ get; set; }` syntax, that can define the getters and setters of a property.

```csharp
public class Person {
    // Private variables
    private string name;
    private string email;
    private DateTime birthday;

    // Constructor
    public Person(String name, String email, DateTime birthday) {
        this.name = name;
        this.email = email;
        this.birthday = birthday;
    }

    // Get name
    public string Name {
        get { return name; }
    }

    // Get and set email
    public string Email {
        get { return email; }
        set { email = value; }
    }

    // Calculated property
    public int Age {
        get { return DateTime.Today.Year - birthday.Year; }
    }
}
```

This lets you access the property like it's another member variable. Just use `person.Email` to get the email and `person.Email = "[new-email]"` to set the email.

Python has no concept of public and private member variables. The convention for declaring "private" variable is to put an underscore (`_`) in front of the property.

```python
class Person:
    def __init__(self, name, email, birthday):
        self._name = name
        self._email = email
        self._birthday = birthday
```

This doesn't tell Python that the variables are private. It just tells other programmers not to mess with them! As for properties, you have the `property` decorator, which allows you to define properties from functions. You then use the `.setter` attribute of your new property to implement setters.

```python
class Person:
    def __init__(self, name, email, birthday):
        self._name = name
        self._email = email
        self._birthday = birthday

    # Get name
    @property
    def name(self):
        return self._name

    # Get and set email
    @property
    def email(self):
        return self._email
    @email.setter
    def email(self, value):
        self._email = value

    # Get age, a calculated property
    @property
    def age(self):
        return datetime.today().year - self._birthday.year
```

Here, you can call `person.name`, and it will call the associated method to get the result.

But this is only scratching the surface of what python can do! Python's property system goes much further than just emulating private member variables and `{ get; set; }` syntax.

There is, in fact, a much cleaner way to write this.

## BOOM! Descriptors!

```python
class Get:
    def __init__(self, member):
        self._member = member

    def __get__(self, instance, klass=None):
        return getattr(instance, self._member)

class GetSet:
    def __init__(self, member):
        self._member = member

    def __get__(self, instance, klass=None):
        return getattr(instance, self._member)

    def __set__(self, instance, value):
        setattr(instance, self._member, value)

class YearsSince:
    def __init__(self, member):
        self._member = member

    def __get__(self, instance, klass=None):
        return datetime.today().years - getattr(instance, self._member).years

class Person:
    def __init__(self, name, email, birthday):
        self._name = name
        self._email = email
        self._birthday = birthday

    name = Get('_name')
    email = GetSet('_email')
    age = YearsSince('_birthday')
```
Okay, how does this work exactly?

What I've just created is called a "descriptor". A descriptor is any class that implements the `__get__` and/or `__set__` magic methods (there's also `__delete__`, but I won't cover that here). They aren't properties themselves. Rather, they "describe" a property. More specifically, they "describe" how to access and manipulate this property.

`__get__` controls how a property is accessed from an object, which is passed into the method as `instance`. When the `name` property is being accessed, the `__get__` method in the `Get` descriptor is called, which uses `getattr` to get the attribute `'_name'` from the instance.

`__set__` controls how a property is set, where the instance containing the property to be set is passed as `instance`, and the new value being set is passed as `value`. When `email` is being set to a value, the `__set__` method in the 	`GetSet` descriptor is called, which sets `_email` in the instance to the new value (using `setattr`).

`age` is an example of a calculated property descriptor, `YearsSince`. This descriptor's `__get__` method gets a date from the given member variable and returns the current number of years since that date (using `datetime.today()`). In the case of `Person`, it takes the `_birthdate` of person and calculates the years since that date, more simply the age of the person.

Okay, that's great and all, but why is this better than just writing properties? If anything, it seems like we're writing even more code.

## Why Descriptors are Awesome

Let's say that this `Person` class is part of a larger inventory management program for a dairy farm, and this program has a bunch of other classes, particularily `Cow`, `Milk`, and `Cheese`.  These classes have the following business rules:

- `Cow`
	- Provide the name of the cow, but not allow it to be changed
	- Provide the age of the cow calculated in years from their birth date and today's date
	- Provide the days since the cow's last milked, calculated in days from the last milked date and today's date.
	- Milk the cow, changing the last milked to today's date, and returning a Milk object
		- The milked date is equal to the last milked date of the Cow.
		- The amount is random from 1 to 1.5 in increments of 0.01
- `Milk`
	- Provide the amount of milk, but not allow it to be changed
	- Provide the days since the milk was milked calculated in days from milked date and today's date.
	- Cure the milk, returning a Cheese object
		- Weight is equal to half the amount.
		- The cure set date is equal to the date at which the function is called
- `Cheese`
	- Provide the weight of the cheese, but not allow it to be changed
	- Provide the cure months of the cheese calculated in months from cure set date and today's date.

Already, you can see that most of these rules are very similar. They are properties calculated from a difference between a date and today's date (measured in some sort of time unit). In fact, two of the other rules - providing the `Cow`'s name and the `Milk`'s amount - can also be implemented using the `Get` descriptor above.

We can generalize our `YearsSince` descriptor and make a `TimeUnitsSince` descriptor which also takes the time unit to measure the difference in

```python
class TimeUnitsSince:
    def __init__(self, member, unit):
        self._member = member
        self._unit = unit

    def __get__(self, instance, klass=None):
        today_units = getattr(datetime.today(), self._unit)
        member_units = getattr(getattr(instance, self._member), self._unit)
        return today_units - member_units
```

Now we can use this descriptor, along with the `Get` and `GetSet` descriptors, in all of our other classes!

```python
class Person:
    def __init__(self, name, email, birthday):
        self._name = name
        self._email = email
        self._birthday = birthday

    name = Get('_name')
    email = GetSet('_email')
    age = TimeUnitsSince('_birthday', 'year')

class Cow:
    def __init__(self, name, birthday):
        self._name = name
        self._birthday = birthday

    name = Get('_name')
    age = TimeUnitsSince('_birthday', 'year')
    days_since_last_milked = TimeUnitsSince('_last_milked', 'day')

    def milk(self):
        self._last_milked = datetime.today()
        amount = randrange(1, 1.5, 0.01)
        return Milk(amount, self._last_milked)

class Milk:
    def __init__(self, amount, milked):
        self._amount = amount
        self._milked = milked

    amount = Get('_amount')
    days_since_milked = TimeUnitsSince('_milked', 'day')

    def cure(self):
        return Cheese(self._amount / 2, datetime.today())

class Cheese:
    def __init__(self, weight, cure_set):
        self._weight = weight
        self._cure_set = cure_set

    weight = Get('_weight')
    cure_months = TimeUnitsSince('_cure_set', 'month')
```

To hammer in the point, here's the same system implemented without descriptors

```python
class Person:
    def __init__(self, name, email, birthday):
        self._name = name
        self._email = email
        self._birthday = birthday

    # Get name
    @property
    def name(self):
        return self._name

    # Get and set email
    @property
    def email(self):
        return self._email
    @email.setter
    def email(self, value):
        self._email = value

    # Get age, a calculated property
    @property
    def age(self):
        return datetime.today().year - self._birthday.year

class Cow:
    def __init__(self, name, birthday):
        self._name = name
        self._birthday = birthday

    # Get name
    @property
    def name(self):
        return self._name
    # Get age, a calculated property
    @property
    def age(self):
        return datetime.today().year - self._birthday.year

    # Get days_since_last_milked, a calculated property
    @property
    def days_since_last_milk(self):
        return datetime.today().day - self._birthday.day

    def milk(self):
        self._last_milked = datetime.today()
        amount = randrange(1, 1.5, 0.01)
        return Milk(amount, self._last_milked)

class Milk:
    def __init__(self, amount, milked):
        self._amount = amount
        self._milked = milked

    # Get amount
    @property
    def amount(self):
        return self._amount

    # Get days_since_milked, a calculated property
    @property
    def days_since_milked(self):
        return datetime.today().day - self._milked.day

    def cure(self):
        return Cheese(self._amount / 2, datetime.today())

class Cheese:
    def __init__(self, weight, cure_set):
        self._weight = weight
        self._cure_set = cure_set

    # Get amount
    @property
    def weight(self):
        return self._weight

    # Get days_since_milked, a calculated property
    @property
    def cure_months(self):
        return datetime.today().month - self._cure_set.month
```

## Conclusion

Now, this may not be the best example of python descriptors, but I've heard a bit about how descriptors are difficult to explain and perplexing even to experienced python developers. I felt a need to highlight this feature, because once you understand it, python descriptors are useful, versatile, and just downright cool. It's just another of Python's many metaprogramming features.
