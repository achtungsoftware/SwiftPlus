//
//  File.swift
//  
//
//  Created by Julian Gerhards on 24.06.22.
//

import Foundation

public extension Collection {
    subscript(optional index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}
