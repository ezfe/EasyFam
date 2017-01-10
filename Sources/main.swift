import Foundation

let path = "/Users/ezekielelin/Library/Mobile Documents/com~apple~CloudDocs/Family History/My-Family-8-Jan-2017-156.txt"
let url = URL(fileURLWithPath: path)

let fetree = FamilyEchoTree(path: url)
let tree = Tree(from: fetree!)

if let me = tree?.personFrom(name: "Ezekiel Elin") {
    print(me)
}
