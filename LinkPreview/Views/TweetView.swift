//
//  TweetView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/26/23.
//

import SwiftUI
import LinkPresentation

struct TweetView: UIViewRepresentable {
    
    var previewURL: URL
    
    func makeUIView(context: Context) -> LPLinkView {
        let view = LPLinkView(url: previewURL)
        
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: previewURL) { (metadata, error) in
            if let md = metadata {
                DispatchQueue.main.async {
                    view.metadata = md
                    view.sizeToFit()
                }
            }
            else if error != nil {
                let md = LPLinkMetadata()
                md.title = ""
                view.metadata = md
                view.sizeToFit()
            }
        }
        
        return view
    }
    
    func updateUIView(_ view: LPLinkView, context: Context) {
    }
}

struct TestTweetView: View {
    private let tweetLink =  "https://twitter.com/ShouldHaveCat/status/1650864348229931012?s=20"
    var body: some View {
        VStack {
            if let tweetURL = URL(string: tweetLink) {
                TweetView(previewURL: tweetURL)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct TestTweetView_Previews: PreviewProvider {
    static var previews: some View {
        TestTweetView()
    }
}

