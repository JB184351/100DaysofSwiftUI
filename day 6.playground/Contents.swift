import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
    
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 through 5: \(i)")
}

var lyrics = "Haters gonna"

for _ in 1...5 {
    lyrics += " Hate"
}

print(lyrics)

var countdown = 10

while countdown > 10 {
    print("\(countdown)")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames  {
    if !filename.hasPrefix(".jpg") {
        continue
    }
    
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14

var multiplies = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiplies.append(i)
        
        if multiplies.count == 10 {
            break
        }
    }
}

print(multiplies)

for i in 1...100 {
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
