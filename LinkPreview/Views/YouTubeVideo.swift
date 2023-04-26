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
    
    let youtubeVideoID: String
    
    var body: some View {
        VStack {
            YouTubeVideo(videoID: youtubeVideoID)
                .aspectRatio(4/3, contentMode: .fit)
        }
        .frame(maxWidth: .infinity)
    }
}

struct YouTubeVideoView_Previews: PreviewProvider {
    static var previews: some View {
        YouTubeVideoView(youtubeVideoID: "3tJUflhYIpo")
    }
}




