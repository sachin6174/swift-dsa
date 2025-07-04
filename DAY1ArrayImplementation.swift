class Vector {
    private var capacity :Int 
    private var indexToPutDataOn : Int 
    private var internalArray : [Int]

    init (){
        self.capacity = 1
        self.indexToPutDataOn = 0
        self.internalArray = Array(repeating : 0 , count :capacity)
    }
    func push_back(_ value :Int){

        if indexToPutDataOn == capacity{
            // means all the space is occupied
            
            resizeArryAndPlaceAllElements()
        }

        internalArray[indexToPutDataOn] = value
        indexToPutDataOn += 1
    }

    func pop_back() -> Int{

        if indexToPutDataOn == 0 {
            // fatalError("Already   empty")
            print("out of bound")
            return Int.max
        }

        let indexToReturn =  indexToPutDataOn - 1
        indexToPutDataOn -= 1
        return internalArray[indexToReturn]
    }

    func resizeArryAndPlaceAllElements(){
        capacity *= 2
        var newArray = Array(repeating: 0 ,count : capacity)
        for i in 0..<indexToPutDataOn{
            newArray [i] = internalArray[i]
        }
        internalArray = newArray
    }

    func size() -> Int{
        return  indexToPutDataOn
    }

    func setValue(atIndex : Int ,value :Int){
        if atIndex<0 || indexToPutDataOn <= atIndex {
            // fatalError("out of bound")
            print("out of bound")
            return
        }
        internalArray[atIndex] = value
    }
    func getValue(ofIndex :Int) -> Int{
        if ofIndex<0 || indexToPutDataOn <= ofIndex {
            // fatalError("out of bound")
            print("out of bound")
            return Int.max
        }
        return internalArray[ofIndex]
    }


    func displayArray(){
        print("start of array: -")
        for i in 0..<indexToPutDataOn{
            print(internalArray[i], terminator : " ")
        }
        print("\n-----end of array----")
    }

    func addDataToIndex(atIndex: Int ,value :Int){
        if atIndex<0 || indexToPutDataOn < atIndex {
            // fatalError("out of bound")
            print("out of bound")
            return
        }
        
        if indexToPutDataOn == capacity{
            // means all the space is occupied
            resizeArryAndPlaceAllElements()
        }
        // shifts elements one slot to the right, from indexToPutDataOn-1 down to and including atIndex
        for i in stride(from: indexToPutDataOn - 1, through: atIndex, by: -1) {
            internalArray[i + 1] = internalArray[i]
        }
        internalArray[atIndex] = value
        indexToPutDataOn += 1
    }

    func removeFormIndex(ofIndex :Int){
        if ofIndex<0 || indexToPutDataOn <= ofIndex {
            // fatalError("out of bound")
            print("out of bound")
            return
        }

        for i in (ofIndex + 1)..<indexToPutDataOn {
            internalArray[i - 1] = internalArray[i]
        }
       indexToPutDataOn -= 1

    }
    func clear(){
        self.capacity = 1
        self.indexToPutDataOn = 0
        self.internalArray = Array(repeating : 0 , count :capacity)
    }
}

let arr = Vector()
arr.push_back(2)
arr.push_back(6)
arr.push_back(2)
arr.push_back(98)
arr.displayArray()
arr.addDataToIndex(atIndex: 2,value: 6666)
arr.displayArray()
arr.removeFormIndex(ofIndex: 2) 
arr.displayArray()






import Foundation

print("🔍 Starting Vector tests…\n")

// ——————————————————————————————————————————————
// Test 1: initial state
print("Test 1: initial state")
var v = Vector()
assert(v.size() == 0, "Expected size 0, got \(v.size())")
print(" ✔️ initial size is 0\n")

// ——————————————————————————————————————————————
// Test 2: push_back and getValue
print("Test 2: push_back & getValue")
v.push_back(2); v.push_back(6); v.push_back(2); v.push_back(98)
assert(v.size() == 4)
assert(v.getValue(ofIndex: 0) == 2)
assert(v.getValue(ofIndex: 1) == 6)
assert(v.getValue(ofIndex: 2) == 2)
assert(v.getValue(ofIndex: 3) == 98)
print(" ✔️ push_back & getValue\n")

