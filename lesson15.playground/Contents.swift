import Foundation
/* 1. Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
- имя файла
- максимальный размер файла на диске
- путь к папке, содержащей этот файл
- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)
 Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.*/
struct DescriptionOfFile {
    enum FileType {
        case hidden
        case visible
    }
    var name: String
    var fileType: FileType
    var wayToFile: String {
        return wayToFolder + "/" + name
    }
    static let maxSize = 1024
    var wayToFolder: String
    lazy var content = "nakfjbiugdgaiuhr7a;iu;iav8gbv"
    init(name: String, fileType: FileType, wayToFolder: String) {
        self.name = name
        self.fileType = fileType
        self.wayToFolder = wayToFolder
    }
}
var newFile = DescriptionOfFile(name: "file1", fileType: .hidden, wayToFolder: "/Users/fedorkorenevych/Desktop/Новая папка с объектами/Swift марафон с 9 урока")
// 2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
enum ColorLiteral: Int, CaseIterable {
   
    case red = 0xFF0000
    case forestGreen = 0x228B22
    case deepPink = 0xFF1493
    case cyan = 0x00FFFF
    
    static var colorCount: Int {
        return ColorLiteral.allCases.count
    }
    static var lastColor: ColorLiteral {
        return ColorLiteral.allCases[colorCount - 1]
    }
    static var firstColor: ColorLiteral {
        return ColorLiteral.allCases[0]
    }
}
/*3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
- минимальный и максимальный возраст каждого объекта
- минимальную и максимальную длину имени и фамилии
- минимально возможный рост и вес
- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса*/
class Human {
    var firstName: String {
        didSet {
            if firstName.count < Human.minLengthName || firstName.count > Human.maxLengthName {
                firstName = oldValue
            }
        }
    }
    var lastName: String {
        didSet {
            if lastName.count < Human.minLengthName || lastName.count > Human.maxLengthName {
                lastName = oldValue
            }
        }
    }
    var age: Int {
        didSet {
            if age < Human.minAge || age > Human.maxAge {
                age = oldValue
            }
        }
    }
    var height: Float {
        didSet {
            if height < Human.minHeight {
                height = oldValue
            }
        }
    }
    var weight: Float {
        didSet {
            if weight < Human.minWeight {
                weight = oldValue
            }
        }
    }
    
    static var countHuman = 0
    
    static let minAge = 0
    static let maxAge = 125
    static let minLengthName = 2
    static let maxLengthName = 30
    static let minHeight: Float = 0.5
    static let minWeight: Float = 2.0
    
    init(firstName: String, lastName: String, age: Int, height: Float, weight: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        Human.countHuman += 1
    }
}
let firstHuman = Human(firstName: "Ad", lastName: "Shuran", age: 29, height: 1.6, weight: 70)
let secondHuman = Human(firstName: "Brayan", lastName: "Molko", age: 46, height: 1.68, weight: 55)
let thirdHuman = Human(firstName: "Jack", lastName: "White", age: 43, height: 1.88, weight: 75)
let fourthHuman = Human(firstName: "Jay", lastName: "Zee", age: 52, height: 1.9, weight: 77)
print(Human.countHuman)















