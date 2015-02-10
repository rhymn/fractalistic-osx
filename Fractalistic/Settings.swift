//
//  File.swift
//  MadLibs
//
//  Created by David Jørgensen on 2015-02-08.
//
//

import Foundation

class Settings {
    
    var data: String
    
    init(data: String){
        self.data = data
    }
    
    subscript(word: String) -> String {
        get {
            if let json = self.jsonValue(self.data, word: word){
                return json
            }
            
            return ""
        }
        
        
    }
    
    func jsonValue(string: String, word: String) -> String? {
        
        println(string)
        
        // This is the string
        var str = string
        
        // Find position of the word
        if let wordPos = str.rangeOfString("\(word)\""){
            str = str.substringFromIndex(wordPos.endIndex) // Create a new string from that
        }
        else{
            return nil
        }
        
        // Find position of the value after word
        if let valuePos = str.rangeOfString("\""){
            str = str.substringFromIndex(valuePos.startIndex) // Create a new string from that
        }
        else{
            return nil
        }
        
        // Find position of begin
        let beginPos = advance(str.startIndex, 1)
        str = str.substringFromIndex(beginPos) // Create a new string from that
        
        
        // Find position of end
        if let endPos = str.rangeOfString("\""){
            str = str.substringToIndex(endPos.startIndex) // Create a new string from that
        }
        else{
            return nil
        }
        
        return str
    }
}