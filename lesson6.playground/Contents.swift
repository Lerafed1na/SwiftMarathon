import Foundation
//Task1

let a = "99"
let b = "1w1"
let c = "-5"
let d = "2.4"
let e = "ola"

var aInt1 = Int(a) ?? 0
var bInt1 = Int(b) ?? 0
var cInt1 = Int(c) ?? 0
var dInt1 = Int(d) ?? 0
var eInt1 = Int(e) ?? 0

var sum = aInt1 + bInt1 + cInt1 + dInt1 + eInt1

let sumInter = "\(aInt1) + \(bInt1) + \(cInt1) + \(dInt1) + \(eInt1) = \(sum)"

print (sumInter)

let a1 = ( Int(a) != nil ) ? a : "nil"
let b1 = ( Int(b) != nil ) ? b : "nil"
let c1 = ( Int(c) != nil ) ? c : "nil"
let d1 = ( Int(d) != nil ) ? d : "nil"
let e1 = ( Int(e) != nil ) ? e : "nil"

//interpolation
let sumInter2 = "\(a1) + \(b1) + \(c1) + \(d1) + \(e1) = \(sum)"
print(sumInter2)

//concatenation
let sumCon = a1 + " + " + b1 + " + " + c1 + " + " + d1 + " + " + e1 + " = \(sum) "
print(sumCon)

//Task2

let symbols = "\u{266B} \u{2605} \u{2744} \u{1F64F} \u{260E} "

print(symbols)
print("count = \(symbols.count)")
print("length = \((symbols as NSString).length)")

//Task3

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let symbol: Character = "l"

alphabet.count

var index = 0

for letter in alphabet {
    if symbol == letter {
        print("Index symbol \(symbol) = \(index)")
    } else {
        index += 1
    }
}










