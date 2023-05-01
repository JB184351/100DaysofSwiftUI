import Cocoa

let surname: String = "Lasso"
var score: Int = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl", "Woman", "Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let username: String

username = "@twostraws"

print(username)

let strings = ["same", "same", "different", "mixed", "whatever"]
print(strings.count)

let uniqueStrings = Set(strings)
print(uniqueStrings.count)
