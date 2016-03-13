//
//  ImageLoader.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 10/03/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class ImageLoaderDelegate : NSObject, SDWebImageManagerDelegate {
    
    var size = CGSize ()
    
    init(size: CGSize) {
        super.init()
        self.size = size
    }
    
    func imageManager(imageManager: SDWebImageManager!, var transformDownloadedImage image: UIImage!, withURL imageURL: NSURL!) -> UIImage! {
        
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.mainScreen().scale)
        let newSize = self.CGSizeAspectFill (image.size, minimumSize: size)
        image.drawInRect(CGRect (origin: CGPoint (x: -(newSize.width - size.width)/2, y: -(newSize.height - size.height)/2), size: newSize))
        image = UIGraphicsGetImageFromCurrentImageContext ()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func CGSizeAspectFill(aspectRatio: CGSize, var minimumSize: CGSize) -> CGSize
    {
        let mW = minimumSize.width / aspectRatio.width
        let mH = minimumSize.height / aspectRatio.height
        if mH > mW {
            minimumSize.width = minimumSize.height / aspectRatio.height * aspectRatio.width
        } else if mW > mH {
            minimumSize.height = minimumSize.width / aspectRatio.width * aspectRatio.height
        }
        return minimumSize;
    }
}