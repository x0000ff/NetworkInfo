//
//  NSWindow+Utils.swift
//  NetworkInfo
//
//  Created by Konstantin Portnov on 9/1/17.
//  Copyright © 2017 Konstantin Portnov. All rights reserved.
//

import Foundation
import Cocoa

extension NSWindow {
    
    func centercize() {
        
        guard let screen = self.screen else {
            return
        }
        
        var frame = self.frame
        frame.origin.x = (screen.visibleFrame.width - frame.width) / 2
        frame.origin.y = (screen.visibleFrame.height - frame.height) / 2
        
        setFrame(frame, display: true)
    }
}
