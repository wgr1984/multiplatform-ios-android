//
//  Key.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 13/03/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import Foundation
import ObjectMapper

class Key : Mappable {
    var key: String = ""
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        key <- map["key"]
    }
}