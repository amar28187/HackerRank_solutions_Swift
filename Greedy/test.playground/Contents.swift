//: Playground - noun: a place where people can play

func main(str: String) -> String {
    
    // "1 2 3" -> [1,2,3]
    let string = "\(str)  "
    
    var startCharIndex = string.startIndex
    var array: [Int]! = nil
    for i in 1...string.count-1 {
        let char = string[string.index(string.startIndex, offsetBy: i-1)]        
        if ("\(char)" == " ") {
            let endCharIndex = string.index(string.startIndex, offsetBy: i-2)
            
            let word = string[startCharIndex...endCharIndex]
            startCharIndex = string.index(string.startIndex, offsetBy: i)
            
            if ( array == nil ) {
                array = [Int].init()
            }
            array.append(Int(word)!)
            
        }
    }
    ////////////////////

    
    // 삽입정렬 ( 3 2 1 )
    for i in 1...array.count-1 {
        var j = i
        while ( j > 0 && array[j] > array[j-1]) {
            let temp = array[j-1]
            array[j-1] = array[j]
            array[j] = temp
            j = j-1
        }
    }
    
    print(array)
    ////////////////////
    
    // 2의 제곱근
    var sum = 0
    for i in 0...array.count-1 {
        var pow = 1
        if i > 0 {
            for _ in 1...i {
                pow = pow * 2
            }
        }
        
        sum = sum + array[i] * pow
    }
    

    
    
    
    return "\(sum)"
    
}

let input = readLine()
if let input = input {

    for _ in 0...Int(input)! {
        let str = readLine()
        if let str = str {
            print(main(str: str))
        }
    }

}

//main(str: "1 3 2") 
