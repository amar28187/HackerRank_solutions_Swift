import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
    var ouputs = [Int].init()
    
    for grade in grades {
        var num = grade
        
        var firstNum = num / 10
        var secNum = num % 10
        
        if secNum > 5 {
            if (10 - secNum < 3) {
                secNum = 0
                firstNum = firstNum + 1
            }
        } else if secNum < 5 {
            if (5 - secNum < 3) {
                secNum =  5
            }
        }
        
        num = firstNum * 10 + secNum
        if num < 40 {
            num = grade
        }
        
        ouputs.append(num)
    }
    
    return ouputs
}
//gradingStudents(grades: [73,67,38,33])

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
