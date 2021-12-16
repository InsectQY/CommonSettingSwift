//
//  SettingModel.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

public class Settings {
    
    /// app Id
    let appId: String
    /// 隐私政策
    let privacyPolicy: String
    /// 用户协议
    let userAgreement: String
    /// 联系我们显示的邮箱
    let feedbackEmail: String
    /// 分享时显示的 icon (若不配置，则默认获取 appIcon)
    let shareIcon: String
    /// 关于界面现实的 icon (若不配置，则默认获取 appIcon)
    let aboutIcon: String
    /// 版权信息
    let copyright: String
    /// 功能介绍界面的数据
    let introduce: [Introduce]
    
    public init(dictionary: [String: Any]) {
        
        self.appId = dictionary["appId"] as? String ?? ""
        self.privacyPolicy = dictionary["privacyPolicy"] as? String ?? ""
        self.userAgreement = dictionary["userAgreement"] as? String ?? ""
        self.feedbackEmail = dictionary["feedbackEmail"] as? String ?? ""
        self.shareIcon = dictionary["shareIcon"] as? String ?? ""
        self.aboutIcon = dictionary["aboutIcon"] as? String ?? ""
        self.copyright = dictionary["copyright"] as? String ?? ""
        
        let array: [[String: Any]] = dictionary["introduce"] as? [[String: Any]] ?? []
        self.introduce = array.map {
            Introduce(dictionary: $0)
        }
    }
    
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
}

public class Introduce {
    
    /// 标题
    let title: String
    /// 子标题
    let subTitle: String
    /// 图片名称
    let imageName: String
    
    public init(dictionary: [String: Any]) {
        
        self.title = dictionary["title"] as? String ?? ""
        self.subTitle = dictionary["subTitle"] as? String ?? ""
        self.imageName = dictionary["imageName"] as? String ?? ""
    }
    
    public init(title: String,
                subTitle: String,
                imageName: String) {
        
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
    }
}
