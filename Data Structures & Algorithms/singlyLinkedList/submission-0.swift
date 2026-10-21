class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class LinkedList {

    private let head: ListNode = ListNode(-1)
    private var tail: ListNode

    init() {
        tail = head
    }

    func get(_ index: Int) -> Int {
        var curr: ListNode? = head.next
        var i = 0
        while let current = curr {
            if i == index {
                return current.val
            }

            i += 1
            curr = current.next
        }

        return -1
    }

    func insertHead(_ value: Int) {
        let node = ListNode(value, head.next)
        head.next = node
        if node.next == nil {
            tail = node
        }
    }

    func insertTail(_ value: Int) {
        let node = ListNode(value, nil)
        tail.next = node
        tail = tail.next!
    }

    func remove(_ index: Int) -> Bool {
        var i = 0
        var curr: ListNode? = head
        while i < index, curr != nil {
            i += 1
            curr = curr!.next
        }

        if curr != nil, curr!.next != nil {
            if curr!.next === tail {
                tail = curr!
            }

            curr!.next = curr!.next?.next
            return true
        }

        return false
    }

    func getValues() -> [Int] {
        var res: [Int] = []
        var curr = head.next
        while curr != nil {
            res.append(curr!.val)
            curr = curr!.next
        }

        return res
    }
}
