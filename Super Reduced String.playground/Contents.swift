//: Playground - noun: a place where people can play

func main(string: String) -> String {
    var changedString = string
    
    // 1. string에 twice 가 있는지 (없을때 까지) 체크
    // 2. 있으면, tiwice char 리턴하게끔
    
//    print(string)
    
    while true {
        if isHavingTwiceChar(string: changedString) {
            let (startIndex, endIndex) = getIndexOfTwiceChar(string: changedString)
            changedString = removeCharInString(string: changedString, startIndex: startIndex, endIndex: endIndex)
            
            if changedString.isEmpty {
                changedString = "Empty String"
            }
        }
        else {
            break
        }
    }
    
//    print(changedString)

    return changedString
}

// MARK : "aa"와 같이 같은 글자가 붙어있는지 여부
func isHavingTwiceChar(string: String) -> Bool {
    let len = string.utf8.count-1
    
    for i in 0...len {
        if i < len {
            let startIndex = string.index(string.startIndex, offsetBy: i)
            let endIndex = string.index(startIndex, offsetBy: 1)
            
            if isSameText(string1: string[startIndex], string2: string[endIndex]) {
                return true
            }
        }
    }
    return false
}

// MARK : 두 char 가 같은지 비교
func isSameText(string1: Character, string2: Character) -> Bool {
    if (string1 == string2) {
        return true
    } else {
        return false
    }
}

// MARK :  "aa"와 같이 같은 글자의 index 추출
func getIndexOfTwiceChar(string: String) -> (String.Index, String.Index) {
    var startIndex = string.index(string.startIndex, offsetBy: 0)
    var endIndex = string.index(startIndex, offsetBy: 1)
    let len = string.utf8.count-1
    
    for i in 0...len {
        if i < len {
            startIndex = string.index(string.startIndex, offsetBy: i)
            endIndex = string.index(startIndex, offsetBy: 1)
            
            if isSameText(string1: string[startIndex], string2: string[endIndex]) {
                break
            }
        }
    }
    
    return (startIndex, endIndex)
}

// MARK : startIndex 부터 endIndex까지 remove string
func removeCharInString(string:String, startIndex:String.Index, endIndex:String.Index) -> String {
    var changedString = string
    changedString.removeSubrange(startIndex...endIndex)
    
    // debug
//    print(changedString)
    
    return changedString
}

let s = main(string: "apple")

//let input = readLine()
//if let input = input {
//    let output = main(string: input)
//    print(output) // -> the input will be printed out.
//}

