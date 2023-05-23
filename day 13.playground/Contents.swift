import Cocoa

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunRoof() {
        print("It's a beautfiul day")
    }
    
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow, I'll grab something faster")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

func getRandomNumber() -> some Equatable {
    Double.random(in: 1...6)
}

func getRanbomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

var quote = "  The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
}

let trimmed2 = quote.trimmed()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)


struct Book {
    let title: String
    let pagecount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pagecount = pageCount
        self.readingHours = pageCount / 50
    }
}

let mistborn = Book(title: "Mistborn", pagecount: 400, readingHours: 16)

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty == false {
    print("Guest count: \(guests.count)")
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

protocol Person {
    var name: String { get }
    func sayHello()
}


extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8

protocol Building {
    var rooms: Int { get }
    var cost: Double { get }
    var realtor: String { get }
    
    func saleSummary()
    
}

struct House: Building {
    var rooms: Int
    var cost: Double
    var realtor: String
    
    func saleSummary() {
        print("The house has \(rooms) rooms and was sold for $\(cost) by \(realtor)")
    }
    
    
}

struct Office: Building {
    var rooms: Int
    var cost: Double
    var realtor: String
    
    func saleSummary() {
        print("The office has \(rooms) rooms and was sold for $\(cost) by \(realtor)")
    }
    
}

let myFirstHouse = House(rooms: 3, cost: 400_000, realtor: "Maria")
myFirstHouse.saleSummary()

let myFirstOffice = Office(rooms: 10, cost: 1_200_000, realtor: "Ty")
myFirstOffice.saleSummary()
