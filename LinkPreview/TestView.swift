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
        LinkDataFetcher(link: "https://www.bbc.com/news/world-middle-east-65322821?xtor=AL-72-%5Bpartner%5D-%5Bbbc.news.twitter%5D-%5Bheadline%5D-%5Bnews%5D-%5Bbizdev%5D-%5Bisapi%5D&at_link_id=AE691BAE-DECD-11ED-A6F6-36B779448730&at_bbc_team=editorial&at_campaign=Social_Flow&at_campaign_type=owned&at_format=link&at_ptr_name=twitter&at_link_type=web_link&at_medium=social&at_link_origin=BBCWorld"),
        LinkDataFetcher(link: "https://www.bloomberg.com/news/articles/2023-04-17/chatgpt-can-decode-fed-speak-predict-stock-moves-from-headlines?cmpid=socialflow-twitter-business&utm_campaign=socialflow-organic&utm_content=business&utm_medium=social&utm_source=twitter"),
        LinkDataFetcher(link: "https://www.apple.com.cn"),
        LinkDataFetcher(link: "https://www.nytimes.com/2023/04/19/world/asia/india-china-population.html"),
        LinkDataFetcher(link: "https://huangrunhua.github.io/2022/09/02/Share-Core-Data-with-App-Extension/"),
        LinkDataFetcher(link: "https://www.nationalgeographic.com/environment/article/candida-auris-deadly-fungus-climate-change?cmpid=org=ngp::mc=social::src=twitter::cmp=editorial::add=tw20230416env-candidaaurisfungus&linkId=210633808"),
        LinkDataFetcher(link: "https://www.ft.com/content/438fa6de-92f8-4d41-a169-c7e9ecada1bd"),
        LinkDataFetcher(link: "https://www.netflix.com/jp/?twclid=2-3xgfde4nnrqtig6qz7fpurdmu"),
        LinkDataFetcher(link: "https://keith-mcnulty.medium.com/heres-how-two-new-orleans-teenagers-found-a-new-proof-of-the-pythagorean-theorem-b4f6e7e9ea2d"),
        LinkDataFetcher(link: "https://stackoverflow.com/questions/64530437/how-to-change-the-padding-above-and-below-a-swiftui-divider"),
        LinkDataFetcher(link: "https://www.youtube.com/watch?v=e3s7pDTp_Lo")
    ]
    
        
    @State private var linkTitle: String? = nil
    @State private var linkContent = ""
    @State private var linkImage: String? = nil
    @State private var linkDescription: String? = nil
    
        
    var body: some View {
        ScrollView {
//            HStack {
//                Text("There")
//                    .padding(.leading)
//                LinkPreviewView(linkDataFetcher: linkDataFetchers[0])
//            }
//
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[1])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[2])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[3])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[4])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[5])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[6])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[7])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[8])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[9])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[10])
//            LinkPreviewView(linkDataFetcher: linkDataFetchers[11])
            LinkPreviewView(linkDataFetcher: linkDataFetchers[12])
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
