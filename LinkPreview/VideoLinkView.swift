//
//  VideoLinkView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/24/23.
//

import SwiftUI
import AVKit
import UIKit

struct VideoLinkView: View {
    
    private let demoVideoLink: String = "https://cdn3.dora-video.cn/0bc3giaaaaaa4uakmycek5sfamwdaazaaaaa.f0.mp4"
    
    @State private var videoResolution: CGFloat? = nil
    @State private var linkTitle: String? = nil
    @State private var linkDescription: String? = nil
    @State private var publisher: String? = nil
    
    private var player: AVPlayer? {
        if let videoURL = URL(string: demoVideoLink) {
            return AVPlayer(url: videoURL)
        }
        return nil
    }
    
    var body: some View {
        VStack {
            if let videoResolution, let player {
                AVPlayerControllerRepresented(player: player)
                    .onAppear {
                        player.seek(to: CMTimeMakeWithSeconds(0.7, preferredTimescale: 1000))
                    }
                    .aspectRatio(videoResolution, contentMode: .fit)
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
                .stroke(Color.boundColor, lineWidth: 2)
        )
        .cornerRadius(10)
        .padding()
        .onAppear {
            self.publisher = "economist.com"
            self.linkTitle = "How to worry wisely about artificial intelligence"
            self.linkDescription = "Rapid progress in AI is arousing fear as well as excitement. How worried should you be?"
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

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
