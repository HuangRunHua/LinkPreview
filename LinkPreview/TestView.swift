//
//  TestView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import SwiftUI

struct TestView: View {
    
    let linkDataFetchers = [
        LinkDataFetcher(link: "https://www.economist.com/special-report/2023/04/14/all-change"),
        LinkDataFetcher(link: "https://www.newscientist.com/article/mg25834340-300-how-i-found-a-new-home-online-at-mastodon-after-giving-up-on-twitter/?utm_term=Autofeed&utm_campaign=echobox&utm_medium=social&utm_source=Twitter#Echobox=1681858978"),
        LinkDataFetcher(link: "https://www.bloomberg.com/news/articles/2023-04-17/chatgpt-can-decode-fed-speak-predict-stock-moves-from-headlines?cmpid=socialflow-twitter-business&utm_campaign=socialflow-organic&utm_content=business&utm_medium=social&utm_source=twitter"),
        LinkDataFetcher(link: "https://www.apple.com.cn")
    ]
    
        
    @State private var linkTitle: String? = nil
    @State private var linkContent = ""
    @State private var linkImage: String? = nil
    @State private var linkDescription: String? = nil
    
        
    var body: some View {
        ScrollView {
            LinkPreviewView(linkDataFetcher: linkDataFetchers[0])
            LinkPreviewView(linkDataFetcher: linkDataFetchers[1])
            LinkPreviewView(linkDataFetcher: linkDataFetchers[2])
            LinkPreviewView(linkDataFetcher: linkDataFetchers[3])
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
