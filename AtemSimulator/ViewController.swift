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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setSwitchOn()
		changePowerState(self)
	}

	@IBAction func changePowerState(_ sender: Any) {
		if onButton.state == .on {
			do {
				switcher = try Switcher(initializer: simulateSwitcher)
			} catch {
				presentError(error)
				setSwitchOff()
			}
		} else {
			switcher?.channel.map{ $0.close(mode: .all) }.whenFailure { error in
				DispatchQueue.main.async {
					self.presentError(error)
				}
				self.setSwitchOn()
			}
		}
	}
	
	func setSwitchOn() {
		onButton.state = .on
		offButton.state = .off
	}
	
	func setSwitchOff() {
		onButton.state = .off
		offButton.state = .on
	}
}

class WindowController: NSWindowController {
	
	var controller: Controller?
	override func windowDidLoad() {
		super.windowDidLoad()
		controller = try? Controller(ipAddress: "0.0.0.0") { handler in
			handler.when{ (change: PreviewBusChanged) in
				print(change)
			}
			handler.when { (change: NewTimecode) in
				print(change)
			}
		}
	}

	@IBAction func moveLever(_ sender: NSSlider) {
		controller?.send(message: ChangeTransitionPosition(to: UInt16(sender.intValue)))
	}
}
