//  Copyright © 2021 - present Julian Gerhards
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  GitHub https://github.com/knoggl/SwiftPlus
//

import Foundation

public extension Collection where Iterator.Element: Identifiable {
    
    /// Try's to find an `Identifiable` item with the given id
    /// - Parameter id: The `Hashable` id to search for
    /// - Returns: Returns the first `Element` with the matching id or `nil`
    func item<T: Hashable>(byId id: T) -> Element? {
        for element in self {
            if element.id as! T == id {
                return element
            }
        }
        
        return nil
    }
    
    /// Returns true if the `Collection` contains at least one `Element` with the given id
    /// - Parameter id: The `Hashable` id to search for
    /// - Returns: `true` if `Collection` contains an `Element` with the given id, `false` if not
    func contains<T: Hashable>(id: T) -> Bool {
        for element in self {
            if element.id as! T == id {
                return true
            }
        }
        
        return false
    }
}
