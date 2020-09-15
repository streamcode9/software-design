# Lego (IKEA rail way) philosophy
1 all pieces are designed to be connected
2 peices are reusable in differenct contexts
3 you can construct new peice from two or more pieces and it still be meet 1 and 2

# Functions

```
input -> function => output
```

Input and output are also could be functions.
Parameter could be a function.

# Functions composition

```js
add1   = x => x + 1
time2  = x => x * 2
square = x => x * x
square(time2(add1(5)))
```

Piping. Azure pipeline.

```js
// 5 |> add1 |> time2 |> square
pipe(5, add1, time2, square)
```

```js
// Service = Low-level operation -> Low-level operation
Address -> AddressValidator => ValidationResult

// Use-case = Service -> Service
// ChangeProfileRequest -> UpdateProfileData

```

# Types

# Types composition

----

[0] fsharpforfunandprofit
