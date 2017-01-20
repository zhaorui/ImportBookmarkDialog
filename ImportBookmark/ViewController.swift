//
//  ViewController.swift
//  ImportBookmark
//
//  Created by 赵睿 on 19/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var chrome: ImportButton!
    @IBOutlet weak var safari: ImportButton!
    @IBOutlet weak var firefox: ImportButton!
    @IBOutlet weak var local: ImportButton!
    
    //#imageLiteral(resourceName:
    var chromeBtn = ImportButton(frame: NSMakeRect(0, 0, 108, 130), withImage: #imageLiteral(resourceName: "chrome"))
    var safariBtn = ImportButton(frame: NSMakeRect(0, 0, 108, 130), withImage: #imageLiteral(resourceName: "Safari"))
    var firefoxBtn = ImportButton(frame: NSMakeRect(0, 0, 108, 130), withImage: #imageLiteral(resourceName: "Firefox"))
    var localBtn = ImportButton(frame: NSMakeRect(0, 0, 108, 130), withImage: #imageLiteral(resourceName: "local"))
    
    @IBOutlet weak var firstrow: ZRStackView!
    @IBOutlet weak var secondRow: ZRStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //                safari.isHidden = true
        //                chrome.isHidden = true
        //                local.isHidden = true
        //                firefox.isHidden = true
        
        chromeBtn.setFixedConstraint(width: 108, height: 130)
        safariBtn.setFixedConstraint(width: 108, height: 130)
        firefoxBtn.setFixedConstraint(width: 108, height: 130)
        localBtn.setFixedConstraint(width: 108, height: 130)
        
    }

    
    
    @IBAction func addChrome(_ sender: ImportButton) {
        if secondRow.views.contains(chromeBtn) {
            secondRow.removeView(chromeBtn)
        } else {
            secondRow.addView(chromeBtn, in: .leading)
        }
    }
    
    @IBAction func addSafari(_ sender: ImportButton) {
        if secondRow.views.contains(safariBtn) {
            secondRow.removeView(safariBtn)
        } else {
            secondRow.addView(safariBtn, in: .leading)
        }
    }
    @IBAction func addFirefox(_ sender: ImportButton) {
        if secondRow.views.contains(firefoxBtn) {
            secondRow.removeView(firefoxBtn)
        } else {
            secondRow.addView(firefoxBtn, in: .leading)
        }
    }
    @IBAction func addLocal(_ sender: ImportButton) {
        if secondRow.views.contains(localBtn) {
            secondRow.removeView(localBtn)
        } else {
            secondRow.addView(localBtn, in: .leading)
        }
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

