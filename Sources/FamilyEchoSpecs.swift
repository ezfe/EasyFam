//
//  FamilyEchoSpecs.swift
//  EasyFam
//
//  Created by Ezekiel Elin on 1/8/17.
//
//

import Foundation

enum LineBeginnings: String {
    case individual = "i"
    case partnership = "p"
    case comment = "#"
}

enum PersonSectionBeginnings: String {
    case identifier = "i"
    case firstNames = "p"
    case surnameNow = "l"
    case surnameBirth = "q"
    case gender = "g"
    case birthDate = "b"
    case deceased = "z"
    case deathDate = "d"
    case photo = "r"
    case mother = "m"
    case father = "f"
    case currentPartner = "s"
    case email = "e"
    case website = "w"
    case blog = "B"
    case photoSite = "P"
    case homeTel = "t"
    case workTel = "k"
    case mobileTel = "u"
    case skype = "S"
    case address = "a"
    case otherContact = "C"
    case birthPlace = "v"
    case deathPlace = "y"
    case burialPlace = "U"
    case burialDate = "F"
    case profession = "j"
    case company = "E"
    case interests = "I"
    case activities = "A"
    case bioNotes = "o"
    case circumflex = "^"
}

enum PartnershipSectionBeginnings: String {
    case partnershipIdentifiers = "p"
    case partners = "e"
    case partnershipType = "g"
    case startDate = "b"
    case engagementDate = "r"
    case weddingDate = "m"
    case weddingLocation = "w"
    case seperationDate = "s"
    case divorceDate = "d"
    case annulmentDate = "a"
    case endDate = "z"
}
