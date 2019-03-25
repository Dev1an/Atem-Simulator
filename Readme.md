# Atem simulation tool

Simulates an ATEM Television Studio and enables the desktop application so you can peek around in the app and aren't stuck in the `No Device Connected` window. Written using [Swift-Atem](https://github.com/Dev1an/Swift-Atem)

![Application preview](preview.gif)

This tool does not simulate the entire functionality of the Television studio but it keeps the connection alive so you can browse and discover the application...

## Installation

### Prerequisites

- Xcode (available from the Mac App Store)
- ATEM Software Control

### Run the command line app

```
cd commmandLineApp
swift run
```

### Build the macOS app

Make sure to pull all the submodules first:

```
git submodule update --init --recursive
```

Then:

```
cd Protocol
swift package generate-xcodeproj
open ../AtemSimulator.xcodeproj
```

### Run the macOS app

Select the macOS target an click the run button.