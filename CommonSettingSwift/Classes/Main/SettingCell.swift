//
//  SettingCell.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/10.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    static var height: CGFloat {
        return 55
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
    }
}
