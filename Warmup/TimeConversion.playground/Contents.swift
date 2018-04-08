import Foundation

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s: String) -> String {
    /*
     * Write your code here.
     */
    var arrString = [String].init()
    
    for i in 1...s.count-1 {
        
        let char = s[s.index(s.startIndex, offsetBy: i)]
        if ( char == ":" ) {
            arrString.append(String(s[s.index(s.startIndex, offsetBy: i-2)...s.index(s.startIndex, offsetBy: i-1)]))
        } else if ( char == "P" || char == "A" ) {
            arrString.append(String(s[s.index(s.startIndex, offsetBy: i-2)...s.index(s.startIndex, offsetBy: i-1)]))
            arrString.append(String(s[s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: i+1)]))
        }
        
    }
    
    if (arrString[3] == "PM") {
        arrString[0] = "\(Int(arrString[0])!+12)"
    }
    
    return "\(arrString[0]):\(arrString[1]):\(arrString[2])"
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

//timeConversion(s: "07:05:45PM")
