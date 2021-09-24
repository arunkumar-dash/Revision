//
//  main.swift
//  Revision
//
//  Created by Arun Kumar on 15/09/21.
//

import Foundation


@objc protocol ObjcProtocol {
    @objc optional var property: String { get }
    var anotherProperty: Double { get }
    @objc optional func doSomething()
}
class AdoptingClass:  ObjcProtocol {
    // doesn't have to implement `property` & `doSomething` requirements
    var anotherProperty: Double { 0.0 }
}
let protocolObject: ObjcProtocol = AdoptingClass()
let property = protocolObject.property // Accessing optional property
protocolObject.doSomething?() // Calling optional method

struct Apple{
    let price: Float = 90.56
    func printDetails() -> Void {
        print("Price:", price)
    }
    struct SmallApple{
        let smallprice: Float = 199.3333
        init(someNumber number: Int){
            print(number)
        }
        func printDetails(){
            print("Price:", smallprice)
        }
        class SmallSmallApple{
            private let smallsmallprice = 090
            init(anotherNumber number: Double){
                print(number)
            }
            func printDetails(a1 a: Int){
                print(smallsmallprice, type(of: smallsmallprice))
            }
            func printDetails(a2 a: Int){
                printDetails(a1: a)
            }
        }
        let testSmallSmallApple = SmallSmallApple(anotherNumber: 98)
    }
    let testSmallApple = SmallApple(someNumber: Int(Character("a").asciiValue ?? 0))
}
var testApple = Apple()
testApple.printDetails()
testApple.testSmallApple.testSmallSmallApple.printDetails(a2: 6)
print(type(of: String(89.description)))
var integer: UInt8 = UInt8.max
print(MemoryLayout.size(ofValue: integer), integer, MemoryLayout<UInt64>.size, MemoryLayout<Int>.size, Int.max, UInt64.max)

struct Puppy {
    let age: Int
    let isTrained: Bool
}

print(MemoryLayout<Int>.size + MemoryLayout<Bool>.size)

print(MemoryLayout<Puppy>.alignment, MemoryLayout<Puppy>.size, MemoryLayout<Puppy>.stride)

var array: [Int] = [1]

print(array.capacity)

func add(_ arr: Int...){
    var sum = 0
    arr.forEach({i in sum+=i})
    print(sum)
}

var printFn = add
add(67,79,55)

/*
 
 //merge 2 sorted arrays
 
 var a = [1,45,76,345,388,498,890]
 var b = [23,47,76,234,900]
 var c: Array<Int> = []
 var i = 0, j = 0
 while max(i, j) < min(a.count, b.count){
 if a[i] < b[j]{
 c.append(a[i])
 i+=1
 }
 else{
 c.append(b[j])
 j+=1
 }
 }
 if i == a.count{
 while j < b.count{
 c.append(b[j])
 j+=1
 }
 }
 else{
 while i < a.count{
 c.append(a[i])
 i+=1
 }
 }
 print(c)
 
 //first repeated character
 
 var string = "ajsyvdcqwbgvfascvybsdkuae"
 var count: Dictionary<Character, Int> = [:]
 
 for i in string{
 if count[i] != nil {
 break
 }
 else{
 count[i] = 1
 }
 print(i, terminator: "")
 }
 
 */

extension Apple{
    subscript(a: Int) -> Int{
        get{
            return a+1
        }
        set{
            print("a[\(a)] = \(newValue)")
        }
    }
}
var a: Apple = Apple()
print(a[5])
a[5] = 67
withUnsafeMutablePointer(to: &array){
    print($0)
}

print(String(67666, radix: 2))
var stringArray = ["aurb", "vhfn", "dth,hd", "fn6rRh'"]
print(stringArray.max(by: {
    a, b in
    return a.count<b.count
})!)
var `break`: Int = 7878787

//assert(`break` < 0, "Not ok")

