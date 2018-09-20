//
//  CustomCipher1.swift
//  SpyApp
//
//  Huawei Gao, 917974036
//  
//  This cipher will change A to BC, B to CD, D to EF and so on.
//    it will convert all the input characters to Uppercases letter.
//  The valid characters are english letters A-Z a-z
//  All letters will separate by "."
//  Example
//    Input: ABC        -> Encode ->  BC.CD.DE.
//    Input: BC.CD.DE   -> Decode ->  ABC
import Foundation

extension Dictionary where Value: Equatable {
    func findKey(forValue keyValue: Value) -> Key? {
        return first(where: { $1 == keyValue })?.key
    }
}

struct CustomCipher1: Cipher
{
    var cipherDict: [String: String] = ["A": "BC", "B": "CD", "C": "DE",
                                 "D": "EF", "E": "FG", "F": "GH",
                                 "G": "HI", "H": "IJ", "I": "JK",
                                 "J": "KL", "K": "LM", "L": "MN",
                                 "M": "NO", "N": "OP", "O": "PQ",
                                 "P": "QR", "Q": "RS", "R": "ST",
                                 "S": "TU", "T": "UV", "U": "VW",
                                 "V": "WX", "W": "XY", "X": "YZ",
                                 "Y": "ZA", "Z": "AB"]
    
    func encode(_ plaintext: String, secret: String) -> String?
    {
        var encoded = ""
        for encodeLetters in plaintext.uppercased()
        {
            if  let encodeletter = cipherDict[String(encodeLetters)]
            {
                encoded = encoded + encodeletter + "."
            }else
            {
                encoded = encoded + "please intput a valid letter"
            }
            
        }
        return encoded
    }
    func decode(_ stext: String, dsecrete: String) -> String?
    {
        let value = stext.components(separatedBy: ".")
        var decoded = ""
        
        for secretecode in value
        {
            if  let secreteletter = cipherDict.findKey(forValue: secretecode)
            {
                decoded = decoded + secreteletter
            }else
            {
                decoded = decoded + "please input a valid secrete code"
            }
        }
        return decoded
    }
}
