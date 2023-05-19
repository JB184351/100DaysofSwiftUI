import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let evolve = Album(title: "Evolve", artist: "Imagine Dragons", year: 2017)
evolve.printSummary()

print(evolve.title)

//struct Employee {
//    let name: String
//    var vacationRemaining: Int
//
//    mutating func timeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("I'm going on a vacation!")
//            print("Days reaminging: \(vacationRemaining)")
//        } else {
//            print("Not enough vacation days!")
//        }
//    }
//}
//
//var archer = Employee(name: "Archer", vacationRemaining: 14)
//archer.timeVacation(days: 5)
//
//print(archer.vacationRemaining)

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()

game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan", number: 4)
print(player.number)
