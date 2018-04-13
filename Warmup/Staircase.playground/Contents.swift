import Foundation

/*
 * Complete the staircase function below.
 */
func staircase(n: Int) -> Void {

    for i in 1...n {
        var text = ""
        
        if n != i {
            for _ in 1...n-i {
                text.append(" ")
            }
        }
        for _ in 1...i {
            text.append("#")
        }
        print(text)
    }

}
//staircase(n: 6)

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

staircase(n: n)
