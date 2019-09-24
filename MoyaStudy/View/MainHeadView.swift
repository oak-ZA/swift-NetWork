//
//  MainHeadView.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/9/3.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
 typealias MyClosure = (Int) -> Void
class MainHeadView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var didSelectAdUrl: MyClosure?
    
    
    let interValTime = 2
    
    var collectionView: UICollectionView?
    var width: CGFloat?
    var height: CGFloat?
    var timer: Timer?
    var pageControll: UIPageControl!
    
    var datas: [String]!
    
    
    var dataSources: [String]!{
        
        didSet{
           datas = dataSources
           datas.append(dataSources.first!)
           createCyCleView()
           createPageControll()
           setupTime()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        
        width = self.frame.size.width
        height = self.frame.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func createCyCleView() {
        let flowLayOut = UICollectionViewFlowLayout();
        flowLayOut.itemSize = self.bounds.size
        flowLayOut.minimumLineSpacing = 0;
        flowLayOut.minimumInteritemSpacing = 0;
        flowLayOut.scrollDirection = UICollectionViewScrollDirection.horizontal
        collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayOut)
        collectionView?.contentSize = CGSize(width: CGFloat(datas.count)*width!, height: height!)
        collectionView?.backgroundColor = UIColor.red
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UINib.init(nibName: "CycleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ads")
        self.addSubview(collectionView!)
        
        if #available(iOS 10.0, *) {
            collectionView?.isPrefetchingEnabled = true
        } else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CycleCollectionViewCell?
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ads", for: indexPath) as? CycleCollectionViewCell
        cell?.imageUrl = datas[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        didSelectAdUrl?(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > width!*CGFloat(datas.count - 1) {
            collectionView?.contentOffset = CGPoint(x: scrollView.contentOffset.x - width!*CGFloat(datas.count - 1), y: 0)
        }else if(scrollView.contentOffset.x < 0){
            collectionView?.contentOffset = CGPoint(x: scrollView.contentOffset.x + width!*CGFloat(datas.count - 1), y: 0)
        }
        
        var page = Int(scrollView.contentOffset.x / width!)
        if scrollView.contentOffset.x == width!*CGFloat(datas.count - 1) {
            page = 0
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
        
        pageControll.currentPage = page
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setupTime()
    }
    func createPageControll() {
        
        let pageWidth = 12.0*CGFloat(datas.count) + 8.0*CGFloat(datas.count - 1)
        
        pageControll = UIPageControl(frame: CGRect(x: (width! - pageWidth)/2.0, y: self.bounds.size.height - 20.0, width: pageWidth, height: 12.0))
        pageControll.currentPage = 0
        pageControll.numberOfPages = datas.count - 1
        self.addSubview(pageControll)
    }
    
    func setupTime() {
        if datas.count > 1 {
            timer = Timer.init(timeInterval: TimeInterval(interValTime), target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    @objc func timeAction(){
        
        var page = Int((self.collectionView?.contentOffset.x)! / (self.collectionView?.frame.size.width)!)
        page += 1
        let indexPath = NSIndexPath.init(item: page, section: 0)
        
        self.collectionView?.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

