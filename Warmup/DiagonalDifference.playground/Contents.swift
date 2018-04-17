import Foundation

/*
 * Complete the diagonalDifference function below.
 */
func diagonalDifference(a: [[Int]]) -> Int {
    /*
     * Write your code here.
     */
    var sum = 0
    for i in 0...a.count-1{
        let arrIn = a[i]
        sum += arrIn[i]
    }
    
    var sum2 = 0
    let b = a.reversed() as [[Int]]
    for i in 0...b.count-1{
        let arrIn = b[i]
        sum2 += arrIn[i]
    }
    
    return (sum > sum2) ? sum - sum2 : sum2 - sum
}
//diagonalDifference(a: [[11, 2, 4], [4, 5, 6], [10, 8, -12]])

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let a: [[Int]] = AnyIterator{ readLine() }.prefix(n).map {
    let aRow: [Int] = $0.split(separator: " ").map {
        if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return aItem
        } else { fatalError("Bad input") }
    }

    guard aRow.count == n else { fatalError("Bad input") }

    return aRow
}

guard a.count == n else { fatalError("Bad input") }

let result = diagonalDifference(a: a)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
