import UIKit
/*1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически

3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.

4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)

5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)*/

class Room {
    var length: Int {
        didSet {
            if length <= 0 {
                length = oldValue
            }
        }
    }
    var width: Int {
        didSet {
            if width <= 0 {
                width = oldValue
            }
        }
    }
    
    var person: Object
    var box: Object
    
    enum Direction {
        case left
        case right
        case Top
        case Bottom
    }
    
    init(length: Int, width: Int, person: Object, box: Object) {
        self.length = length < 0 ? 0 : length
        self.width = width < 0 ? 0 : width
        self.person = person
        if self.person.x > width {
            self.person.x = width
        }
        if self.person.y > length {
            self.person.y = length
        }
        self.box = box
        if self.box.x > width {
            self.box.x = width
        }
        if self.box.y > length {
            self.box.y = length
        }
    }
    func showRoom() {
        for w in 1...width {
            var row = String()
            for l in 1...length {
                if self.person.x == w && self.person.y == l {
                    row += "🤾"
                } else if self.box.x == w && self.box.y == l {
                    row += "💣"
                } else {
                    row += "⬜"
                }
            }
            print(row)
        }
    }
    
    func movePerson(direction: Direction) {
        
    }
}
struct Object {
    var x: Int {
        didSet {
            if x <= 0 {
                x = 1
            }
        }
    }
    var y: Int {
        didSet {
            if y <= 0 {
                y = 1
            }
        }
    }
}
var myRoom = Room(length: 10, width: 10, person: Object(x: 3, y: 5), box: Object(x: 7, y: 4))
myRoom.showRoom()
