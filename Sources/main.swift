import Foundation

let path = "/Users/ezekielelin/Library/Mobile Documents/com~apple~CloudDocs/Family History/My-Family-8-Jan-2017-156.txt"
let url = URL(fileURLWithPath: path)

let t = FamilyEchoTree(path: url)
let tree = Tree(from: t!)
print(tree?.people["START"]?.father?.firstNames ?? "Error")
