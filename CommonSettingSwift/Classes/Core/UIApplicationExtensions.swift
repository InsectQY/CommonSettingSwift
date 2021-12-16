//
//  UIApplicationExtensions.swift
//  CommonSettingSwift
//
//  Created by insect on 2021/12/13.
//

import Foundation

extension UIApplication {
    
    static var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }

    static var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
