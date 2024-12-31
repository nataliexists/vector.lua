# vector.lua
a simple vector library for lua. this was mainly made to practice using metatables lol

## installation
first, download `vector.lua` and add it to your project or whatever.
then, add this wherever you `require` your libraries:
```lua
require "vector"
```

## vectors
`vector.lua` is all about vector objects you create using the `vector()` function.
vectors are tables consisting of a list of values, starting at 1 (one). creating a vector looks something like this:
```lua
v = Vector(10, 254, 27)
```
this is almost the same as
```lua
v = {10, 254,  27}
```
but there is one key distinction, ill demonstrate it with this block of code:
```lua
v = Vector(5, -265, 111)
print(v[1]) --> 5
print(v.x)  --> 5

print(v.x == v[1]) --> true

print(v.y) --> -265
```
you can also access values in vectors using letters. specifically x, y, z, and w, in that order, but r, g, b, and a also works the same for reasons ill get into later.

## functions

### Vector(...)
creates a vector with a size of the length of `...`, with each of the values in the vector corresponding to the argument of the same index.
```lua
v = Vector(644, 213, -186, 320, 123)
```

### Vec1, Vec2, Vec3, and Vec4(...)
like `Vector` except that it has a set size and any missing values are automatically set to 0.
```lua
v = Vec3(1,2)
print(v.x) --> 0
print(v.y) --> 0
print(v.z) --> 0
```

### Vec(size, ...)
`Vector` but the size is set by the `size` argument.
```lua
v = Vec(100, 5, 8, 123)
print(v.x)   --> 5
print(v[3])  --> 123
print(v[54]) --> 0
```

### VecC(...)
`Vec4` but the default value is 1 instead of 0. mainly made for [LÖVE](https://love2d.org)'s colour values. this is also why you can also use r, g, b, and a to access vectors.
```lua
col = VecC(1,0,0)
col.b = 1
love.graphics.setColor(col)
love.graphics.print("wow! this text is magenta.")
```
