# Vector.lua
A simple vector library for lua. This was mainly made to practice using metatables.

## Installation
First, download `vector.lua` and add it to your project.
Then, add this wherever you put the `require` for your libraries:
```lua
require "vector"
```

## Vectors
`Vector.lua` is all about vector objects which you create using the `vector()` function.
Vectors are tables consisting of a list of values, starting at 1. Creating a vector looks like this:
```lua
v = Vector(x)
```
For example, if you want to create a vector consisting of the values 10, 254 and 27, it would look like this:
```lua
v = Vector(10, 254, 27)
```
This is almost the same as
```lua
v = {10, 254,  27}
```
But, there is one key distinction demonstrated in this block of code:
```lua
v = Vector(5, -265, 111)
print(v[1]) --> 5
print(v.x)  --> 5

print(v.x == v[1]) --> true

print(v.y) --> -265
```
You can also access values in vectors using letters, specifically x, y, z, and w, in that order. However r, g, b, and a also work the same for reasons I'll get into later.

## Functions

### Vector(x)
Creates a vector with a size of the length of `x`, with each of the values in the vector corresponding to the argument of the same index.

Example:
```lua
v = Vector(644, 213, -186, 320, 123)
```

### Vec1(x), Vec2(x), Vec3(x), and Vec4(x)
Like `Vector` except that it has a set size and any missing values are automatically set to 0.

Example:
```lua
v = Vec3(1,2)
print(v.x) --> 0
print(v.y) --> 0
print(v.z) --> 0
```

### Vec(size, x)
`Vector` but the size is set by the `size` argument.

Example:
```lua
v = Vec(100, 5, 8, 123)
print(v.x)   --> 5
print(v[3])  --> 123
print(v[54]) --> 0
```

### VecC(...)
`Vec4` but the default value is 1 instead of 0, mainly made for [LÖVE](https://love2d.org)'s colour values. This is also why you can also use r, g, b, and a to access vectors.
```lua
col = VecC(1,0,0)
col.b = 1
love.graphics.setColor(col)
love.graphics.print("Wow! This text is magenta!")
```
