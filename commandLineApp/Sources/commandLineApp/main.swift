import Atem

func simulateSwitcher(handler: RespondingMessageHandler) {
	handler.when { (change: ChangePreviewBus) in
		[PreviewBusChanged(to: change.previewBus, mixEffect: change.mixEffect)]
	}
	handler.when{ (change: ChangeProgramBus) in
		[ProgramBusChanged(to: change.programBus, mixEffect: change.mixEffect)]
	}
	handler.when { (change: ChangeTransitionPosition) in
		[
			TransitionPositionChanged(
				to: change.position,
				remainingFrames: 250 - UInt8(change.position/40),
				mixEffect: change.mixEffect
			)
		]
	}
}

let switcher = try Switcher(initializer: simulateSwitcher)
try switcher.channel.wait().closeFuture.wait()
