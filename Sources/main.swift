import Foundation

let path = "/Users/ezekielelin/Library/Mobile Documents/com~apple~CloudDocs/Family History/My-Family-8-Jan-2017-156.txt"
let url = URL(fileURLWithPath: path)

let t = FamilyEchoTree(path: url)
print(t?.people)
print(t?.partnerships)
