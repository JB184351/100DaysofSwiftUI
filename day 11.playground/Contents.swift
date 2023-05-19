import Cocoa

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

struct BankAccount {
    private(set)var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
    
}

School.add(student: "Taylor")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
    
    
}

AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

// Checkpiont 6

struct Car {
    let model: String
    let numberOfSeats: Int
    static var currentGear = 1
    
    static func adjustGear(gear: Int) {
        let allowedGearArray = Array(1...10)
        
        if allowedGearArray.contains(gear) {
            currentGear = gear
            print("The current gear is now \(currentGear)")
        } else {
            print("The gear needs to be in the range between 1 and 10")
        }
    }
}

let tesla = Car(model: "Y", numberOfSeats: 5)

Car.adjustGear(gear: 5)
Car.adjustGear(gear: 3)
