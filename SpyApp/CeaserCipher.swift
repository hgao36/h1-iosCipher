//  Huawei Gao, 917974036
//  Work Cited: by Axel Ancona Esselmann on 8/30/18.
//  Source: From Class Demo.
//
import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ stext: String, dsecrete: String) -> String?
}

struct CeaserCipher: Cipher {

    //encode using ascii by minus the secret value which user input
    func encode(_ plaintext: String, secret: String) -> String?
    {
        guard let shiftBy = UInt32(secret) else
        {
            return nil
        }
        
        var encoded = ""

        for character in plaintext
        {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    
    
    //decode using ascii by minus the secret value which user input
    func decode(_ stext: String, dsecrete: String) -> String?
    {
        
        guard let shiftBack = UInt32(dsecrete) else
        {
            return nil
        }
        
        var decoded = ""
        
        for char in stext
        {
            let unicode = char.unicodeScalars.first!.value
            let backShiftUnicode = unicode - shiftBack
            let shiftChar = String(UnicodeScalar(UInt8(backShiftUnicode)))
            decoded = decoded + shiftChar
        }
        return decoded
    }
}
