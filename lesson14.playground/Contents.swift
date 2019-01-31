import UIKit
import Foundation
//1. Самостоятельно повторить проделанное в уроке
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
struct Student {
    struct Date {
        var day: Int
        var month: Int
        var year: Int
    }
    var dateOfBirth: Date
    var firstName: String {
        willSet(newValue) {
            print("will set " + newValue + "instead of " + firstName)
        }
        didSet(oldValue) {
            print("did set " + firstName + "instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    var howOld: Int {
        let birth = Date(day: 4, month: 6, year: 1993)
         return 2019 - birth.year
    }
    var howLongStudy: Int {
        if howOld > 6 {
            return howOld > 17 ? 17 - 6 : howOld - 6
        } else {
            return 0
        }
    }
}
var student = Student(dateOfBirth: Student.Date(day: 4, month: 6, year: 1993), firstName: "Bob", lastName: "Sku")
student.firstName
student.lastName
student.fullName
student.firstName = "Alex"
student.fullName
student.fullName = "Ivan Ivanov"
student.fullName
print("Age:  \(student.howOld)")
print("\(student.howLongStudy) years he was study")
// 3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
struct Segment {
    struct Point {
        var x: Double
        var y: Double
    }
    var pointA: Point
    var pointB: Point
    var middleOfSegment: Point {
        get {
            let midX = ( pointA.x + pointB.x ) / 2
            let midY = ( pointA.y + pointB.y ) / 2
            return Point(x: midX, y: midY)
        }
        set {
            pointB.x = 2 * newValue.x - pointA.x
            pointB.y = 2 * newValue.y - pointA.y
        }
    }
    var length: Double {
        get {
            return sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2))
        }
        set {
            pointB.x = pointA.x + (pointB.x - pointA.x) * newValue / length
            pointB.y = pointA.y + (pointB.y - pointA.y) * newValue / length
        }
    }
}
var segment = Segment(pointA: Segment.Point(x: 4, y: 3), pointB: Segment.Point(x: 1, y: -1))
print("Length = \(segment.length)")
print("Middle of Sigment = \(segment.middleOfSegment)")
// 4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B
print("Point A with coordinates: (\(segment.pointA.x), \(segment.pointA.y))")
print("Point B with coordinates: (\(segment.pointB.x), \(segment.pointB.y))")
print("Middle point coordinates is: (\(segment.middleOfSegment.x), \(segment.middleOfSegment.y))")
print("The length is: \(segment.length)\n")
segment.middleOfSegment = Segment.Point(x: 4, y: 8)
print("Point A with coordinates: (\(segment.pointA.x), \(segment.pointA.y))")
print("Point B with coordinates: (\(segment.pointB.x), \(segment.pointB.y))")
print("Middle point coordinates is: (\(segment.middleOfSegment.x), \(segment.middleOfSegment.y))\n")
segment.length = 6
print("Point A with coordinates: (\(segment.pointA.x), \(segment.pointA.y))")
print("Point B with coordinates: (\(segment.pointB.x), \(segment.pointB.y))")














