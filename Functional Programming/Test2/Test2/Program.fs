(*
 4.2-0 Определить функцию, вычисляющую значение выражения
 для заданного натурального числа n и функции f. Написать программу,
 использующую эту функцию.
 Рассмотренное выражение — значение в нуле интерполяционного
 многочлена Лагранжа. Иными словами, программа будет по значениям
 f(1), f(2), ... f(n) приближенно находит значение f(0) 
*)
let n = 100.0
let m = 3.0
let g = fun x -> x * x + 3.0

printfn "4.2-0 Значение в нуле интерполяционного многочлена Лагранжа"
let rec Multiplication acc k m n =
    if k > n then
        acc
    else
        if k = m then
            Multiplication acc (k + 1.0) m n
        else
            Multiplication (acc * k / (k - m)) (k + 1.0) m n  

let Mult = Multiplication 1.0 1.0

printfn "Mult= %A" (Mult m n) 

let rec Summa acc f m n =
    if m > n then
        acc
    else
        Summa (acc + f(m) * (Mult m n)) f (m + 1.0) n

printfn "f(0)= %A" (Summa 0.0 g m n) 

printfn "-----------------------------------------------------------"
(* 
 4.2-5 Определить функцию для приближённого вычисления произ-
 водной по формуле:
 для заданного малого числа h точки x и функции f
 Написать программу, использующую эту функцию.*)

printfn "4.2-5 Определить функцию для приближённого вычисления производной"

let Derivative h f x = (-3.0 * f(x) + 4.0 * f(x + h) - f(x + 2.0 * h) / (1.0 * h))

let Derivative_simple h f x = ((f(x+h) - f(x))/h)

let f = fun x -> 2.0 * x

let h = 0.0000001

let df = Derivative h f

let dfs = Derivative_simple h f

let x0 = 5.0

printfn "f= %A" (f x0)

printfn "df=%A - что-то не то" (df x0)

printfn "dfs=%A - по определению производной" (dfs x0)

printfn "-----------------------------------------------------------"

(*
4.2-9 Определить функцию для приближённого вычисления значения
определённого интеграла методом центральных прямоугольников по фор-
мулеНаписать программу, использующую эту функцию.
*)

printfn "4.2-9 Определённый интеграл методом центральных прямоугольников"

let N = 100.0
let a = 0.0
let b = 2.0

let rec Integral acc k N f a b =
    if k > N - 1.0 then
        1.0 * acc * (b - a) / N
    else
        Integral (acc + f(a + (k + 1.0 / 2.0) * (b - a) / N)) (k + 1.0) N f a b

let Int = Integral 0.0 0.0 N

let f1 = fun x -> x * x

printfn "Int(f1)_%A^%A=%A" a b (Int f1 a b)

let exp = fun x -> System.Math.Exp(x)

let f2 = exp

printfn "Int(f2)_%A^%A=%A (%A)" a b (Int f2 a b) (exp(b) - exp(a))

printfn "-----------------------------------------------------------"


let A() = System.Console.ReadLine()

let F = A()