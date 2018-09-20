//
//  AlphanumbericCesarCipher.swift
//  SpyApp
//
//  Huawei Gao, 917974036
//  Work Cited: by Axel Ancona Esselmann on 8/30/18.
//  Source: From Class Demo.
//
//  This Cipher Only Takes alphanumeric input (A-Z, a-z and 0-9), or it will prompt user that the input is not valid
//  Output only include charaters A-Z and 0-9.

import Foundation

struct AlphanumericCeasarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String?
    {
        guard let shiftBy = UInt32(secret) else
        {
            return nil
        }
        
        var encoded = ""
        let error = "pls input a valid input"
        
        for character in plaintext.uppercased()
        {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            // ascii 58: to 64@ , skip this part of ascii by shift 7 position to A
            // ascii 90 (which is Z) so shift 43 position back to ascci 48 (which is 0)
            if shiftedUnicode > 57 && shiftedUnicode < 65
            {
                shiftedUnicode = shiftedUnicode + 7
            }
            else if shiftedUnicode > 90
            {
                shiftedUnicode = shiftedUnicode - 43
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            if ((unicode >= 48 && unicode <= 57) || (unicode >= 65 && unicode <= 90) || (unicode >= 97 && unicode <= 122))
            {
                encoded = encoded + shiftedCharacter
            }
            else  //print error msg if the input is not A-Z a-z 0-9
            {
                encoded = error
            }
        }
        return encoded
    }
    
    func decode(_ stext: String, dsecrete: String) -> String?
    {
        
        guard let shiftBack = UInt32(dsecrete) else
        {
            return nil
        }
        
        var decoded = ""
        let error = "pls input a valid input"
        
        for character in stext.uppercased()
        {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBack
            // ascii 58: to 64@ , skip this part of ascii by shift 7 position to A
            // ascii 90 (which is Z) so shift 43 position back to ascci 48 (which is 0)
            if shiftedUnicode > 57 && shiftedUnicode < 65
            {
                shiftedUnicode = shiftedUnicode - 7
            }
            else if shiftedUnicode < 48
            {
                shiftedUnicode = shiftedUnicode + 43
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            if ((unicode >= 48 && unicode <= 57) || (unicode >= 65 && unicode <= 90) || (unicode >= 97 && unicode <= 122))
            {
                decoded = decoded + shiftedCharacter
            }
            else
            {
                decoded = error  //print error msg if the input is not A-Z a-z 0-9
            }
        }
        return decoded
    }
    
}
