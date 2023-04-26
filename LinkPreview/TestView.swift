//
//  TestView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import SwiftUI

struct TestView: View {
    
    @Environment(\.openURL) var openURL
    
    let linkDataFetchers = [
        LinkDataFetcher(link: "https://www.youtube.com/watch?v=ANn9ibNo9SQ"),
        LinkDataFetcher(link: "https://www.economist.com/special-report/2023/04/14/all-change"),
        LinkDataFetcher(link: "https://www.newscientist.com/article/mg25834340-300-how-i-found-a-new-home-online-at-mastodon-after-giving-up-on-twitter/?utm_term=Autofeed&utm_campaign=echobox&utm_medium=social&utm_source=Twitter#Echobox=1681858978"),
        LinkDataFetcher(link: "https://github.com/HuangRunHua/LinkPreview"),
        LinkDataFetcher(link: "https://www.bloomberg.com/news/articles/2023-04-17/chatgpt-can-decode-fed-speak-predict-stock-moves-from-headlines?cmpid=socialflow-twitter-business&utm_campaign=socialflow-organic&utm_content=business&utm_medium=social&utm_source=twitter"),
        LinkDataFetcher(link: "https://www.apple.com.cn"),
        LinkDataFetcher(link: "https://www.nytimes.com/2023/04/19/business/nyt-sullivan-dominion-first-amendment.html"),
    ]
    
        
    @State private var linkTitle: String? = nil
    @State private var linkContent = ""
    @State private var linkImage: String? = nil
    @State private var linkDescription: String? = nil
    
        
    var body: some View {
        ScrollView {
            LinkPreviewView(linkDataFetcher: linkDataFetchers[0])
            
            LinkPreviewView(linkDataFetcher: linkDataFetchers[1],
                            tapAction: openURLAction(linkType:link:publisher:linkTitle:linkDescription:linkImage:youtubeVideoID:))
            
            LinkPreviewView(linkDataFetcher: linkDataFetchers[2])
            
            LinkPreviewView(linkDataFetcher: linkDataFetchers[3]) { _,_,_,_,_, imageURL,_ in
                if let imageURL {
                    print(imageURL)
                }
            }
            
            LinkPreviewView(linkDataFetcher: linkDataFetchers[4]) { _,_,_,title,_,_,_ in
                if let title {
                    print(title)
                }
            }
            
            LinkPreviewView(linkDataFetcher: linkDataFetchers[5]) { linkType, link, publisher, linkTitle, linkDescription, linkImage, youtubeVideoID in
                if let linkDescription {
                    print(linkDescription)
                }
            }
        }
    }
    
    func openURLAction(linkType: LinkType?,
                       link: String,
                       publisher: String?,
                       linkTitle: String?,
                       linkDescription: String?,
                       linkImage: String?,
                       youtubeVideoID: String?) {
        if let url = URL(string: link) {
            openURL(url)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
