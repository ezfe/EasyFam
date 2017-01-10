//
//  Partnership
//  EasyFam
//
//  Created by Ezekiel Elin on 1/9/17.
//
//

import Foundation

class Partnership {
    var members = [Person]()
    
    //MARK: Partnership Basics
    
    /**
     (Ex-)partners
     
     `1` means the two people are currently partners, or have been in the past.
     Not needed if we know about the partnership for other reasons - see final notes.
     */
    var partners: Bool?
    
    /**
     Type of (ex-)partnership
     
     -`m` for married
     -`e` for engaged
     -`r` for generic relationship
     -`s` for separated
     -`d` for divorced
     -`a` for annulled
     */
    enum PartnershipType: String {
        case married = "m"
        case engaged = "e"
        case generic = "r"
        case seperated = "s"
        case divorced = "d"
        case annulled = "a"
    }
    var partnershipType: PartnershipType?
    
    //MARK:- Partnership Beginnings
    
    var startDate: Date?
    var engagementDate: Date?
    var weddingDate: Date?
    var weddingLocation: String?
    
    //MARK:- Partnership Endings
    
    var seperationDate: Date?
    var divorceDate: Date?
    var annulmentDate: Date?
    var endDate: Date?
    
    init?(from familyEchoPartnership: FamilyEchoPartnership) {
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyyMMdd"
        
        if let partners = familyEchoPartnership.partners, partners == "1" {
            self.partners = true
        }
        self.partnershipType = PartnershipType(rawValue: familyEchoPartnership.partnershipType ?? "")
        self.startDate = dateForm.date(from: familyEchoPartnership.startDate ?? "")
        self.engagementDate = dateForm.date(from: familyEchoPartnership.engagementDate ?? "")
        self.weddingDate = dateForm.date(from: familyEchoPartnership.weddingDate ?? "")
        self.weddingLocation = familyEchoPartnership.weddingLocation
        self.seperationDate = dateForm.date(from: familyEchoPartnership.seperationDate ?? "")
        self.divorceDate = dateForm.date(from: familyEchoPartnership.divorceDate ?? "")
        self.annulmentDate = dateForm.date(from: familyEchoPartnership.annulmentDate ?? "")
        self.endDate = dateForm.date(from: familyEchoPartnership.endDate ?? "")
    }
}
