//
//  CommonSettingViewController.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/10.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

public class CommonSettingViewController: BaseSettingViewController {
    private let reuseIdentifier = "reuseIdentifier"

    private var items: [SettingType] = [.introduce,
                                        .cleanCache,
                                        .feedback,
                                        .share,
                                        .comment,
                                        .about]

    // MARK: - LazyLoad

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds,
                                    style: .plain)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        if let bundle = Utils.getBundle() {
            tableView.register(UINib(nibName: "SettingCell",
                                     bundle: bundle),
                               forCellReuseIdentifier: reuseIdentifier)
        }
        tableView.rowHeight = SettingCell.height
        return tableView
    }()

    // MARK: - LifeCycle

    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    override func makeUI() {
        super.makeUI()
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension CommonSettingViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SettingCell
        cell.title = items[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CommonSettingViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch items[indexPath.row] {
        case .about:
            about()
        case .share:
            share()
        case .comment:
            comment()
        case .feedback:
            feedback()
        case .cleanCache:
            cleanCache()
        case .introduce:
            introduce()
        }
    }
}

extension CommonSettingViewController {
    private func about() {
        navigationController?.pushViewController(AboutViewController(settings: settings),
                                                 animated: true)
    }

    private func share() {
        if settings.appId.isEmpty {
            assert(false, "appId 未正确配置")
            return
        }

        guard
            let image = Utils.getIcon(settings.shareIcon),
            let url = URL(string: "http://itunes.apple.com/us/app/id\(settings.appId)")
        else {
            return
        }

        let activityItems: [Any] = [UIApplication.displayName ?? "",
                                    image,
                                    url]
        let vc = UIActivityViewController(activityItems: activityItems,
                                          applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }

    private func comment() {
        if settings.appId.isEmpty {
            assert(false, "appId 未正确配置")
            return
        }

        guard
            let url = URL(string: "https://itunes.apple.com/us/app/itunes-u/id\(settings.appId)?action=write-review&mt=8")
        else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    private func feedback() {
        
        let alertVc = UIAlertController(title: "意见反馈",
                                        message: """
                                        如果有问题需要反馈，或寻求帮助，可以通过以下方式联系我们：
                                        
                                        Email: \(settings.feedbackEmail)
                                        """,
                                        preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))

        present(alertVc, animated: true, completion: nil)
    }

    private func cleanCache() {
        let alertVc = UIAlertController(title: "将清空所有缓存，是否继续？",
                                        message: nil,
                                        preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "立即清空", style: .destructive, handler: { [weak self] _ in
            self?.clearCache()
        }))

        alertVc.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))

        present(alertVc, animated: true, completion: nil)
    }

    private func clearCache() {
        guard
            let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first,
            let files: [String] = FileManager.default.subpaths(atPath: cachePath)
        else {
            return
        }

        DispatchQueue.global().async {
            for file in files where FileManager.default.fileExists(atPath: file) {
                try? FileManager.default.removeItem(atPath: file)
            }

            DispatchQueue.main.async {
                let alertVc = UIAlertController(title: "缓存清除成功",
                                                message: nil,
                                                preferredStyle: .alert)
                alertVc.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
                self.present(alertVc, animated: true, completion: nil)
            }
        }
    }

    private func introduce() {
        navigationController?.pushViewController(IntroduceViewController(settings: settings),
                                                 animated: true)
    }
}
