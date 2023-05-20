import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I'm working for \(hours) a day")
    }
}

final class Developer: Employee {
    
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm working as a developer for \(hours) a day")
    }
}


final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()

robert.printSummary()
joseph.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

//class User {
//    var username = "Anonymous"
//
//    func copy() -> User {
//        let user = User()
//        user.username = username
//        return user
//    }
//}
//
//var user1 = User()
//var user2 = user1.copy()
//
//user2.username = "Taylor"
//
//print(user1.username)
//print(user2.username)


//class User {
//    let id: Int
//
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive!")
//    }
//
//    deinit {
//        print("User \(id): I'm dead!")
//    }
//}
//
//var users = [User]()
//
//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control")
//    users.append(user)
//}
//
//print("Loop is finished!")
//users.removeAll()
//print("Array is clear!")

class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)

// Checkpoint 7

class Animal {
    let legs: Int

    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    
    func speak() {
        print("Bark!")
    }
}

final class Corgi: Dog {
    
    override func speak() {
        print("Corgi bark!")
    }
}

final class Poodle: Dog {
    
    override func speak() {
        print("Barking Poodle")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
}

final class Persian: Cat {
    
  
}

final class Lion: Cat {
    
}

let orca = Animal(legs: 0)
let lab = Dog(legs: 4)
let cat = Cat(legs: 4, isTame: true)

let corgi = Corgi(legs: 4)
corgi.speak()

let poodle = Poodle(legs: 4)
poodle.speak()

let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)


