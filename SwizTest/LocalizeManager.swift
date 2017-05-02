//
//  LocalizeManager.swift
//  SwizTest
//
//  Created by Andart on 02.05.17.
//  Copyright © 2017 Andart. All rights reserved.
//

import Foundation

func localize(_ key: String) -> String {
    return LocalizeManager.shared.localize(key)
}

class LocalizeManager {
    static let shared = LocalizeManager()
    
    func localize(_ key: String) -> String {
        let s = NSLocalizedString(key, comment: "")
        
        if s.characters.count == 0 {
            return key
        }
        
        return s
    }
}
