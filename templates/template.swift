import Foundation

let n = Int(readLine()!)!
for i in 1...n {
    let s = readLine()!.components(separatedBy: " ")
    print("hello = " + s[0] + " , world = " + s[1])
}
