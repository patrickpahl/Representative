//
//  RepresentativeController.swift
//  Representative
//
//  Created by Patrick Pahl on 6/8/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURLString = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    // example url = http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    
    //    static func searchURLByState(state: String) -> NSURL{
    //
    //        return NSURL(string: baseURLString + "getall_reps_bystate.php?state=\(state)&output=json")!
    //    }
    
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void){
        
        guard let url = NSURL(string: baseURLString) else {
            completion(representatives: [])
            return
        }
        
        let urlParameters = ["state": "\(state)", "output": "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            guard let data = data,
                
                let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                
                let representativeDictionaries = json["results"] as? [[String: AnyObject]] else {
                    
                    print("Unable to serialize")
                    completion(representatives: [])
                    return
            }
            
            let representatives = representativeDictionaries.flatMap { Representative(dictionary: $0) }              ////error?
            
            completion (representatives: representatives)
        }
        
    }
    
}

