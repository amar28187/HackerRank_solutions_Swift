import Foundation

/*
 * Complete the aVeryBigSum function below.
 */
func aVeryBigSum(n: Int, ar: [Int]) -> Int {
    /*
     * Write your code here.
     */
    var arr = ar
    var sum = 0
    for i in 0...n-1 {
        arr[i] = ar[i] + i+1
        sum += ar[i]
        
    }
    return sum
}
//aVeryBigSum(n: 5, ar: [1000000001, 1000000002, 1000000003, 1000000004, 1000000005])

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = aVeryBigSum(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
