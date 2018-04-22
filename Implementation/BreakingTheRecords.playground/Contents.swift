import Foundation

/*
 * Complete the breakingRecords function below.
 */
func breakingRecords(score: [Int]) -> [Int] {
    /*
     * Write your code here.
     */
    
    var maxScore = score[0]
    var minScore = score[0]
    var arrCount = [0, 0] // maxCount + minCount
    
    for i in 0...score.count-1 {
        if maxScore < score[i] {
            maxScore = score[i]
            arrCount[0] += 1
        }
        
        if minScore > score[i] {
            minScore = score[i]
            arrCount[1] += 1
        }
    }
    
    
    return arrCount
    
}

//breakingRecords(score: [10])

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let scoreTemp = readLine() else { fatalError("Bad input") }
let score: [Int] = scoreTemp.split(separator: " ").map {
    if let scoreItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoreItem
    } else { fatalError("Bad input") }
}

guard score.count == n else { fatalError("Bad input") }

let result = breakingRecords(score: score)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
