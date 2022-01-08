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

public extension Double {
    
    /// Rounds a `Double`
    /// - Parameter places: To how many places after the comma should be rounded?
    /// - Returns: The rounded `Double`
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// Clamps a `Double` to a max value
    /// - Parameter max: The maximal allowed value for this `Double`
    /// - Returns: The `Double` with the specified maximum value
    func maxValue(_ max: Double) -> Double {
        if(self > max) {
            return max
        }else {
            return self
        }
    }
    
    /// Clamps a `Double` to a min value
    /// - Parameter min: The minimal allowed value for this `Double`
    /// - Returns: The `Double` with the specified minimum value
    func minValue(_ min: Double) -> Double {
        if(self < min) {
            return min
        }else {
            return self
        }
    }
    
    
    /// Checks if the `Double` number is a whole number
    /// - Returns: `true` if whole number `false` if not
    func isWhole() -> Bool {
        self.truncatingRemainder(dividingBy: 1) == 0
    }
    
    /// Returns a `String` representation of a `Double`.
    /// If the `Double` is a whole number it will return without ".", else with
    var stringRepresentation: String {
        return self.isWhole() ? String(Int(self)) : String(self)
    }
}
