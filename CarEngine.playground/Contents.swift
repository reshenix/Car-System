import Foundation


protocol Vehicle {
    var model: String { get }
    var color: String { get set }
    var type: String { get }
    
    var maxSpeed: Int { get }
    var horsepower: Int { get }
    var fuelType: String { get }
    
    func details() -> String
}

protocol Customizable {
    var canChangeColor: Bool { get }
    var canChangeMaxSpeed: Bool { get }
    var canChangeHorsepower: Bool { get }
    
    func changeColor(newColor: String)
    func changeMaxSeed(newMaxSpeed: Int)
    func changeHorsepower(newHorsePower: Int)
    
    func configurePermissions(canChangeColor: Bool, canChangeMaxSpeed: Bool, canChangeHorsepower: Bool)
}

class BaseVehicle: Vehicle {
    var model: String
    var color: String
    var type: String
    
    var maxSpeed: Int
    var horsepower: Int
    var fuelType: String
    
    init(model: String, color: String, type: String, maxSpeed: Int, horsepower: Int, fuelType: String) {
        self.model = model
        self.color = color
        self.type = type
        self.maxSpeed = maxSpeed
        self.horsepower = horsepower
        self.fuelType = fuelType
    }
    
    func details() -> String {
        return """
        Технический паспорт -
        
        Модель: \(model)
        Цвет: \(color)
        
        Максимальная скорость: \(maxSpeed)
        Мощность: \(horsepower)
        
        Тип топлива: \(fuelType)
        """
    }
}

class Car: BaseVehicle, Customizable {
    var canChangeColor: Bool = true
    var canChangeMaxSpeed: Bool = true
    var canChangeHorsepower: Bool = true
    
    override func details() -> String {
        return super.details() + """
        """
    }
    
    func changeColor(newColor: String) {
        guard canChangeColor else {
            print("Невозможно изменить цвет. \nЦвет автомобиля не подлежит настройке.")
            return
        }
        
        print("Цвет \(model) был изменен на \(newColor)")
        color = newColor
    }
    
    func changeMaxSeed(newMaxSpeed: Int) {
        guard canChangeMaxSpeed else {
            print("Невозможно изменить макс.скорость. \nМакс.скорость автомобиля не подлежит настройке.")
            return
        }
        
        print("Максимальная скорость \(maxSpeed) была изменена на \(newMaxSpeed).")
        maxSpeed = newMaxSpeed
    }
    
    func changeHorsepower(newHorsePower: Int) {
        guard canChangeHorsepower else {
            print("Невозможно изменить мощность. \nМощность автомобиля не подлежит настройке.")
            return
        }
        
        print("Мощность \(horsepower) была изменена на \(newHorsePower).")
        horsepower = newHorsePower
    }
    
    func configurePermissions(canChangeColor: Bool, canChangeMaxSpeed: Bool, canChangeHorsepower: Bool) {
        self.canChangeColor = canChangeColor
        self.canChangeMaxSpeed = canChangeMaxSpeed
        self.canChangeHorsepower = canChangeHorsepower
    }
}

var car = Car(model: "Porsche 911 GT3 RS", color: "Yellow Race", type: "Coupe", maxSpeed: 350, horsepower: 520, fuelType: "Petrol")

print(car.details())

car.changeColor(newColor: "Red Race")
car.changeMaxSeed(newMaxSpeed: 380)
car.changeHorsepower(newHorsePower: 580)

print(car.details())

car.configurePermissions(canChangeColor: false, canChangeMaxSpeed: false, canChangeHorsepower: true)

car.changeColor(newColor: "Black Ven")
car.changeMaxSeed(newMaxSpeed: 700)
car.changeHorsepower(newHorsePower: 700)

print(car.details())
