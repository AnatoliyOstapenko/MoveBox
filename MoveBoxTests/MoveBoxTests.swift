//
//  MoveBoxTests.swift
//  MoveBoxTests
//
//  Created by AnatoliiOstapenko on 16.07.2022.
//

import XCTest
@testable import MoveBox

class MoveBoxTests: XCTestCase {
    
    var sut = TDDVC()

    override func setUp(){
       super.setUp()
        sut = TDDVC()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testSetVolumeBelowZero() {
        sut.setVolume(value: -1000)
        
        
        let volume = sut.volume
        XCTAssert(volume == 0, "Lowest value should be 0")
    }
    
    func testSetVolumeAboveThousend() {
        sut.setVolume(value: 101)
        
        let volume = sut.volume
        XCTAssert(volume == 99, "Highest value should be 100")
    }
    
    func testCharacterCompareSuccess() {
        // Arrange
        let firstString = "qwerty"
        let secondString = "wqreyt"
        
        // Act
        let result = sut.characterCompare(firstString: firstString, secondString: secondString)
        
        // Assert
        XCTAssert(result, "Characters should be equal")
        
    }
    
    func testCharacterCompareFailed() {
        // Arrange
        let firstString = "1234"
        let secondString = "fghjk"
        
        // Act
        let result = sut.characterCompare(firstString: firstString, secondString: secondString)
        
        // Assert
        XCTAssert(!result, "Characters are not allowed to be equal")
    }

    

}
