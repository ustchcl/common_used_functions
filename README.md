# common_used_functions
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
```
实现了List上常用的方法
take 
takeWhile
takeLast
skip
skipWhile
skipLast
reversed
splitEvery
```

### 7. types
```dart
typedef F1 Fn0<F1>();
typedef F2 Fn1<F1, F2>(F1 f1);
typedef F3 Fn2<F1, F2, F3>(F1 f1, F2 f2);
typedef F4 Fn3<F1, F2, F3, F4>(F1 f1, F2 f2, F3 f3);
typedef F5 Fn4<F1, F2, F3, F4, F5>(F1 f1, F2 f2, F3 f3, F4 f4);
```

### 8. others
**函数扩展**
```haskell
-- 使用于异步方法， 例如：
-- 按钮点击的回调，如果回调是异步方法`f`, 
-- 1. 不希望在f未完成时，再次触发。
-- var g = series(f);
-- g(); // OK
-- g(); // return Future.error
-- 2. 希望在当前执行完之后，触发回调
-- var g = series(f, true)
-- g(); // OK
-- g(); // wait for first g complete, and execute;
series :: (() -> Future<A>, [bool]) -> (() -> Future<A>)

-- curry
curry1 :: (a -> b -> c) -> a -> b -> c
curry2 :: (a -> b -> c -> d) -> a -> b -> c -> d
curry3 :: (a -> b -> c -> d -> e) -> a -> b -> c -> d -> e

-- wrap 将固定参数给与带参函数，然后变成无参函数
-- 实际上
-- wrap :: ((a -> a), a) -> (() -> a) 
wrap :: a -> () -> a
wrap1 :: ((a -> b), a) -> (() -> b)
```


**if switch 表达式**
```dart
void ifExprTest() {
    var x = 2020;
    while (x != 1) {
        x = ifExpr(isOdd(x), 3 * x + 1)
            .otherwise(x / 2)
    }
}

enum Color { R, G, B}
void switchExprTest() {
    Color x = Color.R;
    // 注意此处类型需要指明， 否则结果为dynamic
    var name = switchExpr<Color, String>(result)
            .caseOf(Color.R, "Red")
            .caseOf(Color.G, "Green")
            .caseOf(Color.B, "Blue")
            .otherwise("Unkonw Color");
}
```
