//
//  ImportButton.swift
//  ImportBookmark
//
//  Created by 赵睿 on 19/01/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ImportButton: NSButton {

    private var mouseInButton = false
    private let button_image_rect = NSMakeRect(24, 24, 60, 60)
    private let button_title_rect = NSMakeRect(0, 100, 108, 20)
    
    var btnImage: NSImage?
    var btnTitle: String?
    
    init(frame frameRect: NSRect, withImage image: NSImage, withTitle title: String) {
        super.init(frame: frameRect)
        self.btnImage = image
        self.btnTitle = title
        self.title = ""
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.btnImage = image
        self.image = nil
        self.btnTitle = title
        self.title = ""
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
        let dstImage = NSImage(size: button_image_rect.size)
        dstImage.lockFocus()
        self.btnImage?.draw(in: NSMakeRect(0, 0, dstImage.size.width, dstImage.size.height))
        dstImage.unlockFocus()
        
        let image_layer = CALayer()
        image_layer.contents = dstImage
        image_layer.frame = button_image_rect
        
        let title_layer = CATextLayer()
        title_layer.contentsScale = 2
        title_layer.string = btnTitle
        title_layer.alignmentMode = kCAAlignmentCenter
        title_layer.font = "Helvetica" as CFTypeRef?
        title_layer.fontSize = 14
        title_layer.foregroundColor = NSColor.black.cgColor
        title_layer.frame = button_title_rect
        
        self.layer?.addSublayer(image_layer)
        self.layer?.addSublayer(title_layer)
        
        self.layer?.cornerRadius = 20
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.white.cgColor
        addTrackingRect(self.bounds, owner: self, userData: nil, assumeInside: false)
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
