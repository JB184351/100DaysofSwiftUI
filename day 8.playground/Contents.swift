import Cocoa

// day 8

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
print(characters.count)


enum PasswordError: Error {
    case short
    case obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent!"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("There was an error")
} catch PasswordError.obvious {
    print("I have the same combinaion on my luggage")
} catch {
    print(error.localizedDescription)
}

enum RootError: Error {
    case noRoot
    case invalidNumber
}

func findTheSQRT(of num: Int) throws -> Int {
    if num < 1 || num > 10_000 { throw RootError.invalidNumber }
    
    for i in 1...100 {
        let numToCheck = i * i
        
        if numToCheck == num {
            return i
        }
    }
    
    throw RootError.noRoot
}

let num = 169

do {
    let squareRoot = try findTheSQRT(of: num)
    print("The square root of \(num) is \(squareRoot)")
} catch RootError.invalidNumber {
    print("We're only checking between 1 and 10000 and \(num) is invalid")
} catch RootError.noRoot {
    print("The number \(num) isn't a perfect square")
} catch {
    print(error.localizedDescription)
}
