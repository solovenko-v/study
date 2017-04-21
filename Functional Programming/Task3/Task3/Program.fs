
let rec readFloat() =
    match System.Double.TryParse(System.Console.ReadLine()) with
    | false, _ -> printfn "?"; readFloat()
    | _, x -> x

printf "a="
let a = readFloat()
printf "eps="
let eps = readFloat()

let rec _sqrtHeron acc a eps =
    if abs(acc * acc - a) < eps then
        acc
    else
        _sqrtHeron ((acc + a / acc) / 2.0) a eps

let sqrtHeron = _sqrtHeron 1.0 

let sqrtH = sqrtHeron a eps 
printfn "sqrt = %A" sqrtH
printfn "delta = %A" (sqrt(a) - sqrtH)

let any = System.Console.ReadLine()             