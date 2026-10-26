class Node {
    var val: Int
    var next: Node?
    var prev: Node?

    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
}

class Deque {

    private let dummyHead: Node = Node(0)
    private let dummyTail: Node = Node(0)

    init() {
        dummyHead.next = dummyTail
        dummyTail.prev = dummyHead
    }

    func isEmpty() -> Bool {
        return dummyHead.next === dummyTail
    }

    func append(_ value: Int) {
        let node = Node(value)
        node.prev = dummyTail.prev
        node.next = dummyTail
        dummyTail.prev?.next = node
        dummyTail.prev = node
    }

    func appendleft(_ value: Int) {
        let node = Node(value)
        node.next = dummyHead.next
        node.prev = dummyHead
        dummyHead.next?.prev = node
        dummyHead.next = node
    }

    func pop() -> Int {
        if isEmpty() { return -1 }
        let targetNode = dummyTail.prev!
        let prevNode = targetNode.prev!
        let value = targetNode.val

        dummyTail.prev = prevNode
        prevNode.next = dummyTail

        return value
    }

    func popleft() -> Int {
        if isEmpty() { return -1 }
        let targetNode = dummyHead.next!
        let nextNode = targetNode.next!
        let value = targetNode.val

        dummyHead.next = nextNode
        nextNode.prev = dummyHead

        return value
    }
}
