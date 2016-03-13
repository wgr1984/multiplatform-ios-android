//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Wolfgang Reithmeier on 24/02/16.
//  Copyright © 2016 Wolfgang Reithmeier. All rights reserved.
//

import UIKit
import PKHUD

class MainViewController: UIViewController {
    
    let browser = Browser ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BrowseButtonClicked(sender: AnyObject) {
        HUD.show(HUDContentType.Progress)
        
        browser.LoadPage(0).then { page -> Void in
            self.switchToListing(page)
            
            HUD.hide()
        }
    }
    
    func switchToListing(page: Page) {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("listing") as! BrowseTableViewController
        viewController.page = page
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}


