//Task1  My Birthday 4 of june
let dayInMonth = (jan: 31, feb: 28, mar: 31, apr: 30, may: 31, june: 30, july: 31, aug: 31, sept: 30, oct: 31, nov: 30, dec: 31)

let secInTheDay = 60*60*24

var dayToBirthday = dayInMonth.jan + dayInMonth.feb + dayInMonth.mar + dayInMonth.apr + dayInMonth.may + 4

var secToMyBirthday = dayToBirthday*secInTheDay

print("The Sec to my Birthday is \(secToMyBirthday).")

//Task2

let numberMonth = (jan: 1, feb: 2, mar: 3, apr: 4, may: 5, june: 6, july: 7, aug: 8, sept: 9, oct: 10, nov: 11, dec: 12)
/*
let firstQ = dayInMonth.jan + dayInMonth.feb + dayInMonth.mar
let secondQ = dayInMonth.apr + dayInMonth.may + dayInMonth.june
let thirdQ = dayInMonth.july + dayInMonth.aug + dayInMonth.sept
let fourthQ = dayInMonth.oct + dayInMonth.nov + dayInMonth.dec
*/
let firstQ = 3
let secondQ = 6
let thirdQ = 9
let fourthQ = 12
var myQuarter = numberMonth.june <= firstQ ? 1 : 0 + numberMonth.june <= secondQ ? 2 : 0 + numberMonth.june <= thirdQ ? 3 : 4
print("I was born in \(myQuarter) quarter. ")

//Task3 . Убрали из swift.

//Task4

var x = 3
var y = 6

if ( x%2 == 0 && y%2 != 0 ) || (x%2 != 0 && y%2 == 0) {
    print ("Black")
} else {
    print("White")
}

//Task4 Alex's variation

let cell = (x: 5, y: 8)

if cell.x % 2 == cell.y % 2 {
    print("Black")
} else {
    print("White")
}


let fun : Character = "ъ\u{301}\u{20dd}"

let funString = "What is this? -> \(fun)"

funString.hasPrefix("What")
funString.hasSuffix("ъ")















