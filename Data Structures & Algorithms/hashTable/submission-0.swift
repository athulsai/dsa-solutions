class Node {
    var key: Int
    var value: Int
    var next: Node?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
        self.next = nil
    }
}

class HashTable {
    private var capacity: Int
    private var size: Int = 0
    private var table: [Node?]

    init(_ capacity: Int) {
        self.capacity = capacity
        self.table = [Node?](repeating: nil, count: capacity)
    }

    private func hashFunction(_ key: Int) -> Int {
        return key % self.capacity
    }

    func insert(_ key: Int, _ value: Int) {
        let index = self.hashFunction(key)
        var node = self.table[index]

        if node == nil {
            self.table[index] = Node(key, value)
            self.size += 1
        } else {
            var prev: Node? = nil
            while node != nil {
                if node!.key == key {
                    node!.value = value
                    return
                }

                prev = node
                node = node!.next
            }

            prev?.next = Node(key, value)
            self.size += 1
        }

        if Double(self.size) / Double(self.capacity) >= 0.5 {
            self.resize()
        }
    }

    func get(_ key: Int) -> Int {
        let index = hashFunction(key)
        var node = table[index]

        while node != nil {
            if node!.key == key {
                return node!.value
            }

            node = node!.next
        }

        return -1
    }

    func remove(_ key: Int) -> Bool {
        let index = hashFunction(key)
        var node = table[index]
        var prev: Node? = nil

        while node != nil {
            if node!.key == key {
                if prev != nil {
                    prev!.next = node!.next
                } else {
                    table[index] = node!.next
                }

                size -= 1
                return true
            }

            prev = node
            node = node!.next
        }

        return false
    }

    func getSize() -> Int {
        return self.size
    }

    func getCapacity() -> Int {
        return self.capacity
    }

    func resize() {
        let newCapacity = self.capacity * 2
        var newTable = [Node?](repeating: nil, count: newCapacity)

        for node in self.table {
            var current = node
            while current != nil {
                let index = current!.key % newCapacity
                if newTable[index] == nil {
                    newTable[index] = Node(current!.key, current!.value)
                } else {
                    var newNode = newTable[index]
                    while newNode?.next != nil {
                        newNode = newNode?.next
                    }

                    newNode?.next = Node(current!.key, current!.value)
                }

                current = current!.next
            }
        }

        self.capacity = newCapacity
        self.table = newTable
    }
}
