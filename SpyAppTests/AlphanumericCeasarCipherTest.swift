//
//  AlphanumericCeasarCipherTest.swift
//  SpyAppTests
//
//  Created by huawei Gao on 9/20/18.
//  

import XCTest
@testable import SpyApp
class AlphanumericCeasarCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp()
    {
        super.setUp()
        cipher = AlphanumericCeasarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret()
    {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext.uppercased(), result)
    }
    //encode with secret 1, Z -> 0
    func test_oneCharacterString_Z_getsMappedTo_0_with_1_secrete_encode()
    {
        let plaintext = "Z"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("0", result)
    }
    //decode with secret 1, 0 -> Z
    func test_oneCharacterString_Z_getsMappedTo_0_with_1_secrete_decode()
    {
        let plaintext = "0"
        let result = cipher.decode(plaintext, dsecrete: "1")
        XCTAssertEqual("Z", result)
    }
    
    func test_nonNumericInputForSecret()
    {
        let result = cipher.encode("a", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }

    
}
