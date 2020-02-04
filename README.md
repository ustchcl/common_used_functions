# common_used_functions

A new Flutter package project.
实现了大部分除`Object`的[ramda.js](ramdajs.com)的函数。  
 
加上一些switch if表达式。和一些基础扩展。  

部分函数待测试。  

🍺🍺🍺🍺🍺🍺🍺🍺
文档， 参考ramda.js

## Getting Started

### 1. Functions
*代表用extension实现
```haskell

always :: a -> (* -> a)

ap :: Apply f => f (a -> b) -> f a -> f b

applyTo* :: a -> (a -> b) -> b

ascend :: Ord b => (a -> b) -> a -> a -> Number

comparator :: ((a, b) -> boolean) -> ((a, b) -> Number)

// compose
after* :: (b -> c) -> (a -> b) -> (a -> c)

converge :: (a, b, c...)
average = converge(divide, [sum, length])
average([1,2,3,4]) = 2.5


curry* :: (* -> a) -> (* -> a)

empty* :: a -> a

F :: * -> Boolean

flip(*) :: (a -> b -> c) -> (b -> a -> c)

identity :: a -> a

juxt :: [(a, b) -> n] -> (a -> b) -> [n]

lift(*) :: (a -> b) -> (f a -> f b)

memoizeWith :: (* -> a) -> (* -> a)

o :: (b -> c) -> (a -> b) -> (a -> c)

of :: a -> [a]

once :: (a.. -> b) -> (a.. -> b)

pipe* :: (a -> b) -> (b -> c) -> a -> c

T :: * -> Boolean


```

### 2. list

### 3. logic

### 4. object

### 5. relation


### 6. string

### 7. types