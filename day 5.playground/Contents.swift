import Cocoa

let score = 85

if score > 80 {
    print("Awesome!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we are going we don't need roads...")
}

if percentage < 85 {
    print("You fail the test :/")
}

if age >= 18 {
    print("You're eleigible to vote.")
} else {
    print("Sorry, you're too young to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Austrailia" {
    print("G' day")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var userName = "taylorswift13"

if userName.isEmpty {
    userName = "Anonymous"
}

print("Welcome, \(userName)")

let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day")
}

let userAge = 14
let hasParentalConstent = true

if age >= 18 || hasParentalConstent {
    print("You can buy the game")
}

enum TransportOption {
    case airplane
    case car
    case train
    case boat
    case bicycle
    case helicopter
    case escooter
}

let transport = TransportOption.boat

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there is a bike path")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm having the time of my life")
}

enum Weather {
    case sun
    case rain
    case cloudy
    case windy
    case snowy
}

let forecast = Weather.cloudy

switch forecast {
case .sun:
    print("It's sunny")
case .rain:
    print("It's rainy")
case .cloudy:
    print("The best type of days")
case .windy:
    print("Hopefully it's not cold wind")
case .snowy:
    print("Hopefully it melts right away")
}

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You'Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

let day = 5

print("My true love gave to me..")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hends")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A patridge in a pear tree")
}

let ag = 18
let canVote = age >= 18 ? "Yes" : "No"

print(canVote)

enum Theme {
    case light
    case dark
}

let theme = Theme.dark

                    /// W                         T                     F
let background = theme == .dark ? "Black" : "White"
print(background)


