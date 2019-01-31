import UIKit
// 1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
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
    var goal: Object
    
    init(length: Int, width: Int) {
        self.length = length
        self.width = width
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