struct Dog{
    var age: Int
    var height: Int{
        get{
            return age/2
        }
        set{
            age = newValue*2
        }
    }
    init(age: Int, height: Int){
        self.age = age
        self.height = height
    }
    
    func run(){
        print("Running...")
    }
}

var tom = Dog(age: 1, height: 2)
print(tom.age)

enum Numbers: Float{
    typealias RawValue = Float
    case one
    case two
    case three = 4.3_00
    case four = 1.4
}

print(Numbers.three.rawValue, Numbers.two.rawValue, Numbers.one.rawValue)

enum Numbers1: String{
    case one1
    case two
    case three = "ol"
    case four
}

print(Numbers.three.rawValue, Numbers.two.rawValue, Numbers.one.rawValue)

struct Lazy{
    lazy var property = {
        print("lazy")
    }
    let property1 = {
        print("not lazy")
    }
    var n: String = ""
    init(n: String){
        self.n = n
    }
}

var testLazy = Lazy(n: "hi")
print(MemoryLayout.size(ofValue: testLazy))
print("init")
testLazy.property()
testLazy.property1()
print(MemoryLayout.size(ofValue: testLazy))


class InterviewTest {
    var name: String
    lazy var greeting : String = { return "Hello \(self.name)" }()
    init(name: String) {
        self.name = name
    }
}
let testObj = InterviewTest(name:"abhi")
print("Size before lazy:\(MemoryLayout.size(ofValue: testObj))")
print(testObj.greeting)
print("Size after lazy:\(MemoryLayout.size(ofValue: testObj))")


var set: Set<Int> = []
set.insert(12)
set.insert(223)
set.insert(122)
set.remove(23)
print(set, set.capacity, set[set.startIndex])

func printTest2(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

printTest2(print("Hello"))


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var arrayMutable = [1,2,3,4,5]
let arrayImmutable = arrayMutable
withUnsafeMutablePointer(to: &arrayMutable){print($0)}

print(arrayMutable.capacity)

arrayMutable[0] = 12

withUnsafeMutablePointer(to: &arrayMutable){print($0)}

print(arrayMutable.capacity)

arrayMutable.append(contentsOf: [12,23,89,90])

withUnsafeMutablePointer(to: &arrayMutable){print($0)}

print(arrayMutable.capacity)

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    subscript(size: Size) -> Rect{
        Rect(origin: Point(x: 0, y: 0), size: size)
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


print(square[Size(width: 98, height: 12)].center)



@dynamicMemberLookup
struct Person {
    var name = "Kumar"
    subscript(dynamicMember member: String) -> String { //shld be expressible by string only
        let properties = ["name": "Taylor Swift", "city": "Nashville", "1": "one"] as [AnyHashable : String]
        return properties[member, default: ""]
    }
}
let taylor = Person()
print(taylor.name)
print(taylor.city)
print(taylor.favoriteIceCream)
print(taylor.1)


@propertyWrapper
struct Age {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 118) }
    }
}

struct Human {
    @Age var age : Int
}
var human = Human()
print(human.age)
human.age = 12
print(human.age)
human.age = 234
print(human.age)

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

withUnsafePointer(to: stepCounter){
    print(MemoryLayout.size(ofValue: $0))
    print(MemoryLayout.stride(ofValue: $0))
    print(MemoryLayout.alignment(ofValue: $0))
}


var one11 = Numbers1.one1
print(one11.rawValue)

let string = "The rain in Spain"
let range = string.range(of: "rain", options: [.caseInsensitive, .backwards])

var arrayList = Array<Int>()

struct Container<E>{
    var arr: Array<E>
    var typeOf: E.Type{
        return E.self
    }
    init(arr: Array<E>) {
        self.arr = arr
    }
}

var container1 = Container(arr: [Character("a"), Character("b"), "\u{1F603}", "\n"])
print(container1.typeOf)

func inoutCheck (a: inout Int){
    a+=1
}
var testInout = 21
inoutCheck(a: &testInout)
print(testInout)

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

print(ASCIIControlCharacter.tab.rawValue)

