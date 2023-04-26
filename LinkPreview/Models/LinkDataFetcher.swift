//
//  LinkDataFetcher.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import Foundation
import ImageIO

public class LinkDataFetcher {
    let link: String
    
    init(link: String) {
        self.link = link
    }
    
    func fetchLinkData(completionBlock: @escaping (LinkType, String?, String?, String?, String?, Double?, Double?, String?) -> Void) {
        if let url = URL(string: self.link) {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let error {
                    print(error)
                } else {
                    if let data = data {
                        if let content = String(data: data, encoding: .utf8) {
                            var publisher: String? = nil
                            if let linkPublisher = self.link.findPublisher() {
                                publisher = linkPublisher
                                if linkPublisher != "youtube.com" {
                                    var title: String? = nil
                                    if let linkTitle = content.matchURLContent(match: "property=\"og:title\" content=\"") {
                                        title = String(linkTitle)
                                    }
                                    var imageURLPath: String? = nil
                                    var imageWidth: Double? = nil
                                    var imageHeight: Double? = nil
                                    if let linkImage = content.matchURLContent(match: "property=\"og:image\" content=\"") {
                                        imageURLPath = String(linkImage)
                                        if let imageURLPath = imageURLPath {
                                            if let imageURL = URL(string: imageURLPath) {
                                                if let imageSize = self.sizeOfImage(at: imageURL) {
                                                    imageWidth = imageSize.width
                                                    imageHeight = imageSize.height
                                                }
                                            }
                                        }
                                    }
                                    var description: String? = nil
                                    if let linkDescription = content.matchURLContent(match: "property=\"og:description\" content=\"") {
                                        description = String(linkDescription)
                                    }
                                    completionBlock(.normal, publisher, title, imageURLPath, description, imageWidth, imageHeight, nil)
                                } else {
                                    let youtubeVideoID = self.paraseYouTubeVideoID(at: self.link)
                                    completionBlock(.video, nil, nil, nil, nil, nil, nil, youtubeVideoID)
                                }
                            }
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
    
    private func sizeOfImage(at url: URL) -> CGSize? {
        // with CGImageSource we avoid loading the whole image into memory
        guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else {
            return nil
        }
        
        let propertiesOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, 0, propertiesOptions) as? [CFString: Any] else {
            return nil
        }
        
        if let width = properties[kCGImagePropertyPixelWidth] as? CGFloat,
           let height = properties[kCGImagePropertyPixelHeight] as? CGFloat {
            return CGSize(width: width, height: height)
        } else {
            return nil
        }
    }
    
    private func paraseYouTubeVideoID(at link: String) -> String? {
        if let equalIndex = link.firstIndex(of: "=") {
            return String(link[link.index(equalIndex, offsetBy: 1)..<link.endIndex])
        }
        return nil
    }
}

