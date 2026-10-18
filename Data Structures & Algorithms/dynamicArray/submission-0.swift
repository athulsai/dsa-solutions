class DynamicArray {

    private var arr: [Int]
    private var length: Int = 0
    private var capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        arr = [Int](repeating: 0, count: capacity)
    }

    func get(_ i: Int) -> Int {
        arr[i]
    }

    func set(_ i: Int, _ n: Int) {
        arr[i] = n
    }

    func pushback(_ n: Int) {
        if length == capacity {
            resize()
        }

        arr[length] = n
        length += 1
    }

    func popback() -> Int {
        if length > 0 {
            length -= 1
        }

        return arr[length]
    }

    private func resize() {
        capacity *= 2
        var newArr = [Int](repeating: 0, count: capacity)
        for i in 0..<length {
            newArr[i] = arr[i]
        }

        arr = newArr
    }

    func getSize() -> Int {
        length
    }

    func getCapacity() -> Int {
        capacity
    }
}