@propertyWrapper
class TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)


enum WeekDay: Int, CaseIterable{
    case sunday = 1
    case monday = 12
    case tuesday = 34
    case wednesday = 344
    case thursday = 04
    case friday = 0o12
    case saturday = 0x993
}
var today = WeekDay.tuesday
var tomorrow = WeekDay.wednesday
print(today == WeekDay.tuesday)


enum WeekDay1: CaseIterable{
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

print(WeekDay1.allCases)
// why it prints [Revision.WeekDay1.sunday, Revision.WeekDay1.monday, Revision.WeekDay1.tuesday, Revision.WeekDay1.wednesday, Revision.WeekDay1.thursday, Revision.WeekDay1.friday, Revision.WeekDay1.saturday] ... what is Revision

infix operator +
func +(lhs: Character, rhs: Int) -> Character?{
    if let ascii = lhs.asciiValue{
        if let usc = UnicodeScalar(Int(ascii) + rhs){
            return Character(usc)
        }else{
            return nil
        }
    }else{
        return nil
    }
}

print("\((Character("a")+12)!)")


extension Numbers1: CaseIterable{
    
}
print(Numbers1.allCases.sorted(by: {$0.rawValue < $1.rawValue}))

struct Mobile: Sequence{
    let name: String
    var version: Float
    func makeIterator() -> some IteratorProtocol {
        return VersionItr(version: version)
    }
}
struct VersionItr: IteratorProtocol{
    var version: Float
    mutating func next() -> Float? {
        if version > 11{
            return nil
        }
        else{
            defer {
                version = version + 0.52
            }
            return round(version*100)/100
        }
    }
}

var motorola = Mobile(name: "motog4", version: 6.5)
for i in motorola{
    print(i)
}


struct Date: Equatable {
    var daysAfterY2K: Int

}

extension Date: Strideable {
    func advanced(by n: Float) -> Date {
        var result = self
        result.daysAfterY2K += Int(n)
        return result
    }

    func distance(to other: Date) -> Float {
        return Float(other.daysAfterY2K - self.daysAfterY2K)
    }
}

for i in stride(from: Date(daysAfterY2K: 500), to: Date(daysAfterY2K: 560), by: 6){
    print(i)
}

struct Gender: OptionSet{
    let rawValue: Int8
    static let male = Gender(rawValue: 1)
    static let female = Gender(rawValue: 2)
    static let anotherMale = Gender(rawValue: 1)
}

var testGender: Gender = .female

var stringTemp = "string"
//string index
var stringTemp1 = "newstring"

var thirdString = "\(stringTemp) \(stringTemp1)"
print(thirdString + stringTemp1, stringTemp1.count)

for i in 0..<stringTemp.count{
    print(stringTemp[stringTemp.index(stringTemp.startIndex, offsetBy: i)])
}

var arr: Array = [1, 2, 3]
arr.append(4)
arr.append(contentsOf: [1, 3])
print(arr.customMirror)
print(arr.distance(from: 0, to: 3))
print(arr.index(1, offsetBy: 2), type(of: arr.index(1, offsetBy: 2)))
print(arr.index(1, offsetBy: 3, limitedBy: 4))
print(arr.remove(at: 2))
print(arr)
var arr1 = [9,90]
arr.replaceSubrange(1...3, with: [2,90])
print(arr)
//ArraySlice<Int>
//RangeExpression
//ReversedCollection
//RangeReplaceableCollection
//EnumeratedSequence
//RandomNumberGenerator
//RandomAccessCollection
//JoinedSequence
//BidirectionalCollection
//CollectionDifference
//Dictionary
//Substring



var dictionary: Dictionary = [3: "zg", 5: "sdf", 4: "EFCc"]
print(dictionary.filter({$0 > $1.count}))
print(dictionary.max(by: {$0.value > $1.value}))

//Set
var set1: Set = [1,2,3,4,3,3,6,5,5,5,45,4]

//print(set1.distance(from: set1.firstIndex(of: 1)!, to: set1.firstIndex(of: 45)!))

print(String(12, radix: 2))

struct AnimalRanking: RangeExpression, Comparable, Strideable, LosslessStringConvertible, Hashable{
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(rank)
    }
    
