//
//  AnneGeoKitTests.swift
//  AnneGeoKitTests
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import XCTest
@testable import AnneGeoKit

class AnneGeoKitTests: XCTestCase {
    
    var sut: VM!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.sut = VM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.sut = nil
    }
    
    func testSum(){
        let a = 10
        let b = 29
        
        let result = self.sut.sum(a: a, b: b)
        
        XCTAssertEqual(result, 40)
    }
}