// ——————————————————————————————————————————————
// Test 3: addDataToIndex
print("Test 3: addDataToIndex(atIndex: 2, value: 6666)")
v.addDataToIndex(atIndex: 2, value: 6666)
// expect [2,6,6666,2,98]
assert(v.size() == 5)
assert(v.getValue(ofIndex: 2) == 6666)
print(" ✔️ addDataToIndex works\n")

// ——————————————————————————————————————————————
// Test 4: removeFormIndex
print("Test 4: removeFormIndex(ofIndex: 2)")
v.removeFormIndex(ofIndex: 2)
// expect [2,6,2,98]
assert(v.size() == 4)
assert(v.getValue(ofIndex: 2) == 2)
print(" ✔️ removeFormIndex works\n")

// ——————————————————————————————————————————————
// Test 5: pop_back
print("Test 5: pop_back()")
let popped = v.pop_back()
assert(popped == 98)
assert(v.size() == 3)
print(" ✔️ pop_back works\n")

// ——————————————————————————————————————————————
// Test 6: clear
print("Test 6: clear()")
v.clear()
assert(v.size() == 0)
v.push_back(42)
assert(v.size() == 1 && v.getValue(ofIndex: 0) == 42)
print(" ✔️ clear works\n")

// ——————————————————————————————————————————————
// Test 7: massive push to force multiple resizes
print("Test 7: bulk push (0..<1_000)")
var bigV = Vector()
for i in 0..<1_000 {
    bigV.push_back(i)
}
assert(bigV.size() == 1_000)
for i in 0..<1_000 {
    assert(bigV.getValue(ofIndex: i) == i)
}
print(" ✔️ bulk push/pop & resizing\n")

import Foundation

print("🔍 Starting Vector full coverage tests…\n")

func assertUnchanged<T: Equatable>(_ before: T, _ after: T, message: String) {
    assert(before == after, message)
}

// ——————————————————————————————————————————————
// Setup a fresh vector for each block to avoid cross-pollution
// ——————————————————————————————————————————————

print("1️⃣  Normal operations (sanity check)")

do {
    let v = Vector()
    assert(v.size() == 0)
    v.push_back(1); v.push_back(2); v.push_back(3)
    assert(v.size() == 3)
    assert(v.getValue(ofIndex: 0) == 1)
    assert(v.getValue(ofIndex: 2) == 3)
    let popped = v.pop_back()
    assert(popped == 3 && v.size() == 2)
    v.addDataToIndex(atIndex: 1, value: 99)  // [1,99,2]
    assert(v.getValue(ofIndex: 1) == 99 && v.size() == 3)
    v.removeFormIndex(ofIndex: 1)            // [1,2]
    assert(v.size() == 2 && v.getValue(ofIndex: 1) == 2)
    v.clear()
    assert(v.size() == 0)
    print(" ✔️ normal flows passed\n")
}

// ——————————————————————————————————————————————
// 2️⃣  pop_back on empty → prints "out of bound", returns Int.max, size stays 0
// ——————————————————————————————————————————————
print("2️⃣  pop_back( ) on empty")
do {
    let v = Vector()
    let beforeSize = v.size()
    let result = v.pop_back()
    assert(result == Int.max, "Expected Int.max, got \(result)")
    assert(v.size() == beforeSize, "Size changed on empty pop")
    print(" ✔️ pop_back empty behavior OK\n")
}

