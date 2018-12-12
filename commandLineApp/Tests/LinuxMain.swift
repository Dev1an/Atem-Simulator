import XCTest

import commandLineAppTests

var tests = [XCTestCaseEntry]()
tests += commandLineAppTests.allTests()
XCTMain(tests)