    init?(_ description: String) {
        self.description = description
        let split = description.split(separator: " ")
        self.name = String(split[0])
        let c = split[3].index(before: split[3].endIndex)
        if let temp = Int(split[3][..<c]){
            self.rank = temp
        }
        else{
            return nil
        }
    }
    
    var description: String
    
    init(name: String, rank: Int) {
        self.name = name
        self.rank = rank
        description = "\(name) with rank \(rank)."
    }
    
    func relative<C>(to collection: C) -> Range<Int> where C : Collection, Int == C.Index {
        if rank >= collection.startIndex{
            return Range(collection.startIndex...rank)
        }
        return Range(rank...collection.endIndex)
    }
    
    func contains(_ element: Int) -> Bool {
        return element == rank
    }
    
    func distance(to other: AnimalRanking) -> Int {
        return other.rank - self.rank
    }
    
    func advanced(by n: Int) -> AnimalRanking {
        var temp = self
        temp.rank += n
        return temp
    }
    
    var name: String
    var rank: Int
    static func ==(lhs: AnimalRanking, rhs: AnimalRanking) -> Bool{
        return lhs.rank == rhs.rank
    }
    static func <(lhs: AnimalRanking, rhs: AnimalRanking) -> Bool{
        return lhs.rank < rhs.rank
    }
}

let lion = AnimalRanking(name: "lion", rank: 1)
let tiger = AnimalRanking(name: "tiger", rank: 2)
let tigress = AnimalRanking(name: "tigress", rank: 2)
let bear = AnimalRanking(name: "bear", rank: 9)

for i in lion...bear{
    print(i.rank)
}

print(String(lion))
print(stringTemp.prefix(while: {$0 != Character("n")}))

var arrayTemp: [Int] = []
for i in 0...10000{
    if ("0"..."211").contains(String(i)){
        arrayTemp.append(i)
    }
}
//print(arrayTemp)

print(Array("Index".indices))
print(Array("Indiabcde".indices))

var str = "fthg"
var strIndex = str.startIndex
strIndex = str.index(after: str.index(after: strIndex))
print(strIndex, str.index(after: strIndex), str.index(after: str.index(after: strIndex)))
print(str.formIndex(after: &strIndex))
print(strIndex, str.startIndex, str.index(after: strIndex), str[strIndex])

print(Array("oiugkĮA".utf16))

str.replaceSubrange(str.index(after: str.startIndex)...strIndex, with: "oj990")
print(str)

let numbers = ["1", "2", "Fish"]
let integers = numbers.compactMap { Int($0) }
print(integers)

var aSet = Set([1,2])

let data: [Any?] = ["Bill", nil, 69, "Ted"]

for datum in data where datum is String? {
    print(datum)
}

for case let .some(datum) in data where datum is String {
    print(datum)
}


struct Home{
    var mother: Bool
    var father: Bool
    static var building = true
}

let home = Home(mother: true, father: true)
//print(home.building) //Compile Error: Static member 'building' cannot be used on instance of type 'Home'


var num1 = 1, num2 = 2, num3 = 3, num4 = 2
if num1 != num2 , num2 == num4 , num3 > num4{
    print("all true")
} else{
    print("false")
}

var someVar: Hasher = Hasher()
someVar.combine(1)
someVar.combine(2)
someVar.combine(3)
print(someVar.finalize())
someVar.combine(4)
print(someVar.finalize())

var string1 = "full string"
var substring1 = string1[(string1.firstIndex(of: "s") ?? string1.startIndex) ..< string1.endIndex]
print(string1 ~= substring1)

print("🇮🇳".utf8.map{Character(UnicodeScalar($0))})

class Test{
    var a: Int
    init(_ a: Int){
        self.a = a
    }
}


