//
//  File.swift
//  
//
//  Created by Julian Gerhards on 09.06.22.
//

import Foundation

public extension Character {
    /// A simple emoji is one scalar and presented to the user as an Emoji
    @available(iOS 10.2, *)
    var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else { return false }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }

    /// Checks if the scalars will be merged into an emoji
    @available(iOS 10.2, *)
    var isCombinedIntoEmoji: Bool { unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false }

    @available(iOS 10.2, *)
    var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
}
