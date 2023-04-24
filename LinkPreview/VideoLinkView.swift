//
//  VideoLinkView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/24/23.
//

import SwiftUI
import AVKit

struct VideoLinkView: View {
    
    private let demoVideoLink: String = "https://cdn3.dora-video.cn/0bc3giaaaaaa4uakmycek5sfamwdaazaaaaa.f0.mp4"
    
    @State private var videoResolution: CGFloat? = nil
    
    var body: some View {
        VStack {
            if let videoURL = URL(string: demoVideoLink), let videoResolution {
                VideoPlayer(player: AVPlayer(url:  videoURL))
                    .aspectRatio(videoResolution, contentMode: .fit)
            } else {
                Text("No Video Found")
            }
        }
        .onAppear {
            self.videoResolution = self.getVideoWidthResolution(url: self.demoVideoLink)
        }
        
    }
    
    func getVideoWidthResolution(url: String) -> CGFloat? {
        guard let track = AVURLAsset(url: URL(string: url)!).tracks(withMediaType: AVMediaType.video).first else { return nil}
        let size = track.naturalSize.applying(track.preferredTransform)
        return abs(size.width)/abs(size.height)
    }
}

struct VideoLinkView_Previews: PreviewProvider {
    static var previews: some View {
        VideoLinkView()
    }
}
