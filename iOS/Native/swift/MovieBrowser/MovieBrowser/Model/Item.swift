//
//  Item.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 06/03/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import Foundation
import ObjectMapper

class Item : Mappable {
    var poster_path: NSURL = NSURL ()
    var name: String = ""
    var overview: String = ""
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        var poster_path_raw = ""
        poster_path_raw <- map["poster_path"]
        
        poster_path = NSURL (string: Browser.BASE_IMG_URL + poster_path_raw)!
        
        name <- map["name"]
        overview <- map["overview"]
    }
}