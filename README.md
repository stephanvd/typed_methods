Typed Methods
=============

Add some type safety to your Ruby methods. Methods defined with `tdef` will check types of arguments and return values.

Usage
----

```Ruby
class Toy
  extend TypedMethods

  tdef :multiply_and_print, number1: Fixnum, number2: Fixnum, text: String, return: String do
    "#{text}#{number1 * number2}"
  end
end

 multiply_and_print 3, 4, "Result is: "
 # => Result is: 12
```

Errors
------
Invalid input will raise an ArgumentTypeError:
```Ruby
TypedMethods::ArgumentTypeError: String expected, Fixnum found.
```

Invalid output will raise a ReturnTypeError:
```Ruby
TypedMethods::ReturnTypeError: String expected, Fixnum found.
```

Disclaimer
---------

This is just an experiment.
