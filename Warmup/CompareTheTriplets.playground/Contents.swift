import Foundation

/*
 * Complete the solve function below.
 */
func solve(a0: Int, a1: Int, a2: Int, b0: Int, b1: Int, b2: Int) -> [Int] {
    /*
     * Write your code here.
     */
    var alice = 0
    var bob = 0
    
    
    alice = ((a0>b0) ? 1:0 ) + ((a1>b1 ? 1:0)) + ((a2>b2 ? 1:0))
    bob = ((a0<b0) ? 1:0 ) + ((a1<b1 ? 1:0)) + ((a2<b2 ? 1:0))

    return [alice, bob]
}

//solve(a0: 5, a1: 6, a2: 7, b0: 3, b1: 6, b2: 10)

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let a0A1A2Temp = readLine() else { fatalError("Bad input") }
let a0A1A2 = a0A1A2Temp.split(separator: " ").map{ String($0) }

guard let a0 = Int(a0A1A2[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let a1 = Int(a0A1A2[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let a2 = Int(a0A1A2[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let b0B1B2Temp = readLine() else { fatalError("Bad input") }
let b0B1B2 = b0B1B2Temp.split(separator: " ").map{ String($0) }

guard let b0 = Int(b0B1B2[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let b1 = Int(b0B1B2[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

guard let b2 = Int(b0B1B2[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

let result = solve(a0: a0, a1: a1, a2: a2, b0: b0, b1: b1, b2: b2)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
