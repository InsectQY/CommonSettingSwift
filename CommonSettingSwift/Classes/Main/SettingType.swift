//
//  SettingType.swift
//  CommonSettingSwift
//
//  Created by insect on 2021/12/13.
//

import Foundation

public enum SettingType {
    
    case about
    
    case share
    
    case comment
    
    case feedback
    
    case cleanCache
    
    case introduce
}

extension SettingType {
    
    var title: String {
        switch self {
        case .about:
            return "关于"
        case .share:
            return "分享"
        case .comment:
            return "为我们打分"
        case .feedback:
            return "联系我们"
        case .cleanCache:
            return "清理缓存"
        case .introduce:
            return "功能介绍"
        }
    }
}
