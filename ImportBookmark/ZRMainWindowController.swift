//
//  ZRMainWindowController.swift
//  ImportBookmark
//
//  Created by 赵睿 on 19/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ZRMainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.isMovableByWindowBackground = true
        window?.isReleasedWhenClosed = false
        window?.isOpaque = false
        window?.backgroundColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0)
        (NSApp.delegate as! AppDelegate).window_controller = self
    }

}
