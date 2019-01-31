// 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
func countToTen(closure: () -> ()) {
    for i in 1...10 {
        print(i)
    }
    closure()
}
countToTen {print("start")}
// 2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
let array = [1, 5, 6, 2, 8, 3, 56, 23, 1, 7]
print(array.sorted(by: >))
print(array.sorted(by: <))
/* 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.*/
func findNumber(takeArray: [Int], closure: (Int?, Int) -> Bool) -> Int {
    var result: Int? = nil
    for value in takeArray {
        if closure(result, value) {
            result = value
        }
    }
    return result ?? 0
}
let array3 = [11, 54, 1, 78, 3, 87, 11, 23, 41]
print("Minimum is \(findNumber(takeArray: array3) { (s1, s2) in s1 == nil || s1! > s2 })")
print("Maximum is \(findNumber(takeArray: array3) { (s1, s2) in s1 == nil || s1! < s2 })")
// 4.  Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
let str = "London is the capital of Great Britain! 2019"
var charsArray = [Character]()
for char in str {
    charsArray.append(char)
}
func priority(char c: Character) -> Int {
    switch String(c).lowercased() {
    case "a", "e", "i", "o", "u", "y":
        return 1
    case "a"..."z":
        return 2
    case "0"..."9":
        return 3
    default:
        return 4
    }
}
let sortedStr = charsArray.sorted() {
    switch (priority(char: $0), priority(char: $1)) {
    case let (x, y) where x < y:
        return true
    case let (x, y) where x > y:
        return false
    default:
        return String($0).lowercased() <= String($1).lowercased()
    }
}
print(str)
print(sortedStr)
// 5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)
func findChar(string: String, clouser: (Character?, Character) -> Bool) -> Character {
    var result: Character? = nil
    for char in string {
        if clouser(result, char) {
            result = char
        }
    }
    return result!
}
let text = "LondonisthecapitalofGreatBritain!2019z"
print("Minimum is \(findChar(string: text) {(s1, s2) in s1 == nil || s1! > s2})")
print("Maximum is \(findChar(string: text) {(s1, s2) in s1 == nil || s1! < s2})")

