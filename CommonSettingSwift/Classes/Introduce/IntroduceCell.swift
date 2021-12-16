//
//  IntroduceCell.swift
//  CommonSettingSwift
//
//  Created by insect on 2021/12/15.
//

import UIKit

class IntroduceCell: UICollectionViewCell {

    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var imageName: UIImageView!
    
    var buttonClick: (() -> Void)?
    
    var item: Introduce? {
        didSet {
            
            guard let item = item else { return }
            titleLabel.text = item.title
            subTitleLabel.text = item.subTitle
            imageName.image = UIImage(named: item.imageName,
                                      in: Bundle.main,
                                      compatibleWith: nil)
        }
    }
    
    var isLast: Bool = false {
        didSet {
            button.setTitle(isLast ? "完成" : " 继续", for: .normal)
        }
    }
    
    @IBAction private func buttonDidClick() {
        buttonClick?()
    }
}
