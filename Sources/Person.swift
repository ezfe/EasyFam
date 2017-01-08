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
class Person {
    
    /**
     Identifier
     
     Example: `R3QK8`
     
     IDs are case sensitive and contain one or more characters from A-z, a-z or 0-9.
     */
    var id: String
    
    //MARK: Personal Information
    
    /**
     First names
     
     Separated by spaces, e.g. `Mary Alice`
     */
    var firstNames: String?
    
    /**
     Surname now
     
     Example: `Smith`
     */
    var surnameNow: String?
    
    /**
     Surname at birth
     
     Example: `Jones`
     */
    var surnameBirth: String?
    
    /**
     Gender
     
     - `m` for male
     - `f` for female
     - `o` for other
     */
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
    var father: Person?
    var partner: Person?
    
    //MARK:- Contact Information
    
    /**
     Email
     
     Example: `mary@smith.org`
     */
    var email: String?
    
    /**
     Website
     
     Example: `http://www.mary.com/`
     */
    var website: String?
    
    /**
     Blog
     
     Example: `http://mary.blogspot.com/`
     */
    var blog: String?
    
    /**
     Photo site
     
     Example: `http://www.mary.com/photos/`
     */
    var photoSite: String?
    
    /**
     Home tel
     
     Example: `212 123 4567`
     */
    var homeTel: String?
    
    /**
     Work tel
     
     Example: `212 789 3456`
     */
    var workTel: String?
    
    /**
     Mobile
     
     Example: `212 123 2468`
     */
    var mobileTel: String?
    
    /**
     Skype
     
     Example: `mary_alice_smith`
     */
    var skype: String?
    
    /**
     Address
     
     Example: `123 Mass Ave\nNew York 10024\nUSA`
     */
    var address: String?
    
    /**
     Other contact
     
     Example: `ICQ maryalice123`
     */
    var otherContact: String?
    
    //MARK:- Biographical Information
    
    /**
     Birth place
     
     Example: `Chicago`
     */
    var birthPlace: String?
    
    /**
     Death place
     
     Ignored if person has not died (see z)
     */
    var deathPlace: String?
    
    /**
     Burial place
     
     Ignored if person has not died (see z)
     */
    var burialPlace: String?
    
    /**
     Burial date
     
     `YYYYMMDD` - see note on dates.
     */
    var burialDate: String?
    
    /**
     Profession
     
     Example: `Administrator`
     */
    var profession: String?
    
    /**
     Company
     
     Example: `Acme Corporation`
     */
    var company: String?
    
    /**
     Interests
     
     Example: `Movies, literature, history`
     */
    var interests: String?
    
    /**
     Activities
     
     Example: `Travel, painting`
     */
    var activities: String?
    
    /**
     Bio notes
     
     Example: `Also lived in Netherlands`
     */
    var bioNotes: String?
    
    init?(from familyEchoPerson: FamilyEchoPerson) {
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyyMMdd"
        
        self.id = familyEchoPerson.id
        self.firstNames = familyEchoPerson.firstNames
        self.surnameNow = familyEchoPerson.surnameNow
        self.surnameBirth = familyEchoPerson.surnameBirth
        self.gender = Gender(rawValue: familyEchoPerson.gender ?? "")
        self.birthDate = dateForm.date(from: familyEchoPerson.birthDate ?? "")
        self.deceased = familyEchoPerson.deceased == "1" ? true : false
        self.deathDate = dateForm.date(from: familyEchoPerson.deathDate ?? "")
        
        //TODO: Implement
        /*
        self.mother = familyEchoPerson.mother
        self.father = familyEchoPerson.father
        self.partner = familyEchoPerson.partner
        */
 
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
        self.burialDate = familyEchoPerson.burialDate
        self.profession = familyEchoPerson.profession
        self.company = familyEchoPerson.company
        self.interests = familyEchoPerson.interests
        self.activities = familyEchoPerson.activities
        self.bioNotes = familyEchoPerson.bioNotes
    }
}
