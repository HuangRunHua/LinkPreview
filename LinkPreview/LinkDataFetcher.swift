//
//  LinkDataFetcher.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import Foundation


class LinkDataFetcher {
    let link: String
    
    init(link: String) {
        self.link = link
    }
    
    func fetchLinkData(completionBlock: @escaping (String?, String?, String?) -> Void) {
        if let url = URL(string: self.link) {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let error {
                    print(error)
                } else {
                    if let data = data {
                        if let content = String(data: data, encoding: .utf8) {
                            print(content)
                            var title: String? = nil
                            if let linkTitle = content.matchURLContent(match: "<meta property=\"og:title\" content=\"") {
                                print("linkTitle = ", linkTitle)
//                                title = String(linkTitle.dropLast(2))
                                title = String(linkTitle)
                            }
                            var imageURL: String? = nil
                            if let linkImage = content.matchURLContent(match: "<meta property=\"og:image\" content=\"") {
//                                imageURL = String(linkImage.dropLast(2))
                                imageURL = String(linkImage)
                            }
                            var description: String? = nil
                            if let linkDescription = content.matchURLContent(match: "<meta property=\"og:description\" content=\"") {
//                                description = String(linkDescription.dropLast(2))
                                description = String(linkDescription)
                            }
                            completionBlock(title, imageURL, description)
                        } else {
                            print("No Content Found")
                        }
                    } else {
                        print("No Data Found")
                    }
                }
            }
            task.resume()
        } else {
            print("Invalid link")
        }
    }
}

extension String {
    public func matchURLContent(match string: String) -> String? {
        if let linkTitleRange = self.range(of: string) {
            var endIndexCount = 0
            var content = ""
            while self[self.index(linkTitleRange.upperBound, offsetBy: endIndexCount)] != ">" {
                content += String(self[self.index(linkTitleRange.upperBound, offsetBy: endIndexCount)])
                endIndexCount += 1
            }
            return content
        }
        return nil
    }
}
