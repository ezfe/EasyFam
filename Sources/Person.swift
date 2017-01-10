//
//  Person.swift
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

/**
 * A person
 */
class Person: CustomStringConvertible, Equatable, Hashable {
    
    weak var tree: Tree?
    
    /**
     Identifier
     
     Example: `R3QK8`
     
     IDs are case sensitive and contain one or more characters from A-z, a-z or 0-9.
     */
    let identifier: String
    
    //MARK: Personal Information
    
    /**
     First names
     
     Separated by spaces, e.g. `Mary Alice`
     */
    var firstNames: String?
    var surnameNow: String?
    var surnameBirth: String?
    
    enum Gender: String {
        case male = "m"
        case female = "f"
        case other = "o"
    }
    var gender: Gender?
    
    var birthDate: Date?
    var deceased: Bool
    var deathDate: Date?
    
    /**
     Photo
     
     `imageid width height` - see note on images.
     */
    var photoPath: String?
    
    //MARK:- Basic Relationships
 
    var mother: Person?
    weak var father: Person?
    weak var partner: Person?
    
    //MARK:- Complex Relationships
    
    var children: Set<Person> {
        var people = Set<Person>()
        if let tree = self.tree {
            for (_, person) in tree.people where person.father === self || person.mother === self {
                people.insert(person)
            }
        }
        return people
    }
    
    var allSiblings: Set<Person> {
        let fatherChildren = father?.children ?? Set<Person>()
        let motherChildren = mother?.children ?? Set<Person>()
        
        let inteallChildren = fatherChildren.union(motherChildren)
        return inteallChildren

    }
    
    var fullSiblings: Set<Person> {
        let fatherChildren = father?.children ?? Set<Person>()
        let motherChildren = mother?.children ?? Set<Person>()
        
        let fullChildren = fatherChildren.intersection(motherChildren)
        return fullChildren
    }
    
    var halfSiblings: Set<Person> {
        let fatherChildren = father?.children ?? Set<Person>()
        let motherChildren = mother?.children ?? Set<Person>()
        
        let fullChildren = fatherChildren.intersection(motherChildren)
        let allChildren = fatherChildren.union(motherChildren)
        
        let halfChildren = allChildren.subtracting(fullChildren)
        
        return halfChildren
    }
    
    //MARK:- Contact Information
    
    var email: String?
    var website: String?
    var blog: String?
    var photoSite: String?
    var homeTel: String?
    var workTel: String?
    var mobileTel: String?
    var skype: String?
    var address: String?
    var otherContact: String?
    
    //MARK:- Biographical Information
    
    var birthPlace: String?
    var deathPlace: String?
    var burialPlace: String?
    var burialDate: Date?
    var profession: String?
    var company: String?
    var interests: String?
    var activities: String?
    var bioNotes: String?
    
    init?(from familyEchoPerson: FamilyEchoPerson, in tree: Tree) {
        self.tree = tree
        
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyyMMdd"
        
        self.identifier = familyEchoPerson.id
        self.firstNames = familyEchoPerson.firstNames
        self.surnameNow = familyEchoPerson.surnameNow
        self.surnameBirth = familyEchoPerson.surnameBirth
        self.gender = Gender(rawValue: familyEchoPerson.gender ?? "")
        self.birthDate = dateForm.date(from: familyEchoPerson.birthDate ?? "")
        self.deceased = familyEchoPerson.deceased == "1" ? true : false
        self.deathDate = dateForm.date(from: familyEchoPerson.deathDate ?? "")
        
        self.email = familyEchoPerson.email
        self.website = familyEchoPerson.website
        self.blog = familyEchoPerson.blog
        self.photoSite = familyEchoPerson.photoSite
        self.homeTel = familyEchoPerson.homeTel
        self.workTel = familyEchoPerson.workTel
        self.mobileTel = familyEchoPerson.mobileTel
        self.skype = familyEchoPerson.skype
        self.address = familyEchoPerson.address
        self.otherContact = familyEchoPerson.otherContact
        
        self.birthPlace = familyEchoPerson.birthPlace
        self.deathPlace = familyEchoPerson.deathPlace
        self.burialPlace = familyEchoPerson.burialPlace
        self.burialDate = dateForm.date(from: familyEchoPerson.burialDate ?? "")
        self.profession = familyEchoPerson.profession
        self.company = familyEchoPerson.company
        self.interests = familyEchoPerson.interests
        self.activities = familyEchoPerson.activities
        self.bioNotes = familyEchoPerson.bioNotes
    }
    
    var description: String {
        return "\(firstNames ?? "_") \(surnameNow ?? (surnameBirth ?? "_"))"
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var hashValue: Int {
        return identifier.hashValue
    }
}
