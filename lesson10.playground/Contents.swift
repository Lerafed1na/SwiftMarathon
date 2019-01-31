import UIKit
// 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
func heart() -> String {
    return "\u{1F496}"
}
func robotFace() -> String {
    return "\u{1F916} "
}
func human() -> String {
    return "\u{1F468} "
}
func equally() -> String {
    return "\u{003D} "
}
func plus() -> String {
    return "\u{002B} "
}
print(human() + plus() + robotFace() + equally() + heart())

// 2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
func chessdesk(letter l: String, symbol s: Int) -> String {
    let alphabet = "abcdefgh"
    var position = 0
    for letter in alphabet {
        position += 1
        if String(letter) == l {
            break
        }
    }
    return s % 2 == position % 2 ? "Black" : "White"
}
chessdesk(letter: "b", symbol: 4)

// 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
func reverseArray(takeArray a: [Any]) -> [Any] {
    var newArray = [Any]()
    for i in a {
        newArray.insert(i, at: 0)
    }
    return newArray
}
let array1 = [1, 2, 3, 4]
let array2 = ["a", "b", "c", "d"]
reverseArray(takeArray: array2)
reverseArray(takeArray: array1)
// 3.2
func reverseSequense(sequense s: Any...) -> [Any] {
    var array = [Any]()
    for i in s {
        array.append(i)
    }
    return array.reversed()
}
let s = reverseSequense(sequense: 1, 2, 3, 4, 5)
// 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
func inoutArray(takeArray a: inout [Int]) {
    return a = a.reversed()
}
var array3 = [1, 2, 3, 4, 5]
print(array3)
inoutArray(takeArray: &array3)
print(array3)
// 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)
func sort(takeString str: String) -> String {
    let str = str.lowercased()
    let dict = ["0": "zero ", "1": "one ", "2": "two ", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
    var newString = ""
    for char in str {
        switch char {
        case ".", "!", "?", ",", "-", ";", ":":
            newString += ""
        case "a", "e", "i", "o", "u", "y":
            newString += String(char).uppercased()
        case "a"..."z":
            newString += String(char)
        case "0"..."9":
            newString += dict[String(char)]!
        case " ":
            newString += String()
        default:
            break
        }
    }
    return newString
}
let str = "Hello! My name is Lera. I am 25 years old."
print(sort(takeString: str))
