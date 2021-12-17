//
//  Decode.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/15.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

class Utils {
    
    static func decodeSettings() -> Settings {
        
        guard
            let jsonPath = Bundle.main.path(forResource: "MySetting", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)),
            let anyObject = try? JSONSerialization.jsonObject(with: jsonData,
                                                              options: .mutableContainers),
            let dictionary: [String: Any] = anyObject as? [String: Any]
        else {
            assert(false, "请在主工程中配置一个 MySetting.json 文件，具体结构参考文档")
            return Settings(dictionary: [:])
        }
        
        return Settings(dictionary: dictionary)
    }
    
    static func getIcon(_ name: String) -> UIImage? {
        
        let iconName = name.isEmpty ? "AppIcon" : name
        
        return UIImage(named: iconName,
                       in: Bundle.main,
                       compatibleWith: nil)
    }
    
    static func getBundle() -> Bundle? {
        
        let bundle = Bundle(for: Self.self)
        guard
            let url = bundle.url(forResource: "CommonSettingSwiftResources",
                                 withExtension: "bundle")
        else {
            return nil
        }
        return Bundle(url: url)
    }
}
