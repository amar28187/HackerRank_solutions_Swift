//: Playground - noun: a place where people can play

func main(string: String) -> Int {
    // 1. input string의 길이
    // 2. input string / 3 몇개인지
    // 3. 개수만큼 SOS 채운  string과 input 비교하여 몇개의 char 개수만큼 다른지 확인
    
    let length = string.utf8.count
    let count = length / 3
    
    let madeString = getStrings2Count(count: count, string: "SOS")
    
    let rtn = getCountDiffChar2Strings(string1: string, string2: madeString)
    
    return rtn
}


// MARK : 원하는 개수만큼 원하는 string 반복 채우기
func getStrings2Count(count: Int, string: String) -> String {
    var result = ""
    
    for _ in 0...count-1 {
        result.append(string)
    }
    
    return result
}

// MARK : 두 가지 스트링의 각각의 Char를 비교하여 다른 갯수 만큼 리턴
func getCountDiffChar2Strings(string1: String, string2: String) -> Int {
    var count = 0
    
    for i in 0...string1.utf8.count-1 {
        let c1 = string1[string1.index(string1.startIndex, offsetBy: i)]
        let c2 = string2[string2.index(string2.startIndex, offsetBy: i)]
        
        if c1 != c2 {
            count = count + 1
        }
    }
    return count
}


let input = readLine()
if let input = input {
    print(main(string: input))
}

//main(string: "SOSSOASOA")

