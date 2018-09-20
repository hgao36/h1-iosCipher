//  Huawei Gao, 917974036
//  Work Cited: by Axel Ancona Esselmann on 8/30/18.
//  Source: From Class Demo.
//
import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase
{

    var cipher: Cipher!

    override func setUp()
    {
        super.setUp()
        cipher = CeaserCipher()
    }

    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret()
    {
        let plaintext = "a"

        let result = cipher.encode(plaintext, secret: "0")

        XCTAssertEqual(plaintext, result)
    }

    func test_nonNumericInputForSecret()
    {
        let result = cipher.encode("b", secret: "nonNumericString")

        XCTAssertNil(result)
    }


}
