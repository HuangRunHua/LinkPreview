# LinkPreview
This small project shows how to embed links to your own SwiftUI project. You can use this package directly and with just a few lines of code you can achieve the same effect just like Twitter.

![](https://github.com/HuangRunHua/LinkPreview/raw/main/Cover.JPEG)

## System Requirements

- Xcode 14.0+
- iOS & iPadOS 15.0+

## Understand A LinkPreviewView

A `LinkPreviewView` will display metadata from a specific URL, the metadata is shown below:

```html
<meta property="og:title" content="Large, creative AI models will transform lives and labour markets">
<meta property="og:image" content="https://www.economist.com/interactive/science-and-technology/2023/04/22/large-creative-ai-models-will-transform-how-we-live-and-work/promo.jpg">
<meta property="og:description" content="They bring enormous promise and peril. In the first of three special articles we explain how they work">
```

The above content (title, image, description) will be parsed and shown just as the picture shows above.

There is also a property called `publisher` in a `LinkPreviewView`. I defined the `publisher` to be the main link for example the `publisher` of a link `https://www.economist.com/interactive/science-and-technology/2023/04/22/large-creative-ai-models-will-transform-how-we-live-and-work?fsrc=core-app-economist` will be `economist.com` and the  `publisher` of a link `https://github.io/xxxxx` will be `github.io`.

> Noted that if a web page does not contain the metadata above then the publisher will be the only element to be shown inside a `LinkPreviewView`.

### YouTube Video Support
If your link points to [YouTube](httpe://youtube.com) and to be able to show correctly using this framework, please check the link contains `=`, for example, the following link is valid:

```bash
https://www.youtube.com/watch?v=ANn9ibNo9SQ
```

Behind the `=` is your video ID, make sure there is noly one `=` and your video ID is just behind the `=`.

## How to Use

Since this project is now not a Swift package, you coud just drag the `LinkPreviewView.swift` , `LinkDataFetcher.swift` and do not forget the color defined inside the `ColorExtension.swift` and `Assets` to your project.

### Define A LinkDataFetcher Object

First, you have to define a `LinkDataFetcher` object just shows in the following way:

```swift
ldf = LinkDataFetcher(
  link: "https://www.economist.com/special-report/2023/04/14/all-change"
)
```

A `LinkDataFetcher` object receives only a link string.

### Embed LinkPreviewView to Your Project

Then you can embed a `LinkPreviewView` to your project:

```swift
LinkPreviewView(linkDataFetcher: ldf, tapAction: tapAction(link:publisher:linkTitle:linkDescription:linkImage:))
```

`tapAction` decides what action should be implemented when someone tap the link view. You can also write in the following way:

```swift
LinkPreviewView(linkDataFetcher: ldf) { link, publisher, linkTitle, linkDescription, linkImage in
	if let linkDescription {
		print(linkDescription)
	}
}
```

## Websites That Support
Here is the list that shows which website supports in `LinkPreview`. Noted that not all websites are test.

- [x] [Twitter](https://twitter.com)
- [x] [YouTube](https://youtube.com)
- [x] [The Economist](https://www.economist.com)
- [x] [New Scientist](https://www.newscientist.com)
- [x] [GitHub](https://github.com)
- [x] [Apple](https://www.apple.com)
- [x] [The New Yorker](https://www.newyorker.com)
- [x] [The New York Times](https://www.nytimes.com/)
- [x] [TIME](https://time.com/)(Picture may not show)
- [x] [Bloomberg](https://www.bloomberg.com)
- [x] [WIRED](https://www.wired.com)
- [x] [Nature](https://www.nature.com/)
- [x] [Science](https://www.science.org/)
- [x] [BBC](https://www.bbc.com/)
- [x] [CNN](https://www.cnn.com)
- [x] [The Guardian](https://www.theguardian.com)
- [x] [The Atlantic](https://www.theatlantic.com)
- [x] [Reuters](https://www.reuters.com/)
- [x] [The Los Angeles Times](https://www.latimes.com)
- [x] [Washington Post](https://www.washingtonpost.com)
- [x] [The Wall Street Journal](https://www.wsj.com)
- [x] [The New York Daily News](https://www.nydailynews.com)
- [x] [New York Post](https://nypost.com)
- [x] [Chicago Tribune](https://www.chicagotribune.com)
- [x] [NewsWeek](https://www.newsweek.com)
- [x] [Fortune](https://fortune.com)
- [x] [微信读书](https://weread.qq.com)
- [x] [AP News](https://apnews.com)
- [x] [Fox News](https://www.foxnews.com)
- [x] [NBC News](https://www.nbcnews.com)
- [x] [9to5Mac](https://9to5mac.com/)
- [x] [Vox](https://www.vox.com)
- [x] [Yahoo! News](https://news.yahoo.com/)
- [x] [POLITICO](https://www.politico.eu/)
- [ ] [NPR News](https://www.npr.org)
- [ ] [Financial Times](https://www.ft.com/)
- [ ] [USA Today](https://www.usatoday.com/)
- [ ] [Reader's Digest](https://www.rd.com)
- [ ] [The Times](https://www.thetimes.co.uk)

## Last But Not Least
You can make contributions too.
