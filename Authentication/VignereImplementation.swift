//
//  VignereImplementation.swift
//  Authentication
//
//  Created by Raj Aryan on 26/03/23.
//

import Foundation


func vigenereEncrypt(_ plaintext: String, withKey key: String) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    let plaintextLowercased = plaintext.lowercased()
    let keyLowercased = key.lowercased()
    var ciphertext = ""

    var keyIndex = 0
    for char in plaintextLowercased {
        if let letterIndex = letters.firstIndex(of: char) {
            //keychar-> character at keyIndex position
            let keyChar = keyLowercased[keyLowercased.index(keyLowercased.startIndex, offsetBy: keyIndex)]
            //keyletterindex-> position of letter at keychar
            let keyLetterIndex = letters.firstIndex(of: keyChar)!
            
            let shiftedIndex = (letterIndex.utf16Offset(in: letters) + keyLetterIndex.utf16Offset(in: letters)) % 26
            ciphertext.append(letters[letters.index(letters.startIndex, offsetBy: shiftedIndex)])
            keyIndex = (keyIndex + 1) % keyLowercased.count
        } else {
            //other than a, b, c..
            ciphertext.append(char)
        }
    }
    print(ciphertext)
    return ciphertext
}
