//Task1

var studentJournal = ["Pavel Dovgal" : 3, "Sasha Masuk" : 5, "Korenevich Fedor" : 5, "Novak Maksim" : 2]

studentJournal ["Pavel Dovgal"] = 4

studentJournal ["Korenevich Lera"] = 5
studentJournal ["Pavluhina Natasha"] = 4

studentJournal ["Sasha Masuk"] = nil
studentJournal.removeValue(forKey: "Pavel Dovgal")

print(studentJournal)

var groupMark = 0
var averageGroupMark = 0.0

for values in studentJournal.values {
    groupMark += values
    averageGroupMark = Double(groupMark) / Double(studentJournal.count)
}
print(groupMark)
print(averageGroupMark)

//Task2

let daysInMonth = ["jan": 31, "feb": 28, "mar": 31, "apr": 30, "may": 31, "jun": 30, "jul": 31, "aug": 31, "sep": 30, "oct": 31, "nov": 30, "dec": 31]

for key in daysInMonth.keys {
    print("\(key), \(daysInMonth[key]!)")
}

print()

for (key, value) in daysInMonth {
    print("\(key) = \(value)")
}

//Task3
print()

var chess = [String: Bool]()

let chessAlphabet = "abcdefgh"

for i in 1...8 {
    for (column, letter) in chessAlphabet.enumerated() {
        let cellName = String(letter) + String(i)
        chess[cellName] = (i % 2 != (column + 1) % 2 )
        }
}

print()

for (cellName, cellColor) in chess {
    let color = cellColor ? "white" : "black"
    print("\(cellName) - \(color)")
}




