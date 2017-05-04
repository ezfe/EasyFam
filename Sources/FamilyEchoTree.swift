//
//  FamilyEchoTree.swift
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

struct FamilyEchoTree {
    private(set) var people = [FamilyEchoPerson]()
    private(set) var partnerships = [FamilyEchoPartnership]()
    
    init?(path: URL) {
        do {
            let lines = try String(contentsOf: path).components(separatedBy: .newlines)
            for line in lines where line.characters.count > 0 {
                let startIndex = line.startIndex
                let firstCharacter: String = line[startIndex..<line.index(after: startIndex)]
                
                guard let lineType = LineBeginnings(rawValue: firstCharacter) else {
                    print("First character \(firstCharacter) not recognized")
                    continue
                }
                
                switch lineType {
                case .individual:
                    let individual = FamilyEchoPerson(configurationLine: line)
                    people.append(individual)
                case .partnership:
                    let partnership = FamilyEchoPartnership(configurationLine: line)
                    partnerships.append(partnership)
                case .comment:
                    print(line)
                }
            }
        } catch {
            print("Unable to read file \(path)")
        }
    }
}
