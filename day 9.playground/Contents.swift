import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy = greetUser
greetCopy()

//let sayHello = {
//    print("Hello there!")
//}
//
//sayHello()

let sayHello = { (name: String) -> String in
    "Hi \(name)"
}

sayHello("General Grevious")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData

let user = data(1989)

print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sortedTeam = team.sorted()

print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted(name1:name2:))
//print(captainFirstTeam)


let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
                                   
print(captainFirstTeam)

let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    
    return a < b
}

print(sorted)

let shortHandSyntax = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

let reversedSort = team.sorted { $0 > $1 }
print(reversedSort)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let upperCaseTEam = team.map { $0.uppercased() }
print(upperCaseTEam)

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("this is the third work")
}

// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let filteredSortedMappedLuckyNumbers = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted().map { String($0) }

for luckyNumbers in filteredSortedMappedLuckyNumbers {
    print("\(luckyNumbers) is a lucky number")
}
