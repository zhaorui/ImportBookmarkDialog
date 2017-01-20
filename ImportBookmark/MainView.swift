//
//  MainView.swift
//  ImportBookmark
//
//  Created by 赵睿 on 19/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class MainView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor.white.set()
        NSBezierPath(roundedRect: dirtyRect, xRadius: 10, yRadius: 10).fill()
        
        NSColor(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1.0).set()
        NSBezierPath.fill(NSMakeRect(0, 293, 600, 1))
    }
    
}
