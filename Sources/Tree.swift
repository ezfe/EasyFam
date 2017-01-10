//
//  Tree.swift
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

typealias PersonID = String

class Tree {
    var people = [PersonID: Person]()
    var partnerships = [Partnership]() {
        didSet {
            
        }
    }
    
    /**
     Attempts to load a person from their full name
     This will return the first matching person
     */
    func personFrom(name: String) -> Person? {
        for (_, person) in people {
            if "\(person.firstNames ?? "") \(person.surnameNow ?? "")" == name {
                return person
            } else if "\(person.firstNames ?? "") \(person.surnameBirth ?? "")" == name {
                return person
            }
        }
        return nil
    }
    
    func personFrom(id: String) -> Person? {
        return people[id]
    }
    
    init?(from fetree: FamilyEchoTree) {
        for feperson in fetree.people {
            guard let person = Person(from: feperson, in: self) else {
                print("An error occurred loading a person")
                return nil
            }
            people[person.identifier] = person
        }
        for feperson in fetree.people where feperson.father != nil || feperson.mother != nil || feperson.partner != nil {
            if let fid = feperson.father {
                people[feperson.id]?.father = people[fid]
            }
            if let mid = feperson.mother {
                people[feperson.id]?.mother = people[mid]
            }
            if let pid = feperson.partner {
                people[feperson.id]?.partner = people[pid]
            }
        }
        
        for ferelation in fetree.partnerships {
            guard let relate = Partnership(from: ferelation) else {
                print("An error occurred loading a parnership")
                return nil
            }
            guard let p1 = people[ferelation.members[0]], let p2 = people[ferelation.members[1]] else {
                print("Unable to load members of partnership")
                return nil
            }
            relate.members = [p1, p2]
            partnerships.append(relate)
        }
    }
}
