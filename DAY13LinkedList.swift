// if recursion is more east to implement then do using recursion and if iteration feel more easy to implement then go with loops

public class Node{
    var data : Int
    var next : Node?

    public init() {
        self.data = 0;
        self.next = nil;
    }

    public init(_ data: Int ,_ next: Node? = nil){
        self.data = data
        self.next = next
    }
    // above constructor already implemented this constructor
    // public init(_ val: Int) {
    //     self.data = val;
    //     self.next = nil; 
    // }

}


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.data = 0; self.next = nil; }
 *     public init(_ val: Int) { self.data = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.data = val; self.next = next; }
 * }
 */

// if let input = readLine(), let number = Int(input) {
//     print("You entered: \(number)")
// } else {
//     print("Invalid number")
// }


func printLLRecursive(_ head: Node?){
    if head == nil{
        return
    }
    print(head!.data)
    printLLRecursive(head!.next)
}

func printLLIterative(_ head: Node?){
    var head = head
    while head != nil {
        print(head!.data)
        head = head!.next
    }

}

func llInputIterative() -> Node? {
    var head : Node? = nil    // Specify the type explicitly  as its a custom data type
     var tail : Node? = nil
    var inputValue = -1
    if let input = readLine(), let number = Int(input) {
        inputValue = number // not allowed to give parameter as value with spaces, values with enter need to ne given as per this implementation 
    }
    
    while inputValue != -1 {
        if head == nil{
            let firstNode = Node(inputValue)
            head = firstNode
            tail = firstNode
        }else{
            let tempNode = Node(inputValue)
            tail!.next = tempNode
            tail = tempNode
        }

        if let input = readLine(), let number = Int(input) {
            inputValue = number
        }
    }
    return head
}

func constructALinkedListFromArray(_ array : [Int]) -> Node? {
    //TODO
}

func lengthOfALinkedListRecursive(_ head: Node?) -> Int{
    if head == nil {
        return 0
    }
    return lengthOfALinkedListRecursive(head!.next) + 1
}

func lengthOfALinkedListIterative(_ head: Node?) -> Int{
    var head = head
    var length = 0
    while head != nil{
        length += 1
        head = head!.next
    }
    return length
}




let node3 = Node(3)
let node2 = Node(2,node3)
let node1 = Node(1,node2)

printLLRecursive(node1)
printLLIterative(node1)
print()
print(lengthOfALinkedListRecursive(node1))
print(lengthOfALinkedListIterative(node1))
print()
let myll = llInputIterative()
printLLRecursive(myll)


