
let rec readFloat() =
    match System.Double.TryParse(System.Console.ReadLine()) with
    | false, _ -> printfn "?"; readFloat()
    | _, x -> x

//ввод с клавиатуры коэффициентов
printfn "a1"
let a1 = readFloat()
printfn "b1"
let b1 = readFloat()
printfn "c1"
let c1 = readFloat()

printfn "a2"
let a2 = readFloat()
printfn "b2"
let b2 = readFloat()
printfn "c2"
let c2 = readFloat()

printfn "a3"
let a3 = readFloat()
printfn "b3"
let b3 = readFloat()
printfn "c3"
let c3 = readFloat()

let IsParallel (a:float, b:float, c:float) (a1:float, b1:float, c1:float) =
    if b <> 0.0 && b1 <> 0.0 then 
        if a/b = a1/b1 then true
        else false
    else 
        if a <> 0.0 && a1 <> 0.0 then 
            if b/a = b1/a1 then true
            else false
        else
            false

let Det3 (a1, b1, c1) (a2, b2, c2) (a3, b3, c3) = a1 * b2 * c3 + b1 * c2 * a3 + c1 * a2 * b3 - c1 * b2 * a3 - b1 * c3 * a2 - a1 * c2 * b3 

let isPoint = Det3 (a1, b1, c1) (a2, b2, c2) (a3, b3, c3) = 0.0   

let isTriangle = not(IsParallel (a1, b1, c1) (a2, b2, c2))  &&  not(IsParallel (a1, b1, c1) (a3, b3, c3)) && not(IsParallel (a2, b2, c2) (a3, b3, c3)) && not(isPoint)
   
if isTriangle then
    printfn "Это треугольник"
else
    if isPoint then
        printfn "Это точка"  
    else
        printfn "Х.з."
        
let any = System.Console.ReadLine()             
