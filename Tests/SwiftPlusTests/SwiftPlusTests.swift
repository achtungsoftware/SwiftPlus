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

import XCTest
@testable import SwiftPlus

final class SwiftPlusTests: XCTestCase {
    
    struct Model: Identifiable, Equatable {
        let id: String
        let name: String
    }
    
    func test_double_extensions() throws {
        let double: Double = 1.494
        
        XCTAssertEqual(double.round(to: 2), 1.49)
        XCTAssertEqual(double.maxValue(1.4), 1.4)
        XCTAssertEqual(double.minValue(4.0), 4.0)
    }
    
    func test_cgfloat_extensions() throws {
        let cgFloat: CGFloat = 1.494
        
        XCTAssertEqual(cgFloat.round(to: 2), 1.49)
        XCTAssertEqual(cgFloat.maxValue(1.4), 1.4)
        XCTAssertEqual(cgFloat.minValue(4.0), 4.0)
    }
    
    func test_string_extensions() throws {
        let string: String = " Hallo, mein #Name ist @String. Ich bin ein Swift-Typ. "
        
        XCTAssertEqual(string.trim(), "Hallo, mein #Name ist @String. Ich bin ein Swift-Typ.")
        XCTAssertEqual(string.getHashtags(), ["#Name": NSRange(location: 13, length: 5)])
        XCTAssertEqual(string.getMentions(), ["@String": NSRange(location: 23, length: 7)])
        
        XCTAssertEqual("☺️ Test".containsEmoji, true)
        XCTAssertEqual("☺️ Test".containsOnlyEmoji, false)
        XCTAssertEqual("☺️☺️".containsOnlyEmoji, true)
        XCTAssertEqual("☺️".isSingleEmoji, true)
    }
    
    func test_collection_extensions() throws {
        let array: Array<Model> = [
            .init(id: "32", name: "Julian"),
            .init(id: "34", name: "Marie"),
            .init(id: "52", name: "Joshua"),
            .init(id: "1", name: "Sylvia"),
            .init(id: "3", name: "Katharina"),
            .init(id: "3884", name: "Arwin"),
        ]
        
        XCTAssertEqual(array[optional: 0], array[0])
        XCTAssertEqual(array[optional: 1], array[1])
        XCTAssertEqual(array[optional: 35], nil)
        XCTAssertEqual(array[optional: 24342], nil)
        
        XCTAssertTrue(array.contains(id: "32"))
        XCTAssertTrue(array.contains(id: "34"))
        XCTAssertTrue(array.contains(id: "52"))
        XCTAssertTrue(array.contains(id: "1"))
        XCTAssertTrue(array.contains(id: "3"))
        XCTAssertTrue(array.contains(id: "3884"))
        
        XCTAssertFalse(array.contains(id: "432"))
        XCTAssertFalse(array.contains(id: "534253"))
        
        XCTAssertEqual(array.item(byId: "32"), array[0])
        XCTAssertEqual(array.item(byId: "34"), array[1])
        XCTAssertEqual(array.item(byId: "52"), array[2])
        XCTAssertEqual(array.item(byId: "1"), array[3])
        XCTAssertEqual(array.item(byId: "3"), array[4])
        XCTAssertEqual(array.item(byId: "3884"), array[5])
    }
}
