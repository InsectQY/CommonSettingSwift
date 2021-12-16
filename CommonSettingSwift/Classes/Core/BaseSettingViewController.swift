//
//  BaseSettingViewController.swift
//  CommonSettingSwift
//
//  Created by insect on 2021/12/15.
//

import UIKit

public class BaseSettingViewController: UIViewController {

    let settings: Settings
    
    public init(settings: Settings) {
        self.settings = settings
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    public init() {
        self.settings = Utils.decodeSettings()
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = .white
    }
}
