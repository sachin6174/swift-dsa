class Node{
    var data : Int
    var next : Node?
    init(_ data: Int ,_ next: Node? = nil){
        self.data = data
        self.next = next
    }
}

let node3 = Node(3)
let node2 = Node(2,node3)
let node1 = Node(1,node2)

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

// printLLRecursive(node1)
// printLLIterative(node1)


// if let input = readLine(), let number = Int(input) {
//     print("You entered: \(number)")
// } else {
//     print("Invalid number")
// }

func llInput() -> Node? {
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

let myll = llInput()
printLLRecursive(myll)