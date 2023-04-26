//
//  StringExtension.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/26/23.
//

import Foundation

extension String {
    public func matchURLContent(match string: String) -> String? {
        if let linkTitleRange = self.range(of: string) {
            var endIndexCount = 0
            var content = ""
            while self[self.index(linkTitleRange.upperBound, offsetBy: endIndexCount)] != ">" {
                content += String(self[self.index(linkTitleRange.upperBound, offsetBy: endIndexCount)])
                endIndexCount += 1
            }
            if let matchedIndex = content.findLastIndex(match: "\"") {
                return String(content.dropLast(matchedIndex+1))
            }
        }
        return nil
    }
    
    public func findLastIndex(match char: String) -> Int? {
        var matchedIndex: Int = 0
        var foundMatchedIndex: Bool = false
        for i in self.reversed() {
            if String(i) == char {
                foundMatchedIndex = true
                break
            } else {
                matchedIndex += 1
            }
        }
        
        if foundMatchedIndex {
            return matchedIndex
        } else {
            return nil
        }
    }
    public func findPublisher() -> String? {
        // Here we assume the link would be like:
        //  1. http(s)://(www.)publisher.com/xxxxxx
        //  2. http(s)://(www.)publisher.com
        if let colonIndex = self.firstIndex(of: ":") {
            let subLink = self[self.index(colonIndex, offsetBy: 3)..<endIndex]
            // For links that contain `www.` we eliminate the prefix.
            if subLink.starts(with: "www.") {
                if let firstDotIndex = subLink.firstIndex(of: ".") {
                    if let firstSlashIndex = subLink.firstIndex(of: "/") {
                        return String(subLink[subLink.index(firstDotIndex, offsetBy: 1)..<firstSlashIndex])
                    } else {
                        return String(subLink[subLink.index(firstDotIndex, offsetBy: 1)..<subLink.endIndex])
                    }
                }
            } else {
                if let firstSlashIndex = subLink.firstIndex(of: "/") {
                    return String(subLink[subLink.startIndex..<firstSlashIndex])
                } else {
                    return String(subLink)
                }
            }
        }
        
        return nil
    }
    
    
}
