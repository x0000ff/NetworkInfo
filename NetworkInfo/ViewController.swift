//
//  ViewController.swift
//  NetworkInfo
//
//  Created by Konstantin Portnov on 9/1/17.
//  Copyright © 2017 Konstantin Portnov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var addressTextFieldCell: NSTextFieldCell!
    @IBOutlet weak var macTextFieldCell: NSTextField!
    @IBOutlet weak var interfacesTextFieldCell: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSApplication.shared().keyWindow?.centercize()
        updateNetworkInformation()
    }

    func updateNetworkInformation() {
        NetworkInformation.shared().refresh()

        let ip = NetworkInformation.shared().primaryIPv4Address ?? ""
        addressTextFieldCell.stringValue = ip
        print("Primary IPv4 Address: \(ip)")
        
        let mac = NetworkInformation.shared().primaryMACAddress ?? ""
        macTextFieldCell.stringValue = mac
        print("Primary MAC Address: \(mac)")
        
        let all: [String] = (NetworkInformation.shared().allInterfaceNames as? [String]) ?? []
        interfacesTextFieldCell.stringValue = all.joined(separator: ", ")
        print("All Interfaces: \(all.debugDescription)")
    }
    
    func copyToClipboard(string: String) {
        
        let pasteBoard = NSPasteboard.general()
        pasteBoard.declareTypes([NSStringPboardType], owner: nil)
        pasteBoard.setString(string, forType: NSStringPboardType)
    }
    
    @IBAction func refresh(_ sender: Any) {
        updateNetworkInformation()
    }
}
