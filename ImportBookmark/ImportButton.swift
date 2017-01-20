//
//  ImportButton.swift
//  ImportBookmark
//
//  Created by 赵睿 on 19/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ImportButton: NSButton {

    var mouseInButton = false
    
    init(frame frameRect: NSRect, withImage image: NSImage) {
        super.init(frame: frameRect)
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

    }
    
    override func mouseEntered(with event: NSEvent) {
        mouseInButton = true
        self.needsDisplay = true
        
    }
    
    override func mouseExited(with event: NSEvent) {
        mouseInButton = false
        self.needsDisplay = true
    }
    
    override func viewDidMoveToWindow() {
        
        let dstImage = NSImage(size: NSSize(width: 60, height: 60))
        dstImage.lockFocus()
        self.image?.draw(in: NSMakeRect(0, 0, dstImage.size.width, dstImage.size.height))
        dstImage.unlockFocus()
        self.image = dstImage
        
        addTrackingRect(self.bounds, owner: self, userData: nil, assumeInside: false)
        self.layer?.cornerRadius = 20
        self.layer?.borderWidth = 5
        self.layer?.borderColor = NSColor.white.cgColor
        (self.cell as? NSButtonCell)?.showsBorderOnlyWhileMouseInside = true
    }
    
    override var wantsUpdateLayer: Bool {
        return true
    }

    override func updateLayer() {
        
        if mouseInButton {
            self.layer?.backgroundColor = NSColor.gray.cgColor
        } else {
            self.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
    func setFixedConstraint(width: Float, height: Float) {
        let fixedWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 108)
        let fixedHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 130)
        self.addConstraints([fixedWidth, fixedHeight])
    }
    
}

class ImportButtonCell: NSButtonCell {
    
    //override func drawBezel(withFrame frame: NSRect, in controlView: NSView) {
    //    NSColor.red.set()
    //    NSBezierPath(roundedRect: frame, xRadius: 5, yRadius: 5).fill()
    //}
    
    //override func drawImage(_ image: NSImage, withFrame frame: NSRect, in controlView: NSView) {
        //super.drawImage(image, withFrame: NSInsetRect(frame, 30, 30), in: controlView)
    //}
}
