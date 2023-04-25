//
//  YouTubeVideo.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/25/23.
//

import SwiftUI
import WebKit

struct YouTubeVideo: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.allowsLinkPreview = true
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        
        let request = URLRequest(url: youtubeURL)
        uiView.load(request)
    }
}

struct YouTubeVideoView: View {
    
    private let youtubeVideoID: String = "3tJUflhYIpo"
    
    @State private var videoResolution: CGFloat? = nil
    @State private var linkTitle: String? = nil
    @State private var linkDescription: String? = nil
    @State private var publisher: String? = nil
    
    var body: some View {
        VStack {
            YouTubeVideo(videoID: youtubeVideoID)
                .aspectRatio(4/3, contentMode: .fit)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.boundColor, lineWidth: 2)
                )
            
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
                .stroke(Color.boundColor, lineWidth: 2)
        )
        .cornerRadius(10)
        .padding()
        .onAppear {
            self.publisher = "economist.com"
            self.linkTitle = "How to worry wisely about artificial intelligence"
            self.linkDescription = "Rapid progress in AI is arousing fear as well as excitement. How worried should you be?"
        }
    }
}

struct YouTubeVideoView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeVideoView()
    }
}




