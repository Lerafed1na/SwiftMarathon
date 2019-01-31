//1.  Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
let str = "ABCDEFGHIKLMNOPQRSTVXYZ 0123456789!@# ABCDEFGHIKLMNOPQRSTVXYZ 0123456789!@# ABCDEFGHIKLMNOPQRSTVXYZ 0123456789!@# ABCDEFGHIKLMNOPQRSTVXYZ 0123456789!@# ABCDEFGHIKLMNOPQRSTVXYZ 0123456789!@#0123456789!"
str.count
var count = (vowels: 0, consonants: 0, numbers: 0, characters: 0)
for i in str {
    switch i {
    case "A", "E", "I", "O", "Y":
        count.vowels += 1
    case "A"..."Z":
        count.consonants += 1
    case "0"..."9":
        count.numbers += 1
    default:
        count.characters += 1
    }
}
print("Vowels = \(count.vowels) Consonants = \(count.consonants) Numbers = \(count.numbers) Characters = \(count.characters)")

//2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
var age = 25
switch age {
case 0...3:
    print("early childhood")
case 4..<7:
    print("preschool age")
case 7...13:
    print("school age")
case 14...19:
    print("Youth")
case 20...35:
    print("youthfulness")
case 36...60:
    print("Adulthood")
default:
    print("oldness")
}

//3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
let student = (name: "София", fathersName: "Семёновна", lastName: "Мармеладова")
switch student {
case _ where student.name.hasPrefix("А") || student.name.hasPrefix("О"):
    print("Здравствуйте \(student.name)")
case _ where student.fathersName.hasPrefix("В") || student.fathersName.hasPrefix("Д"):
    print("Здравствуйте \(student.name) \(student.fathersName)")
case _ where student.lastName.hasPrefix("Е") || student.lastName.hasPrefix("З"):
    print("Здравствуйте \(student.lastName)")
    
default:
    print("Здравствуйте \(student.lastName) \(student.name) \(student.fathersName)!")
}

// 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.

typealias Cell = (x: Int, y: Int)
var ship1 = [Cell(2, 5), Cell(2, 6), Cell(2, 7)]
var ship2 = [Cell(9, 8)]
var ships = [ship1, ship2]

let shot = Cell(2, 6)

var hit = 0

shot: for ship in ships {
     for cell in ship {
        print(cell)
        switch shot {
        case _ where shot.x == cell.x && shot.y == cell.y:
            hit += 1
            if hit == ship.count {
                print("Ship is dead!")
            } else {
                print("Ship is hurt!")
            }
            break shot
        default:
            break
        }
    }
}
hit == 0 ? print("Missed") : print("")



