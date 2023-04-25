//
//  TestYouTubeView.swift
//  LinkPreview
//
//  Created by Huang Runhua on 4/25/23.
//

import SwiftUI

struct TestYouTubeView: View {
    
    private let para1: String =
    """
    But others say an even sterner approach is needed. Governments should treat ai like medicines, with a dedicated regulator, strict testing and pre-approval before public release. China is doing some of this, requiring firms to register ai products and undergo a security review before release. But safety may be less of a motive than politics: a key requirement is that ais’ output reflects the “core value of socialism”.
    """
    
    private let para2: String =
    """
    What to do? The light-touch approach is unlikely to be enough. If ai is as important a technology as cars, planes and medicines—and there is good reason to believe that it is—then, like them, it will need new rules. Accordingly, the eu’s model is closest to the mark, though its classification system is overwrought and a principles-based approach would be more flexible. Compelling disclosure about how systems are trained, how they operate and how they are monitored, and requiring inspections, would be comparable to similar rules in other industries.
    """
    
    private let para3: String =
    """
        This could allow for tighter regulation over time, if needed. A dedicated regulator may then seem appropriate; so too may intergovernmental treaties, similar to those that govern nuclear weapons, should plausible evidence emerge of existential risk. To monitor that risk, governments could form a body modelled on cern, a particle-physics laboratory, that could also study ai safety and ethics—areas where companies lack incentives to invest as much as society might wish.
    """
    
    @State private var showYouTubeView: Bool = false
    
    private let ldf = LinkDataFetcher(link: "https://www.newscientist.com/article/mg25834340-300-how-i-found-a-new-home-online-at-mastodon-after-giving-up-on-twitter/?utm_term=Autofeed&utm_campaign=echobox&utm_medium=social&utm_source=Twitter#Echobox=1681858978")
    
    var body: some View {
        ScrollView {
            Text(para1)
                .padding([.leading, .trailing])
            
            YouTubeVideoView()
            
            LinkPreviewView(linkDataFetcher: ldf)
            
            Text(para2)
                .padding([.bottom, .leading, .trailing])
            
            Text(para3)
                .padding([.bottom, .leading, .trailing])
        }
    }
}

struct TestYouTubeView_Previews: PreviewProvider {
    static var previews: some View {
        TestYouTubeView()
    }
}
