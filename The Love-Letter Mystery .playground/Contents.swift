//: Playground - noun: a place where people can play


func main(string: String) -> String {
    var count = 0
    
    var arr = string2Array(string: string)
    
    for i in ( 0...arr.count/2 - (string.isEvenLength() ? 1 : 0) ) {
        
        var ascii1 = arr[i].getASCIICode()
        var ascii2 = arr[arr.count-1-i].getASCIICode()
        while ( ascii1 != ascii2 ) {
            if ascii1 > ascii2 {
                ascii1 = ascii1 - 1
            } else {
                ascii2 = ascii2 - 1
            }
            count = count + 1
        }
    }
    
    return "\(count)"
}

extension String {
    func getASCIICode() -> Int {
        return self.utf8.map{Int($0)}[0]
    }
    
    // 길이가 짝수인지 홀수인지
    func isEvenLength() -> Bool {
        if (self.count%2 == 0) {
            return true
        } else {
            return false
        }
    }
}

// string -> [String]
func string2Array(string: String) -> [String] {
    var arr = [String].init()
    
    for char in string {
            arr.append("\(char)")
    }
    
    return arr
}

// [Stirng] -> string
func arrat2String(arr: [String]) -> String {
    var string = ""
    
    for str in arr {
        string = string + str
    }
    
    return string
}


let input = readLine()
if let input = input {
    print(main(string: input))
}

main(string: "cba")
