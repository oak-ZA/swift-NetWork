//
//  MainContentView.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit

protocol MainContentDelegate : NSObjectProtocol {
    func offSet(offSet:Int)
    func didSelectUrl(index: Int)
}
class MainContentView: UIView,UIScrollViewDelegate,MainCollectionViewDelegate{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    var delegate: MainContentDelegate?
    var index: Int = 0
    var scrollView: UIScrollView?
    var indexs = [Int]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        createScrollView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createScrollView() {
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        scrollView?.contentSize = CGSize(width: 6*self.frame.size.width, height: 0)
        scrollView?.isPagingEnabled = true
        scrollView?.backgroundColor = UIColor.yellow
        scrollView?.bounces = false
        scrollView?.delegate = self
        scrollView?.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleHeight.rawValue | UIViewAutoresizing.flexibleWidth.rawValue)
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.showsHorizontalScrollIndicator = false
        self.addSubview(scrollView!)
        scrollView?.contentOffset = CGPoint(x: self.frame.size.width, y: 0)
    
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = Int(scrollView.contentOffset.x / self.frame.size.width)
        if offSet == index {
            return
        }
        index = offSet
        delegate?.offSet(offSet: offSet)
        createCollectionView(index: offSet)
    }
    
    func offSetInde(index: Int) {
        scrollView?.contentOffset = CGPoint(x: CGFloat(index)*self.frame.size.width, y: 0)
        createCollectionView(index: index)
    }
    
    func createCollectionView(index: Int) {
        if indexs .contains(index){
            return
        }
        let mainCollectionView = MainCollectionView()
        mainCollectionView.initFrameWithIndex(frame: CGRect(x: CGFloat(index)*self.frame.size.width, y: 0, width: self.frame.size.width, height: self.frame.size.height), index: index)
        mainCollectionView.delegate = self
        scrollView?.addSubview(mainCollectionView)
        indexs.append(index)
    }
    
    func didSelectAdUrl(url: Int) {
        delegate?.didSelectUrl(index: url)
    }
    
}
