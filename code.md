---
layout: default
---

```csharp
public class Person {
    private String name;
    private String email;
    private int birthYear;

    public Person(string name, string email, int birthYear) {
        this.name = name;
        this.email = email;
        this.birthYear = birthYear;
    }

    public string Name {
        get { return name; };
        set { name = value; };
    }

    public string Email {
        get { return email; };
    }

    public int Age {
        get { return Date.today().Year - birthYear; }
    }
}
```

```html
<body>
    <h1>Hello World</h1>

    <div class='main'>
        <p>Loreum ipsum...</p>
    </div>
</body>
```