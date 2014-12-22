Typed Methods
=============

Add some type safety to your Ruby methods.

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

This is just an experiment.
