class TreeNode {
    var key: Int
    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class TreeMap {
    private var root: TreeNode? = nil

    func insert(_ key: Int, _ value: Int) {
        let newNode = TreeNode(key, value)
        if root == nil {
            root = newNode
            return
        }

        var current = root
        while true {
            if key < current!.key {
                if current!.left == nil {
                    current!.left = newNode
                    return
                }
                current = current!.left
            } else if key > current!.key {
                if current!.right == nil {
                    current!.right = newNode
                    return
                }
                current = current!.right
            } else {
                current!.value = value
                return
            }
        }
    }

    func get(_ key: Int) -> Int {
        var current = root
        while current != nil {
            if key < current!.key {
                current = current!.left
            } else if key > current!.key {
                current = current!.right
            } else {
                return current!.value
            }
        }

        return -1
    }

    func getMin() -> Int {
        let current = findMin(root)
        return current?.value ?? -1
    }

    private func findMin(_ node: TreeNode?) -> TreeNode? {
        var current = node
        while current != nil, current!.left != nil {
            current = current!.left
        }

        return current
    }

    func getMax() -> Int {
        var current = root
        while current != nil, current!.right != nil {
            current = current!.right
        }

        return current?.value ?? -1
    }

    func remove(_ key: Int) {
        root = removeHelper(root, key)
    }

    func getInorderKeys() -> [Int] {
        var result: [Int] = []
        inorderTraversal(root, &result)
        return result
    }

    private func removeHelper(_ curr: TreeNode?, _ key: Int) -> TreeNode? {
        guard var curr = curr else { return nil }
        if key > curr.key {
            curr.right = removeHelper(curr.right, key)
        } else if key < curr.key {
            curr.left = removeHelper(curr.left, key)
        } else {
            if curr.left == nil {
                return curr.right
            } else if curr.right == nil {
                return curr.left
            } else {
                let minNode = findMin(curr.right)!
                curr.key = minNode.key
                curr.value = minNode.value
                curr.right = removeHelper(curr.right, minNode.key)
            }
        }

        return curr
    }

    private func inorderTraversal(_ root: TreeNode?, _ result: inout [Int]) {
        if root != nil {
            inorderTraversal(root!.left, &result)
            result.append(root!.key)
            inorderTraversal(root!.right, &result)
        }
    }
}
