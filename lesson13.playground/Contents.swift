import UIKit
// 1.Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct Student {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var middleMark: Double
}
var student1 = Student(name: "Bob", lastName: "Crath", yearOfBirth: 1991, middleMark: 4.2)
var student2 = Student(name: "Sara", lastName: "Oconor", yearOfBirth: 1993, middleMark: 4.5)
var student3 = Student(name: "Lilly", lastName: "Alen", yearOfBirth: 1992, middleMark: 4.0)
var student4 = Student(name: "Tom", lastName: "Oconor", yearOfBirth: 1999, middleMark: 3.0)
let studentsArray = [student1, student2, student3, student4]
// 2.Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
func printStudentsJournal(array: [Student]) {
    var count = 1
    for student in array {
        print("\(count). \(student.name) \(student.lastName) \(student.yearOfBirth) has \(student.middleMark) middle mark.")
        count += 1
    }
    print("\n")
}
print("------------------2-------------------")
printStudentsJournal(array: studentsArray)
// 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
print("------------------3-------------------")
printStudentsJournal(array: studentsArray.sorted {$0.middleMark > $1.middleMark })
// 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
print("------------------4-------------------")
printStudentsJournal(array: studentsArray.sorted { (s1, s2) in
    s1.lastName == s2.lastName ? s1.name < s2.name : s1.lastName < s2.lastName
})
// 5.Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
print("------------------5-------------------")
var studentsArray2 = studentsArray
studentsArray2[0].lastName = "Jobs"
studentsArray2[1].middleMark = 5.0
studentsArray2[2].yearOfBirth = 2018
studentsArray2[3].name = "Mikki"
printStudentsJournal(array: studentsArray)
printStudentsJournal(array: studentsArray2)
// 6.Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
class StudentClass {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var middleMark: Double
    init(name: String, lastName: String, yearOfBirth: Int, middleMark: Double) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.middleMark = middleMark
    }
}
var studentClass1 = StudentClass(name: "Bob", lastName: "Crath", yearOfBirth: 1991, middleMark: 4.2)
var studentClass2 = StudentClass(name: "Sara", lastName: "Oconor", yearOfBirth: 1993, middleMark: 4.5)
var studentClass3 = StudentClass(name: "Lilly", lastName: "Alen", yearOfBirth: 1992, middleMark: 4.0)
var studentClass4 = StudentClass(name: "Tom", lastName: "Oconor", yearOfBirth: 1999, middleMark: 3.0)
let studentsArrayClass = [studentClass1, studentClass2, studentClass3, studentClass4]
var studentsArrayClass2 = studentsArrayClass
studentsArrayClass2[0].lastName = "Jobs"
studentsArrayClass2[1].middleMark = 5.0
studentsArrayClass2[2].yearOfBirth = 2018
studentsArrayClass2[3].name = "Mikki"
func printStudentsJournalClass(array: [StudentClass]) {
    var count = 1
    for student in array {
        print("\(count). \(student.name) \(student.lastName) \(student.yearOfBirth) has \(student.middleMark) middle mark.")
        count += 1
    }
    print("\n")
}
print("------------------6-------------------")
printStudentsJournalClass(array: studentsArrayClass)
printStudentsJournalClass(array: studentsArrayClass2)
// 7. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
print("------------------7-------------------")
enum SpaceColor: String {
    case white = "White"
    case black = "Black"
}
enum FigureName: String {
    case king = "King"
    case queen = "Queen"
    case bishop = "Bishop"
    case pawn = "Pawn"
    case knight = "Knight"
    case rook = "Rook"
}
enum Column: Int {
    case A = 1, B, C, D, E, F, G, H
}
struct Figure {
    var color: SpaceColor
    var name: FigureName
    var position: (x: Column, y: Int)
}
let blackQueen = Figure(color: .black, name: .queen, position: (.B, 3))
let blackKing = Figure(color: .black, name: .king, position: (.E, 5))
let whiteKing = Figure(color: .white, name: .king, position: (.A, 1))
var figureArray = [blackQueen, blackKing, whiteKing]
func printPiece(piece: Figure) {
    print("\(piece.name.rawValue) \(piece.color.rawValue) \(piece.position.x), \(piece.position.y)")
}
for piece in figureArray {
    printPiece(piece: piece)
}
print("\n")
func symbolPiece(piece: Figure) -> Character {
    switch (piece.name, piece.color) {
    case (.king, let color):
        return color == .white ? "\u{2654}" : "\u{265A}"
    case (.queen, let color):
        return color == .white ? "\u{2655}" : "\u{265B}"
    case (.bishop, let color):
        return color == .white ? "\u{2657}" : "\u{265D}"
    case (.pawn, let color):
        return color == .white ? "\u{2659}" : "\u{265F}"
    case (.rook, let color):
        return color == .white ? "\u{2656}" : "\u{265C}"
    case (.knight, let color):
        return color == .white ? "\u{2658}" : "\u{265E}"
    }
}
func blackOrWhiteCell(x: Int, y: Int) -> Character {
    return x % 2 == y % 2 ? "\u{25FE}" : "\u{25FD}"
}
func chessField(pieces: [Figure]) {
    print("  A B C D E F G H")
    for y in 1...8 {
        var row = String()
        row += "\(y)"
        for x in 1...8 {
            var symbol = blackOrWhiteCell(x: x, y: y)
            for piece in pieces {
                if piece.position.x.rawValue == x && piece.position.y == y {
                    symbol = symbolPiece(piece: piece)
                }
            }
            row.append(symbol)
        }
        row += "\(y)"
        print(row)
    }
    print("  A B C D E F G H\n")
}
chessField(pieces: figureArray)
func canMoveFigure(piece: Figure, to: (x: Int, y: Int)) -> Bool {
    if piece.position.x.rawValue == to.x && piece.position.y == to.y {
        return false
    }
    if to.y < 1 || to.y > 8 {
        return false
    }
    let desX = abs(piece.position.x.rawValue - to.x)
    let desY = abs(piece.position.y - to.y)
    switch piece.name {
    case .king :
        return (desX == 1 && desY == 0) || (desX == 0 && desY == 1)
    case .queen:
        return (desX == 0) || (desY == 0) || (desX == desY)
    case .bishop :
        return (desX == desY)
    case .rook:
        return (desX == 0) || (desY == 0)
    case .pawn :
        return (desX <= 1) && (desY <= 1)
    case .knight:
        return (desX == 1 && desY == 2) || (desX == 2 && desY == 1)
    }
}
func moveFigure(piece: inout Figure, newPosition: (x: Column, y: Int)) -> Bool {
    if canMoveFigure(piece: piece, to: (newPosition.x.rawValue, newPosition.y)) {
        piece.position.x = newPosition.x
        piece.position.y = newPosition.y
        return true
    }
    return false
}
print("---------------------------")
moveFigure(piece: &figureArray[1], newPosition: (.H, 8))
moveFigure(piece: &figureArray[2], newPosition: (.A, 5))
moveFigure(piece: &figureArray[0], newPosition: (.C, 4))
chessField(pieces: figureArray)


