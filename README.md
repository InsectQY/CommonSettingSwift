# CommonSettingSwift

[![CI Status](https://img.shields.io/travis/insect/CommonSettingSwift.svg?style=flat)](https://travis-ci.org/insect/CommonSettingSwift)
[![Version](https://img.shields.io/cocoapods/v/CommonSettingSwift.svg?style=flat)](https://cocoapods.org/pods/CommonSettingSwift)
[![License](https://img.shields.io/cocoapods/l/CommonSettingSwift.svg?style=flat)](https://cocoapods.org/pods/CommonSettingSwift)
[![Platform](https://img.shields.io/cocoapods/p/CommonSettingSwift.svg?style=flat)](https://cocoapods.org/pods/CommonSettingSwift)

通用的设置页面封装，支持配置文件和代码两种方式初始化

## Use

### 使用配置文件初始化（推荐）

1. 在主工程中创建一个 `MySetting.json` 文件，配置需要自定义的参数

```json
{
    "appId": "上架到 App Store 时的 appId",
    "privacyPolicy": "隐私政策地址",
    "userAgreement": "用户协议地址",
    "feedbackEmail": "用于联系我们时显示的 email",
    "shareIcon": "分享用的 Icon 名称，若不配置则默认使用 AppIcon",
    "aboutIcon": "关于界面用的 Icon 名称，若不配置则默认使用 AppIcon",
    "copyright": "版权信息",
    "introduce": [
        {
            "title" : "标题",
            "subTitle" : "副标题",
            "imageName": "图片名称"
        
        },
        {
            "title" : "标题",
            "subTitle" : "副标题",
            "imageName": "图片名称"
        }
    ]
}
```

2. 初始化控制器（需要将其加入导航控制器中）

```swift
let vc = CommonSettingViewController()
navigationController?.pushViewController(vc, animated: true)
```

或者

```swift
let vc = CommonSettingViewController()
UINavigationController(rootViewController: vc)
```

### 使用代码初始化

1. 初始化 `Settings` 对象

```swift
public init(appId: String,
            privacyPolicy: String,
            userAgreement: String,
            feedbackEmail: String,
            shareIcon: String = "",
            aboutIcon: String = "",
            copyright: String = "",
            introduce: [Introduce]) {
        
        self.appId = appId
        self.privacyPolicy = privacyPolicy
        self.userAgreement = userAgreement
        self.feedbackEmail = feedbackEmail
        self.shareIcon = shareIcon
        self.aboutIcon = aboutIcon
        self.copyright = copyright
        self.introduce = introduce
}
```

2. 初始化控制器（需要将其加入导航控制器中）

```swift
let settings = Settings()
let vc = CommonSettingViewController(settings: settings)
navigationController?.pushViewController(vc, animated: true)
```

或者

```swift
let settings = Settings()
let vc = CommonSettingViewController()
UINavigationController(rootViewController: vc)
```

## Requirements

iOS 9.0 +

## Installation

CommonSettingSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CommonSettingSwift'
```

## License

CommonSettingSwift is available under the MIT license. See the LICENSE file for more info.
