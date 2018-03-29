//: Playground - noun: a place where people can play


func main(string: String) {
    // 1. string 대소문자 있는지 체크
    // 2. 있으면 그 앞까지 단어  return (없을때까지)
    var changedString = string
    
    for _ in changedString {
        if let index = getBeforIndexOfCapital(string: changedString) {
//            print(index.encodedOffset)
            if index.encodedOffset != 0 {
                let startIndex = changedString.startIndex
                let endIndex = changedString.index(before: index)
                
                print( changedString[startIndex...endIndex] )
                changedString = removeCharInString(string: changedString, startIndex: startIndex, endIndex: endIndex)
//                print(changedString)
            }
        }
    }
    
}

// REUSE
// MARK : startIndex 부터 endIndex까지 remove string
func removeCharInString(string:String, startIndex:String.Index, endIndex:String.Index) -> String {
    var changedString = string
    changedString.removeSubrange(startIndex...endIndex)

    return changedString
}

// MARK : string 앞부터 검사해서 대문자 있으면 해당 index를 리턴
func getBeforIndexOfCapital(string: String) -> String.Index? {
    var index: String.Index? = nil
    
    for i in 0...string.utf8.count-1 {
        index = string.index(string.startIndex, offsetBy: i)

        let str  = String(string[index!])        
        if str.isUppercased && i != 0 {
            break
        }
    }
    
    return index
}


// MARK : ExString 대소문자인지 확인
extension String {
    var isLowercased: Bool {
        for c in utf8 where (65...90) ~= c { return false }
        return true
    }
    var isUppercased: Bool {
        for c in utf8 where (97...122) ~= c { return false }
        return true
    }
}

//let input = readLine()
//if let input = input {
//    print(main(string: input))
//}

main(string: "shareTheWorldWow")
