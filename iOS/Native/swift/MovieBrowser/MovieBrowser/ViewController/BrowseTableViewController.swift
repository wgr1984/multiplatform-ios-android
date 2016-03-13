//
//  BrowseTableViewController.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 06/03/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import UIKit
import SDWebImage

class BrowseTableViewController : UITableViewController, SDWebImageManagerDelegate {
    
    var page = Page.EMPTY
    
    let loadOptions = SDWebImageOptions ()
    
    let imageLoaderDelegate = ImageLoaderDelegate (size: CGSize (width: 170, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        SDWebImageManager.sharedManager().delegate = imageLoaderDelegate
        self.endScroll(self.tableView)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        SDWebImageManager.sharedManager().delegate = nil
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return page.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(BrowseCell.KEY) as! BrowseCell?
        
        if let bCell = cell {
            let item = page.items [indexPath.row]
            bCell.title.text = item.name
            bCell.picture.sd_setImageWithPreviousCachedImageWithURL(item.poster_path, placeholderImage: nil, options: self.loadOptions, progress: nil, completed: nil)
        }
        
        return cell!
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate) {
            self.endScroll(scrollView)
        }
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.endScroll(scrollView)
    }
    
    func endScroll (scrollView: UIScrollView) {
        if let tableView = scrollView as? UITableView {
            for cell in tableView.visibleCells {
                if let browserCell = cell as? BrowseCell {
                    let item = page.items [(tableView.indexPathForCell(cell)?.row)!]
                    SDWebImageManager.sharedManager().downloadImageWithURL(item.poster_path, options: self.loadOptions, progress: nil, completed: {
                        (image, error, type, cached, url) in
                            browserCell.picture.image = image
                    })
                }
            }
        }
    }
}

