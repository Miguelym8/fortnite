import Foundation
import Crypto
// import SwiftUI
func makeHash(string: String) -> String {
    guard let stringData = string.data(using: .utf8) else {
        fatalError("Failed to obtain data from string.")
    }
    let hash = Insecure.MD5.hash(data: stringData)
    let hashData = Data(hash)
    
    let hexadecimalHash = hashData.map { String(format: "%02hhx", $0) }.joined()
    return hexadecimalHash
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func printLine()->String {
    //    var oneLine: String = "Hello to all"

    let filename = "wordlist.txt"
   
let contents = try! String(contentsOfFile: filename)
let lines = contents.split(separator:"\n")
let Lines = lines.count
let outputfile = getDocumentsDirectory().appendingPathComponent("outputfile.txt")
var hash = ""
for line in 0 ... Lines {
        let word = String(lines[line])
        hash = makeHash(string: word)
//        try! hash.write(to: outputfile, atomically: true, encoding: String.Encoding.utf8)
     if hash == "3a8b7b53ab2be90f457869961f475aab" {
         print("password is \(word)")
           return hash
        } else {
         
            
        }
    }
    return hash
       
}

print(printLine())
