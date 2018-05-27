//
//  SwitcherSimulator.swift
//  AtemSimulator
//
//  Created by Damiaan on 27/05/18.
//  Copyright © 2018 Devian. All rights reserved.
//

import Atem

func simulateSwitcher(handler: RespondingMessageHandler) {
	handler.when { (change: ChangePreviewBus) in
		return [PreviewBusChanged(to: change.previewBus, mixEffect: change.mixEffect)]
	}
	handler.when{ (change: ChangeProgramBus) in
		return [ProgramBusChanged(to: change.programBus, mixEffect: change.mixEffect)]
	}
	handler.when { (change: ChangeTransitionPosition) in
		return [TransitionPositionChanged(
			to: change.position,
			remainingFrames: 250-UInt8(change.position/40),
			mixEffect: change.mixEffect
			)]
	}
}
