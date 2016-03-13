//
//  Page.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 06/03/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import Foundation
import ObjectMapper

class Page : Mappable {
    var pageNr: Int? = 0
    var items: [Item] = [Item] ()
    
    required init?(_ map: Map) {
    }
    
    init (pageNr: Int) {
        self.pageNr = pageNr
    }
    
    func mapping(map: Map) {
        pageNr <- map["page"]
        items <- map["results"]
    }
    
    static let EMPTY = Page (pageNr: -1)
}