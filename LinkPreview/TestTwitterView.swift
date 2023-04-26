//
//  TestTwitterView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/26/23.
//

import SwiftUI

struct TestTweetsView: View {
    private let tweetLink1 =  "https://twitter.com/ShouldHaveCat/status/1650864348229931012?s=20"
    
    private let tweetLink2 = "https://twitter.com/TheEconomist/status/1651131401398284290?s=20"
    
    private let tweetLink3 = "https://twitter.com/ShiningNikki_JP/status/1650061952016846849?s=20"
    
    private let para1 =
    """
    Open-source implementations, when trained carefully and selectively, are already aping the performance of gpt-4. This is a good thing: having the power of llms in many hands means that many minds can come up with innovative new applications, improving everything from medicine to the law.
    """
    
    private let para2 =
    """
    But it also means that the catastrophic risk which keeps the tech elite up at night has become more imaginable. llms are already incredibly powerful and have improved so quickly that many of those working on them have taken fright. The capabilities of the biggest models have outrun their creators’ understanding and control. That creates risks, of all kinds.
    """
    
    private let para3 =
    """
    Getty points to images produced by Stable Diffusion which contain its copyright watermark, suggesting that Stable Diffusion has ingested and is reproducing copyrighted material without permission (Stability AI has not yet commented publicly on the lawsuit). The same level of evidence is harder to come by when examining Chatgpt’s text output, but there is no doubt that it has been trained on copyrighted material. Openai will be hoping that its text generation is covered by “fair use”, a provision in copyright law that allows limited use of copyrighted material for “transformative” purposes. That idea will probably one day be tested in court.
    """
    
    private let para4 =
    """
    But the most important limit to the continued improvement of llms is the amount of training data available. gpt-3 has already been trained on what amounts to all of the high-quality text that is available to download from the internet. A paper published in October 2022 concluded that “the stock of high-quality language data will be exhausted soon; likely before 2026.” There is certainly more text available, but it is locked away in small amounts in corporate databases or on personal devices, inaccessible at the scale and low cost that Common Crawl allows.
    """
    
    var body: some View {
        ScrollView {
            
            Text(para1)
                .padding([.leading, .trailing])
            
            if let tweetURL = URL(string: tweetLink1) {
                TweetView(previewURL: tweetURL)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Text(para2)
                .padding([.leading, .trailing])
            
            if let tweetURL = URL(string: tweetLink2) {
                TweetView(previewURL: tweetURL)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Text(para3)
                .padding([.leading, .trailing])
            
            if let tweetURL = URL(string: tweetLink3) {
                TweetView(previewURL: tweetURL)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Text(para4)
                .padding([.leading, .trailing])
        }
    }
}

struct TestTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        TestTweetsView()
    }
}
