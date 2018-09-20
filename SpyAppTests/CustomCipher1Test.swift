//
//  CustomCipher1Test.swift
//  SpyAppTests
//
//  Created by huawei Gao on 9/20/18.
//

import XCTest
@testable import SpyApp

class CustomCipher1Test: XCTestCase {
    var cipher: Cipher!

    override func setUp()
    {
        super.setUp()
        cipher = CustomCipher1()
    }
    
    //encode with no secret needed A to BC.
    func testLetterAEncodeWithNoSecret()
    {
        let plaintext = "A"
        let result = cipher.encode(plaintext, secret: " ")
        XCTAssertEqual("BC.", result)
    }
    //decode with no secret needed BC to A
    func testDecodeWithNoSecret()
    {
        let plaintext = "BC"
        let result = cipher.decode(plaintext, dsecrete: " ")
        XCTAssertEqual("A", result)
    }
    
    //test encode ABC -> BC.CD.DE.
    func testEncodeABCWithNoSecret()
    {
        let plaintext = "ABC"
        let result = cipher.encode(plaintext, secret: " ")
        XCTAssertEqual("BC.CD.DE.", result)
    }
    
    //test decode BC.CD.DE -> ABC
    func testDecodeBCCDDEWithNoSecret()
    {
        let plaintext = "BC.CD.DE"
        let result = cipher.decode(plaintext, dsecrete: " ")
        XCTAssertEqual("ABC", result)
    }
    
}
