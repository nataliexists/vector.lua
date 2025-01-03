-- vector.lua
-- a simple vector library made by nataliexists
-- this is licensed under the mit license
-- im very professional, i know

local SPECIAL_KEYS = {x=1, y=2, z=3, w=4, r=1, g=2, b=3, a=4}
local mt = {}

mt.__index = function(tab, key)
  if SPECIAL_KEYS[key] then
    if SPECIAL_KEYS[key] > #tab then
      return
    end

    return tab[SPECIAL_KEYS[key]]
  end
end

mt.__newindex = function(tab, key, value)
  if SPECIAL_KEYS[key] then
    if SPECIAL_KEYS[key] > #tab then
      assert(false, "vector value assignment (letter used is ".. key ..") is out of range!")
    end

    tab[SPECIAL_KEYS[key]] = value
  else
    rawset(tab, key, value)
  end
end

local vector_enlarge = function(vector, size)
  local new = Vec(size)

  local j = 1
  for i=1, size do
    new[i] = vector[j]

    j = j + 1
    if j > #vector then
      j = 1
    end
  end

  return new
end

local easy_op = function(a, b, f)
  local new_a, new_b

  if type(a) == "number" then
    new_a = Vec1(a)
  else
    new_a = vector_enlarge(a, #a)
  end

  if type(b) == "number" then
    new_b = Vec1(b)
  else
    new_b = vector_enlarge(b, #b)
  end

  if #new_a > #new_b then
    new_b = vector_enlarge(new_b, #new_a)
  else
    new_a = vector_enlarge(new_a, #new_b)
  end

  local result = Vec(#new_a)
  for i=1, #new_a do
    result[i] = f(new_a[i], new_b[i])
  end

  return result
end

mt.__add = function(a, b)
  return easy_op(a, b, function(a,b) return a + b end)
end

mt.__sub = function(a, b)
  return easy_op(a, b, function(a,b) return a - b end)
end

mt.__mul = function(a, b)
  return easy_op(a, b, function(a,b) return a * b end)
end

mt.__div = function(a, b)
  return easy_op(a, b, function(a,b) return a / b end)
end

mt.__mod = function(a, b)
  return easy_op(a, b, function(a,b) return a % b end)
end

mt.__pow = function(a, b)
  return easy_op(a, b, function(a,b) return a ^ b end)
end

mt.__unm = function(a, b)
  return easy_op(a, b, function(a,b) return -a end)
end

local vector_setup = function(default, size, ...)
  local vec = {}
  for i=1, size do
    if i <= select("#", ...) then
      vec[i] = select(i, ...)
    else
      vec[i] = default
    end
  end

  setmetatable(vec, mt)

  return vec
end

function Vector(...)
  return Vec(select("#", ...), ...)
end

function Vec(size, ...)
  return vector_setup(0, size, ...)
end

function Vec1(...)
  return vector_setup(0, 1, ...)
end

function Vec2(...)
  return vector_setup(0, 2, ...)
end

function Vec3(...)
  return vector_setup(0, 3, ...)
end

function Vec4(...)
  return vector_setup(0, 4, ...)
end

function VecC(...)
  return vector_setup(1, 4, ...)
end