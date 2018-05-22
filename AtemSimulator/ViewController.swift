//
//  ViewController.swift
//  AtemSimulator
//
//  Created by Damiaan on 22/05/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Cocoa
import Atem

class ViewController: NSViewController {
	
	@IBOutlet weak var onButton: NSButton!
	@IBOutlet weak var offButton: NSButton!
	
	var switcher: Switcher?

	@IBAction func changePowerState(_ sender: Any) {
		if onButton.state == .on {
			do {
				switcher = try Switcher()
			} catch {
				presentError(error)
				setSwitchOff()
			}
		} else {
			switcher?.channel.map{ $0.close(mode: .all) }.whenFailure { error in
				self.presentError(error)
				self.setSwitchOn()
			}
		}
	}
	
	func setSwitchOff() {
		onButton.state = .on
		offButton.state = .off
	}
	
	func setSwitchOn() {
		onButton.state = .off
		offButton.state = .on
	}
}

