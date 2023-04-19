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
    @State private var imageWidth: Double? = nil
    @State private var imageHeight: Double? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let linkImage = linkImage, let imageWidth = imageWidth, let imageHeight = imageHeight {
                AsyncImage(url: URL(string: linkImage)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(imageWidth/imageHeight, contentMode: .fit)
                    case .empty, .failure:
                        Rectangle()
                            .aspectRatio(imageWidth/imageHeight, contentMode: .fit)
                            .foregroundColor(.secondary)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                if let linkTitle {
                    Text(linkTitle)
                        .lineLimit(1)
                        .padding([.leading, .trailing])
                }
                if let linkDescription {
                    Text(linkDescription)
                        .foregroundColor(.descriptionFontColor)
                        .padding([.leading, .trailing])
                        .lineLimit(2)
                }
            }
            .padding([.top, .bottom])
            .background(Color.linkBackgroundColor)
            
        }
        .border(Color.boundColor)
        .cornerRadius(10)
        .padding()
        .onAppear {
            linkDataFetcher.fetchLinkData(completionBlock: { title, imageURL, description, imageWidth, imageHeight in
                self.linkTitle = title
                self.linkImage = imageURL
                self.linkDescription = description
                self.imageWidth = imageWidth
                self.imageHeight = imageHeight
            })
        }
    }
}

struct LinkPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LinkPreviewView(linkDataFetcher: LinkDataFetcher(link: "https://www.economist.com/leaders/2023/04/13/the-lessons-from-americas-astonishing-economic-record"))
    }
}
