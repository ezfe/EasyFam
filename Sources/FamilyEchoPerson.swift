//
//  FamilyEchoPerson
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

/**
 * Configuration loaded from Family Echo line
 * or for exporting to a Family Echo file
 */
struct FamilyEchoPerson {
    
    /**
     Identifier
     
     Example: `R3QK8`
     
     IDs are case sensitive and contain one or more characters from A-z, a-z or 0-9.
     */
    var id: String = "START"
    
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
    var gender: String?
    
    /**
     Birth date
     
     `YYYYMMDD` - see note on dates.
     */
    var birthDate: String?
    
    /**
     Deceased
     
     `1` to indicate that person has died.
     */
    var deceased: String?
    
    /**
     Death date
     
     `YYYYMMDD` - see note on dates.
     */
    var deathDate: String?
    
    /**
     Photo
     
     `imageid width height` - see note on images.
     */
    var photoPath: String?
    
    //MARK:- Basic Relationships
    
    /**
     Mother
     
     ID of mother, e.g. `F4XB6`
     */
    var mother: String?
    
    /**
     Father
     
     ID of father, e.g. `JD80F`
    */
    var father: String?
    
    /**
     Current partner
     
     ID of current partner, e.g. `PWAN7`
     */
    var partner: String?
    
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
    
    init(configurationLine line: String) {
        let componenets = line.components(separatedBy: "\t")
        for component in componenets {
            let startIndex = component.startIndex
            let firstCharacter = component[startIndex..<component.index(after: startIndex)]
            guard let componentType = PersonSectionBeginnings(rawValue: firstCharacter) else {
                print("Unable to find character \(firstCharacter) for component start")
                continue
            }
            let componentValue = component[component.index(after: startIndex)..<component.endIndex]
            
            switch componentType {
            case .identifier:
                self.id = componentValue
            case .activities:
                self.activities = componentValue
            case .address:
                self.address = componentValue
            case .bioNotes:
                self.bioNotes = componentValue
            case .birthDate:
                self.birthDate = componentValue
            case .birthPlace:
                self.birthPlace = componentValue
            case .blog:
                self.blog = componentValue
            case .burialDate:
                self.burialDate = componentValue
            case .burialPlace:
                self.burialDate = componentValue
            case .company:
                self.company = componentValue
            case .currentPartner:
                self.partner = componentValue
            case .deathDate:
                self.deathDate = componentValue
            case .deathPlace:
                self.deathPlace = componentValue
            case .deceased:
                self.deceased = componentValue
            case .email:
                self.email = componentValue
            case .father:
                self.father = componentValue
            case .firstNames:
                self.firstNames = componentValue
            case .gender:
                self.gender = componentValue
            case .homeTel:
                self.homeTel = componentValue
            case .interests:
                self.interests = componentValue
            case .mobileTel:
                self.mobileTel = componentValue
            case .mother:
                self.mother = componentValue
            case .otherContact:
                self.otherContact = componentValue
            case .photo:
                self.photoPath = componentValue
            case .photoSite:
                self.photoSite = componentValue
            case .profession:
                self.profession = componentValue
            case .skype:
                self.skype = componentValue
            case .surnameBirth:
                self.surnameBirth = componentValue
            case .surnameNow:
                self.surnameNow = componentValue
            case .website:
                self.website = componentValue
            case .workTel:
                self.workTel = componentValue
            case .circumflex:
                //TODO: What is this
                break
            }
        }
    }
}
