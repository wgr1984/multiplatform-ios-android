//
//  Browser.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 24/02/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class Browser : NSObject, NSXMLParserDelegate {
    
    static var API_KEY = ""
    
    static let BASE_URL = "https://api.themoviedb.org/3/"
    
    static let BASE_IMG_URL = "http://image.tmdb.org/t/p/w300/"
    
    var currentItem: Item!
    var element = NSString()
    
    internal func LoadPage (pageNr: Int) -> Promise <Page> {
        
        let URL = "\(Browser.BASE_URL)discover/tv?api_key=\(Browser.API_KEY)"
        
        let promise = request(NSURLRequest(URL: NSURL(string: URL)!)).validate().responseObjectPromise (Page);
        
        return promise
    }
    
}