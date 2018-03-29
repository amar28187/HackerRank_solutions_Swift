//: Playground - noun: a place where people can play


func main(string: String) -> String {
    
    // 1. 한글자씩 비교해본다 (a2-a1=1)
    // 2. 1로 안될 경우에, 9 또는 99가 있는지 검사
    
    var rtn = compareStringsSingly(string: string)
    
//    if (rtn == "NO") {
//        rtn = compareStringsWith9(string: string)
//    }
    
    print("ffff + \(compareStringsOverTwice(string: string, numOfCompareLetter: 2))")
    
    return rtn
}

// MARK : string 한글자씩 비교하였을 때, a2-a1=1 인지
func compareStringsSingly(string: String) -> String {
    var rtn = "NO"
    
    for i in 0...string.utf8.count-1 {
        if i < string.utf8.count-1 {
            let strBefore = string[string.index(string.startIndex, offsetBy: i)]
            let strAfter = string[string.index(string.startIndex, offsetBy: i+1)]

            let nBefore = Int(String(strBefore))!
            let nAfter = Int(String(strAfter))!
            
            if ((nAfter - nBefore) == 1) {
                rtn = "YES \(string[string.startIndex])"
            } else {
                rtn = "NO"
            }
            
            
        }
    }
    
    return rtn
}

// MARK : string 두 글자씩 비교하였을 때, a2-a1=1 인지
func compareStringsOverTwice(string: String, numOfCompareLetter:Int) -> String {
    var rtn = "NO"
    
    for i in (0...(string.utf8.count-1)) {
        if ( i%2 == 1 && ( i+numOfCompareLetter < string.utf8.count-1 ) ) {
            

            let strBefore = string[string.index(string.startIndex, offsetBy: i)]
            let strAfter = string[string.index(string.startIndex, offsetBy: i+numOfCompareLetter)]
            
            let nBefore = Int(String(strBefore))!
            let nAfter = Int(String(strAfter))!
            print("ssss + \(i) +  \(nBefore) \(nAfter)")
        
            if ((nAfter - nBefore) == 1) {
                rtn = "YES \(string[string.startIndex])"
            } else {
                rtn = "NO"
            }
        }
    }
    return rtn
}


// MARK : string 9가 포함되었을 떄, a2-a1=1 인지
func compareStringsWith9(string: String) -> String {
    var rtn = "NO"

    // 1. 9가 포함되어있으면
    // 2. 앞까지는 한자리 숫자로
    // 3. 뒤는 두자리 숫자로
    let count = getCountOfCharInString(string: string, char: "9")
    if ( count > 0 ) {
        
    }
    
    
    if (string[string.startIndex] == "9") {
        for i in (2...((string.utf8.count-1)/2)) {
            if i < string.utf8.count-1 {
                
                let strBefore = string[string.index(string.startIndex, offsetBy: i)]
                let strAfter = string[string.index(string.startIndex, offsetBy: i+1)]
                
                let nBefore = Int(String(strBefore))!
                let nAfter = Int(String(strAfter))!
                print("\(i) \(nBefore) \(nAfter)")
                
                if ((nAfter - nBefore) == 1) {
                    rtn = "YES \(string[string.startIndex])"
                } else {
                    rtn = "NO"
                }
                
            }
        }
    }
    
    
    return rtn
}

// 특정 문자가 몇 번 붙어있는지 검사
func getCountOfCharInString(string: String, char: Character) -> Int{
    var count = 0
    for c in string {
        if (c == char) {
            count = count + 1
        }
    }
    return count
}


//let input = readLine()
//if let input = input {
//    print(main(string: input))
//}

print(main(string: "101112"))

