//
//  IntroduceViewController.swift
//  CommonSettingSwift_Example
//
//  Created by insect on 2021/12/15.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

public class IntroduceViewController: BaseSettingViewController {

    private let reuseIdentifier = "reuseIdentifier"
    
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle
    public override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func makeUI() {
        super.makeUI()
        if settings.introduce.isEmpty {
            assert(false, "[Introduce] 属性未正确配置")
            return
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        if let bundle = Utils.getBundle() {
            collectionView.register(UINib(nibName: "IntroduceCell",
                                          bundle: bundle),
                                    forCellWithReuseIdentifier: reuseIdentifier)
        }
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        pageControl.numberOfPages = settings.introduce.count
    }
}

// MARK: - UICollectionViewDataSource
extension IntroduceViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.introduce.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IntroduceCell
        cell.item = settings.introduce[indexPath.row]
        let isLast = indexPath.row == settings.introduce.count - 1
        cell.isLast = isLast
        cell.buttonClick = { [weak self] in
            self?.buttonClick(isLast: isLast, row: indexPath.row)
        }
        return cell
    }
    
    private func buttonClick(isLast: Bool, row: Int) {
        if isLast {
            navigationController?.popViewController(animated: true)
        } else {
            let offset = CGFloat((row + 1)) * view.bounds.width
            collectionView.setContentOffset(CGPoint(x: offset, y: collectionView.contentOffset.y),
                                            animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IntroduceViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
}

// MARK: - UICollectionViewDelegate
extension IntroduceViewController: UICollectionViewDelegate {
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / view.bounds.width)
    }
}
