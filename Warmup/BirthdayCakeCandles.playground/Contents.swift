import Foundation

/*
 * Complete the birthdayCakeCandles function below.
 */
func birthdayCakeCandles(n: Int, ar: [Int]) -> Int {

    var maxTall = 0
    var cnt = 0
    for i in 0...ar.count-1{
        print("\(ar[i]), \(maxTall)")
        if maxTall == ar[i] {
            cnt += 1
        } else if maxTall < ar[i] {
            maxTall = ar[i]
            cnt = 1
        }
    }
    
    return cnt
}

//birthdayCakeCandles(n: 4, ar: [3, 2, 1, 3])

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

let result = birthdayCakeCandles(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
