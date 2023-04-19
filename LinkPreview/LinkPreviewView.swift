//
//  LinkPreviewView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import SwiftUI

struct LinkPreviewView: View {
    let linkDataFetcher: LinkDataFetcher
    
        
    @State private var linkTitle: String? = nil
    @State private var linkContent = ""
    @State private var linkImage: String? = nil
    @State private var linkDescription: String? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let linkImage {
                Text(linkImage)
            }
            if let linkTitle {
                Text(linkTitle)
            }
            if let linkDescription {
                Text(linkDescription)
            }
        }
        .padding()
        .onAppear {
            linkDataFetcher.fetchLinkData(completionBlock: { title, imageURL, description in
                self.linkTitle = title
                self.linkImage = imageURL
                self.linkDescription = description
            })
        }
    }
}

struct LinkPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LinkPreviewView(linkDataFetcher: LinkDataFetcher(link: "https://www.economist.com/special-report/2023/04/14/all-change"))
    }
}
