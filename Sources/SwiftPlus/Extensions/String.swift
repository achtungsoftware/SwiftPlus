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

#if canImport(CryptoKit)
import CryptoKit
#endif

public extension String {
    
    /// Trims a String
    /// - Returns: Trimmed String
    func trim(_ what: CharacterSet = .whitespacesAndNewlines) -> String {
        return self.trimmingCharacters(in: what)
    }
    
    /// Encodes a string for a URL Parameter
    /// - Returns: The encoded String
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? ""
    }
    
#if canImport(CryptoKit)
    /// Get MD5 Hash from String
    @available(iOS 13.0, macOS 10.15, *)
    var md5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
#endif
    
#if os(iOS)
    /// Searches for Links in String
    /// - Returns: Dictionary of LinkString: NSRange
    func getLinks() -> [String: NSRange]{
        let types: NSTextCheckingResult.CheckingType = .link
        var links: [String: NSRange] = [:]
        do {
            let detector = try NSDataDetector(types: types.rawValue)
            let matches = detector.matches(in: self, options: .reportCompletion, range: NSMakeRange(0, self.utf16.count))
            for match in matches {
                links[NSString(string: self).substring(with: match.range) as String] = NSRange(location:match.range.location, length: match.range.length)
            }
            return links
        } catch {
            return [:]
        }
    }
#endif
    
    /// Searches for Hashtags in String
    /// - Returns: Dictionary of HashtagString: NSRange
    func getHashtags() -> [String: NSRange] {
        var hashtags:[String: NSRange] = [:]
        let regex = try? NSRegularExpression(pattern: "[#]\\w\\S*\\b", options: [])
        if let matches = regex?.matches(in: self, options:[], range: NSMakeRange(0, self.utf16.count)) {
            for match in matches {
                hashtags[NSString(string: self).substring(with: NSRange(location:match.range.location, length: match.range.length))] = NSRange(location:match.range.location, length: match.range.length)
            }
        }
        
        return hashtags
    }
    
    /// Searches for Mentions in String
    /// - Returns: Dictionary of MentionString: NSRange
    func getMentions() -> [String: NSRange] {
        var mentions:[String: NSRange] = [:]
        let regex = try? NSRegularExpression(pattern: "[@]\\w\\S*\\b", options: [])
        if let matches = regex?.matches(in: self, options:[], range: NSMakeRange(0, self.utf16.count)) {
            for match in matches {
                mentions[NSString(string: self).substring(with: NSRange(location:match.range.location, length: match.range.length))] = NSRange(location:match.range.location, length: match.range.length)
            }
        }
        
        return mentions
    }
    
    /// Returns true if `String` is only a single emoji
    @available(macOS 10.12.2, iOS 10.2, *)
    var isSingleEmoji: Bool { count == 1 && containsEmoji }
    
    /// Returns true if `String` contains at least one emoji
    @available(macOS 10.12.2, iOS 10.2, *)
    var containsEmoji: Bool { contains { $0.isEmoji } }
    
    /// Returns true if `String` contains only emoji´s
    @available(macOS 10.12.2, iOS 10.2, *)
    var containsOnlyEmoji: Bool { !isEmpty && !contains { !$0.isEmoji } }
    
    @available(macOS 10.12.2, iOS 10.2, *)
    var emojiString: String { emojis.map { String($0) }.reduce("", +) }
    
    @available(macOS 10.12.2, iOS 10.2, *)
    var emojis: [Character] { filter { $0.isEmoji } }
    
    @available(macOS 10.12.2, iOS 10.2, *)
    var emojiScalars: [UnicodeScalar] { filter { $0.isEmoji }.flatMap { $0.unicodeScalars } }
}
