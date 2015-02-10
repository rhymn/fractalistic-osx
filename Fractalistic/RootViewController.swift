//
//  RootViewController.swift
//  Fractalistic
//
//  Created by David Jørgensen on 2015-02-10.
//  Copyright (c) 2015 David Jørgensen. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {

    @IBOutlet weak var temperature: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
                
        var settingsRepository = SettingsRepository()
        
        settingsRepository.retrieve({
            (data: Settings) -> () in
                let temp = data["temp"]
                self.temperature.stringValue = "\(temp)°"
        })
        
    }
    
    override func awakeFromNib() {
        println("View controller instance with view: \(self.view)")
    }
    
}
