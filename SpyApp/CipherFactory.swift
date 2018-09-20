//  Huawei Gao, 917974036
//  Work Cited: by Axel Ancona Esselmann on 8/30/18.
//  Source: From Class Demo.
//
import Foundation

struct CipherFactory
{
    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "ANC": AlphanumericCeasarCipher() as Cipher,
        "CustomC1": CustomCipher1 () as Cipher,
        "ANC-D": AlphanumericCeasarCipherDouble() as Cipher
    ]

    func cipher(for key: String) -> Cipher
    {
        return ciphers[key]!
    }
}
