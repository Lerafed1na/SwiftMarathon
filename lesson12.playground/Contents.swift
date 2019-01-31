import UIKit
// 1. Создать энум с шахматными фигурами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый или черный (надеюсь намек понятен)б а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур.
enum Figure {
    case value(name: FigureName, color: SpaceColor, line: LineIndex, column: Column)
    enum LineIndex: Int {
        case one = 1, two, three, four, five, six, seven, eight
    }
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
}
let blackQueen = Figure.value(name: .queen, color: .black, line: .three, column: .B)
let blackKing = Figure.value(name: .king, color: .black, line: .five, column: .E)
let whiteKing = Figure.value(name: .king, color: .white, line: .one, column: .A)
var figureArray = [blackQueen, blackKing, whiteKing]
// 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское значиние. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
func printFigure(array: [Figure]) -> () {
    for piece in array {
        switch piece {
        case .value(name: .queen, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.queen.rawValue) \(line.rawValue) \(column.rawValue)")
        case .value(name: .king, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.king.rawValue) \(line.rawValue) \(column.rawValue)")
        case .value(name: .rook, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.rook.rawValue) \(line.rawValue) \(column.rawValue)")
        case .value(name: .bishop, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.bishop.rawValue) \(line.rawValue) \(column.rawValue)")
        case .value(name: .pawn, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.pawn.rawValue) \(line.rawValue) \(column.rawValue)")
        case .value(name: .knight, color: let color, let line, let column) :
            print("\(color.rawValue) \(Figure.FigureName.knight.rawValue) \(line.rawValue) \(column.rawValue)")
        }
    }
}
printFigure(array: figureArray)
print("\n")
// 3. Используйте красивые юникодовые представления шахматных фигурб выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами(принимает массив фигур и ничего не возвращает).
var chessField = [Int: String]()
func printFigure(figure: Figure) -> Character {
    switch figure {
    case .value(name: .queen, color: let color, line: _, column: _):
        return color == .white ? "\u{2655}" : "\u{265B}"
    case .value(name: .king, color: let color, line: _, column: _):
        return color == .white ? "\u{2654}" : "\u{265A}"
    case .value(name: .pawn , color: let color, line: _, column: _):
        return color == .white ? "\u{2659}" : "\u{265F}"
    case .value(name: .rook, color: let color, line: _, column: _):
        return color == .white ? "\u{2656}" : "\u{265C}"
    case .value(name: .bishop, color: let color, line: _, column: _):
        return color == .white ? "\u{2657}" : "\u{265D}"
    case .value(name: .knight, color: let color, line: _, column: _):
        return color == .white ? "\u{2658}" : "\u{265E}"
    }
}
func blackOrWhiteCell(x: Int, y: Int) -> Character {
    return x % 2 == y % 2 ? "\u{25FE}" : "\u{25FD}"
}
func printChessField(array: [Figure]) -> () {
    print("   A B C D E F G H")
    for y in 1...8 {
        var row = String()
        row += "\(y) "
        for x in 1...8 {
            var symbol = blackOrWhiteCell(x: x, y: y)
            for figure in array {
                switch figure {
                case .value(name: .queen, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                case .value(name: .king, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                case .value(name: .pawn, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                case .value(name: .rook, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                case .value(name: .bishop, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                case .value(name: .knight, color: _, line: let X, column: let Y) where X.rawValue == x && Y.rawValue == y:
                    symbol = printFigure(figure: figure)
                default:
                    break
                }
            }
            row.append(symbol)
        }
        row += "\(y)"
        print(row)
    }
    print("   A B C D E F G H\n")
}
printChessField(array: figureArray)
// 4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
//5. Следите чтобы ваш код был красивым!
func turnFigure(figure: inout Figure, newPosition: (Int, Int)) {
    switch figure {
    case .value(name: .queen, color: let color, line: _, column: _):
        figure = .value(name: .queen, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    case .value(name: .king, color: let color, line: _, column: _):
        figure = .value(name: .king, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    case .value(name: .pawn, color: let color, line: _, column: _):
        figure = .value(name: .pawn, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    case .value(name: .bishop, color: let color, line: _, column: _):
        figure = .value(name: .bishop, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    case .value(name: .knight, color: let color, line: _, column: _):
        figure = .value(name: .knight, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    case .value(name: .rook, color: let color, line: _, column: _):
        figure = .value(name: .rook, color: color, line: Figure.LineIndex(rawValue: newPosition.0)!, column: Figure.Column(rawValue: newPosition.1)!)
    }
}
turnFigure(figure: &figureArray[1], newPosition: (8, 8))
printChessField(array: figureArray)
