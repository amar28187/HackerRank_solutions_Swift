import Foundation

/*
 * Complete the plusMinus function below.
 */
func plusMinus(arr: [Int]) -> Void {
    var arrPNZ = [Double].init(repeating: 0.0, count: 3) // [0]: Positive [1]: Nagative [2]: Zeros
    
    for n in arr {
        let num = Double(n)
        if num > 0 {
            arrPNZ[0] += 1
        } else if num < 0 {
            arrPNZ[1] += 1
        } else {
            arrPNZ[2] += 1
        }
    }
    
    for num in arrPNZ {
        print( (num/Double(arr.count) * 1000000).rounded() / 1000000 )
    }
    
}
//plusMinus(arr: [-4, 3, -9, 0, 4, 1])

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
