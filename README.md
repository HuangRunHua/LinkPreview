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
LinkPreviewView(linkDataFetcher: linkDataFetchers[5]) { link, publisher, linkTitle, linkDescription, linkImage in
	if let linkDescription {
			print(linkDescription)
		}
}
```

## Last But Not Least

Noted that the link preview here only support displaying images not videos. You can make contributions too.