// ——————————————————————————————————————————————
// 3️⃣  getValue(ofIndex:) out-of-bounds → prints "out of bound", returns Int.max, no crash
// ——————————————————————————————————————————————
print("3️⃣  getValue(ofIndex:) OOB")
do {
    let v = Vector()
    // push one so size == 1
    let mutable = v
    mutable.push_back(7)
    let beforeSize = mutable.size()
    let neg = mutable.getValue(ofIndex: -1)
    let eq = mutable.getValue(ofIndex: mutable.size())
    assert(neg == Int.max && eq == Int.max)
    assert(mutable.size() == beforeSize)
    print(" ✔️ getValue OOB behavior OK\n")
}

// ——————————————————————————————————————————————
// 4️⃣  setValue(atIndex:) out-of-bounds → prints "out of bound", does nothing
// ——————————————————————————————————————————————
print("4️⃣  setValue(atIndex:) OOB")
do {
    let v = Vector()
    [10,20,30].forEach { v.push_back($0) }   // [10,20,30]
    let snapshot0 = v.getValue(ofIndex: 0)
    let snapshot1 = v.getValue(ofIndex: 1)
    
    v.setValue(atIndex: -1, value: 999)
    v.setValue(atIndex: v.size(), value: 888)
    
    assert(v.getValue(ofIndex: 0) == snapshot0)
    assert(v.getValue(ofIndex: 1) == snapshot1)
    print(" ✔️ setValue OOB behavior OK\n")
}

// ——————————————————————————————————————————————
// 5️⃣  addDataToIndex(atIndex:) out-of-bounds → prints "out of bound", no insert
// ——————————————————————————————————————————————
print("5️⃣  addDataToIndex(atIndex:) OOB")
do {
    let v = Vector()
    [1,2,3].forEach { v.push_back($0) }     // [1,2,3]
    let beforeSize = v.size()
    v.addDataToIndex(atIndex: -1, value: 99)
    v.addDataToIndex(atIndex: beforeSize + 1, value: 77)
    assert(v.size() == beforeSize)
    assert(v.getValue(ofIndex: 0) == 1 && v.getValue(ofIndex: 2) == 3)
    print(" ✔️ addDataToIndex OOB behavior OK\n")
}

// ——————————————————————————————————————————————
// 6️⃣  removeFormIndex(ofIndex:) out-of-bounds → prints "out of bound", no removal
// ——————————————————————————————————————————————
print("6️⃣  removeFormIndex(ofIndex:) OOB")
do {
    let v = Vector()
    [5,6,7].forEach { v.push_back($0) }     // [5,6,7]
    let beforeSize = v.size()
    v.removeFormIndex(ofIndex: -1)
    v.removeFormIndex(ofIndex: beforeSize)
    assert(v.size() == beforeSize)
    assert(v.getValue(ofIndex: 0) == 5 && v.getValue(ofIndex: 2) == 7)
    print(" ✔️ removeFormIndex OOB behavior OK\n")
}

// ——————————————————————————————————————————————
// 7️⃣  addDataToIndex(atIndex: size) is valid → append at end
// ——————————————————————————————————————————————
print("7️⃣  addDataToIndex(atIndex: size) (append)")
do {
    let v = Vector()
    [8,9].forEach { v.push_back($0) }       // [8,9]
    let beforeSize = v.size()
    v.addDataToIndex(atIndex: beforeSize, value: 42)
    assert(v.size() == beforeSize + 1)
    assert(v.getValue(ofIndex: v.size()-1) == 42)
    print(" ✔️ append-via-addDataToIndex OK\n")
}

// ——————————————————————————————————————————————
// 8️⃣  removeFormIndex(ofIndex: lastIndex) is valid → pop last
// ——————————————————————————————————————————————
print("8️⃣  removeFormIndex(ofIndex: lastIndex) (pop-back equivalent)")
do {
    let v = Vector()
    [3,4,5].forEach { v.push_back($0) }     // [3,4,5]
    let beforeSize = v.size()
    v.removeFormIndex(ofIndex: beforeSize - 1)
    assert(v.size() == beforeSize - 1)
    print(" ✔️ remove last index OK\n")
}


// ——————————————————————————————————————————————
print("🎉 All non-fatal tests passed! Uncomment edge cases to verify your bounds checking. 🎉")
