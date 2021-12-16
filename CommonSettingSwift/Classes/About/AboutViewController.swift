//
//  AboutViewController.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import SafariServices

public class AboutViewController: BaseSettingViewController {
    
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var versionLabel: UILabel!
    @IBOutlet private weak var privacyButton: UIButton!
    @IBOutlet private weak var userAgreementButton: UIButton!
    @IBOutlet private weak var copyrightLabel: UILabel!
    
    override func makeUI() {
        
        super.makeUI()
        navigationItem.title = "关于"
        view.backgroundColor = .white
        nameLabel.text = UIApplication.displayName
        versionLabel.text = "v" + (UIApplication.version ?? "")
        iconImage.image = Utils.getIcon(settings.aboutIcon)
        if !settings.copyright.isEmpty {
            copyrightLabel.text = settings.copyright
        }
    }
    
    @IBAction private func userAgreementButtonDidClick() {
        
        guard
            let url = URL(string: settings.userAgreement)
        else {
            assert(false, "userAgreement 未正确配置")
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction private func privacyButtonDidClick() {
        
        guard
            let url = URL(string: settings.privacyPolicy)
        else {
            assert(false, "privacyPolicy 未正确配置")
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
}
