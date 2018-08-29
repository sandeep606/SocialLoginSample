//
//  UserResponse.swift
//  SideMenuSocialSignInSample
//
//  Created by Evontech on 8/29/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var firstName:String = ""
    var lastName:String = ""
    var gender:String = ""

    required init?(map: Map) {
    }
    
    //empty constructor
    init() {
        
    }
    
    func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        gender <- map["gender"]
    }
    
}
