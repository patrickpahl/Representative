//
//  Representative.swift
//  Representative
//
//  Created by Patrick Pahl on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    private let nameKey = "name"
    private let partyKey = "party"
    private let stateKey = "state"
    private let districtKey = "district"
    private let phoneKey = "phone"
    private let officeKey = "office"
    private let linkKey = "link"
    
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    
    init?(dictionary:[String: AnyObject]) {                           ////nothing else needed like identifier, in this case State?
        guard let name = dictionary[nameKey] as? String,
            let party = dictionary[partyKey] as? String,
            let state = dictionary[stateKey] as? String,
            let district = dictionary[districtKey] as? String,
            let phone = dictionary[phoneKey] as? String,
            let office = dictionary[officeKey] as? String,
            let link = dictionary[linkKey] as? String
            else {return nil}
        
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
}

