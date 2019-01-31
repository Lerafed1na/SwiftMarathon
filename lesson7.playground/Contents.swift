let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
 
 print("Days without month")
 print()

 for  i in daysInMonth {
 print(i)
 }
print()

print("Month's name with days")
print()
 
 let monthName = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]

 for i in 0..<monthName.count {
 print("\(monthName[i]) has \(daysInMonth[i]) days")
 }
print()
 

print("The same with tuples")
print()
 
 var tuples = [(String, Int)]()
 
 for i in 0..<daysInMonth.count {
    let month = (month: monthName[i], day: daysInMonth[i])
    tuples.append(month)
 }
print(tuples)

print("Days in reverse order")
print()

for i in (0...daysInMonth.count-1).reversed() {
    print("\(monthName[i]) has \(daysInMonth[i]) days")
}
print()

print("Certain day")

let certainDay = (month:6, day:4)

var dayOff = 0
for i in 0..<(certainDay.month-1) {
        dayOff += daysInMonth[i]
    }
dayOff += certainDay.day

 
//Task2

let a = "99"
let b = "1w1"
let c = "-5"
let d = "2.4"
let e = "ola"

let arrayConst = [Int(a), Int(b), Int(c), Int(d), Int(e)]

//optional binding
var sumOpt = 0

for i in arrayConst {
    if let i = i {
        sumOpt += i
    }
}
print("By Optional Binding sum is \(sumOpt)")

//forced unwrapping

var sumFor = 0

for f in arrayConst {
    if f != nil {
        sumFor += (f)!
    }
}
print("By Forced Unwrapping sum is \(sumFor)")


// operator ??

var sum = 0

for value in arrayConst {
    let temp = value ?? 0
    sum += temp
}
print("By operator ?? sum is \(sum)")

//Task3

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var someString = [String]()

for i in alphabet {
    someString.insert(String(i), at: 0)
}
print(someString)
