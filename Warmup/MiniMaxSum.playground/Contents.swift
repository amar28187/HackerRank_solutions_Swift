import Foundation

/*
 * Complete the miniMaxSum function below.
 */
func miniMaxSum(arr: [Int]) -> Void {
    
    var arrSums = [Int]()
    for j in 0...arr.count-1 {
        var sum = 0

        for i in 0...arr.count-1 {
            if i != j {
                sum += arr[i]
            }
        }
        arrSums.append(sum)
    }
    
    arrSums = arrSums.sorted()
    print("\(arrSums.first!) \(arrSums.last!)")
    
}

//miniMaxSum(arr: [1, 2, 3, 4, 5])

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)
