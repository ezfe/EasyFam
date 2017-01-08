//
//  FamilyEchoPartnership.swift
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

struct FamilyEchoPartnership {
    
    var memebers = [String]()
    
    //MARK: Partnership Basics
    
    /**
     (Ex-)partners
     
     `1` means the two people are currently partners, or have been in the past.
     Not needed if we know about the partnership for other reasons - see final notes.
     */
    var partners: String?
    
    /**
     Type of (ex-)partnership
     
     -`m` for married
     -`e` for engaged
     -`r` for generic relationship
     -`s` for separated
     -`d` for divorced
     -`a` for annulled
     */
    var partnershipType: String?
    
    //MARK:- Partnership Beginnings
    
    /**
     Start date
     
     `YYYYMMDD` - start of generic relationship.
     */
    var startDate: String?
    
    /**
     Engagement date
     
     `YYYYMMDD`
     */
    var engagementDate: String?
    
    /**
     Wedding date
     
     `YYYYMMDD` - for all marriage-related partnerships, where `g` is `m`, `s`, `d` or `a`.
     */
    var weddingDate: String?
    
    /**
     Wedding location
     
     Example: `Las Vegas`
     */
    var weddingLocation: String?
    
    //MARK:- Partnership Endings
    
    /**
     Separation date
     
     `YYYYMMDD`
     */
    var seperationDate: String?
    
    /**
     Divorce date
     
     `YYYYMMDD`
     */
    var divorceDate: String?
    
    /**
     Annulment date
     
     `YYYYMMDD`
     */
    var annulmentDate: String?
    
    /**
     End date
     
     `YYYYMMDD` - generic end of relationship, where `g` is `m`, `e` or `r`.
     */
    var endDate: String?
    
    
    init(configurationLine line: String) {
        let componenets = line.components(separatedBy: "\t")
        for component in componenets {
            let startIndex = component.startIndex
            let firstCharacter = component[startIndex..<component.index(after: startIndex)]
            guard let componentType = PartnershipSectionBeginnings(rawValue: firstCharacter) else {
                print("Unable to find character \(firstCharacter) for component start")
                continue
            }
            let componentValue = component[component.index(after: startIndex)..<component.endIndex].replacingOccurrences(of: "[\r\n]+", with: "", options: .regularExpression)
            
            guard componentValue != "" else {
                print("Zero Length Component: \(line)")
                continue
            }
            
            switch componentType {
            case .partnershipIdentifiers:
                self.memebers = componentValue.components(separatedBy: " ")
            case .annulmentDate:
                self.annulmentDate = componentValue
            case .divorceDate:
                self.divorceDate = componentValue
            case .endDate:
                self.endDate = componentValue
            case .engagementDate:
                self.engagementDate = componentValue
            case .partners:
                self.partners = componentValue
            case .partnershipType:
                self.partnershipType = componentValue
            case .seperationDate:
                self.seperationDate = componentValue
            case .startDate:
                self.startDate = componentValue
            case .weddingDate:
                self.weddingDate = componentValue
            case .weddingLocation:
                self.weddingLocation = componentValue
                
            }
        }
    }
}
