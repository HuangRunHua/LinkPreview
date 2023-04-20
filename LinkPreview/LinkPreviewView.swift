//
//  LinkPreviewView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/19/23.
//

import SwiftUI

public struct LinkPreviewView: View {
    
    let linkDataFetcher: LinkDataFetcher
    
        
    @State private var linkTitle: String? = nil
    @State private var linkImage: String? = nil
    @State private var linkDescription: String? = nil
    @State private var imageWidth: Double? = nil
    @State private var imageHeight: Double? = nil
    @State private var publisher: String? = nil
    
    // - Parameters:
    //  - original link
    //  - link publisher
    //  - link title
    //  - link description
    //  - link image
    var tapAction: ((_ link: String,
                     _ publisher: String?,
                     _ linkTitle: String?,
                     _ linkDescription: String?,
                     _ linkImage: String?) -> Void)?
    
    init(linkDataFetcher: LinkDataFetcher,
         linkTitle: String? = nil,
         linkImage: String? = nil,
         linkDescription: String? = nil,
         imageWidth: Double? = nil,
         imageHeight: Double? = nil,
         publisher: String? = nil,
         tapAction: (@escaping (_ link: String,
                                _ publisher: String?,
                                _ linkTitle: String?,
                                _ linkDescription: String?,
                                _ linkImage: String?) -> Void)) {
        self.linkDataFetcher = linkDataFetcher
        self.linkTitle = linkTitle
        self.linkImage = linkImage
        self.linkDescription = linkDescription
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.publisher = publisher
        self.tapAction = tapAction
    }
    
    init(linkDataFetcher: LinkDataFetcher, linkTitle: String? = nil, linkImage: String? = nil, linkDescription: String? = nil, imageWidth: Double? = nil, imageHeight: Double? = nil, publisher: String? = nil) {
        self.linkDataFetcher = linkDataFetcher
        self.linkTitle = linkTitle
        self.linkImage = linkImage
        self.linkDescription = linkDescription
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.publisher = publisher
    }
    
    init(linkDataFetcher: LinkDataFetcher,
         linkTitle: String? = nil,
         linkImage: String? = nil,
         linkDescription: String? = nil,
         imageWidth: Double? = nil,
         imageHeight: Double? = nil,
         publisher: String? = nil,
         tapAction: ((_ link: String,
                                _ publisher: String?,
                                _ linkTitle: String?,
                                _ linkDescription: String?,
                                _ linkImage: String?) -> Void)?) {
        self.linkDataFetcher = linkDataFetcher
        self.linkTitle = linkTitle
        self.linkImage = linkImage
        self.linkDescription = linkDescription
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.publisher = publisher
        self.tapAction = tapAction
    }
    
    
    public var body: some View {
        
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
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.boundColor, lineWidth: 2)
                )
            }
            VStack(alignment: .leading, spacing: 5) {
                
                if let publisher {
                    Text(publisher)
                        .lineLimit(1)
                        .padding([.leading, .trailing])
                        .font(.system(size: 17))
                        .foregroundColor(.descriptionFontColor)
                }
                
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.bottom])
            .padding(.top, 10)
            .background(Color.linkBackgroundColor)
            
        }
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.boundColor, lineWidth: ((publisher != nil) || (linkTitle != nil) || (linkImage != nil) || (linkDescription != nil))  ? 2: 0)
        )
        .cornerRadius(10)
        .padding()
        .onAppear {
            linkDataFetcher.fetchLinkData(completionBlock: { publisher, title, imageURL, description, imageWidth, imageHeight in
                self.publisher = publisher
                self.linkTitle = title
                self.linkImage = imageURL
                self.linkDescription = description
                self.imageWidth = imageWidth
                self.imageHeight = imageHeight
            })
        }
        .onTapGesture {
            if let tapAction {
                tapAction(linkDataFetcher.link, publisher, linkTitle, linkDescription, linkImage)
            }
        }
    }
}

struct LinkPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LinkPreviewView(linkDataFetcher: LinkDataFetcher(link:"https://www.economist.com/leaders/2023/04/13/the-lessons-from-americas-astonishing-economic-record"))
    }
}
