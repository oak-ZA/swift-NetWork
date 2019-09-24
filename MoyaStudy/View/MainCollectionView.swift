//
//  MainCollectionView.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
protocol MainCollectionViewDelegate {
    func didSelectAdUrl(url: Int) -> Void
}
class MainCollectionView: UIView, UICollectionViewDelegate,UICollectionViewDataSource {

    var collotionView: UICollectionView?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegate: MainCollectionViewDelegate?
    
    
    var selectIndex: Int?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func initFrameWithIndex(frame: CGRect, index: Int) {
        self.frame = frame
        selectIndex = index
        createCollection()
    }
    
    func createCollection() {
        let collectionLayOut = UICollectionViewFlowLayout.init()
        collectionLayOut.itemSize = CGSize(width: Screen().width, height: Screen().width)
        collectionLayOut.minimumLineSpacing = 4
        collectionLayOut.minimumInteritemSpacing = 0;
        if selectIndex == 1 {
            collectionLayOut.headerReferenceSize = CGSize(width: Screen().width, height: 110.0/275.0*Screen().width)
        }
        collotionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: collectionLayOut)
        collotionView?.delegate = self
        collotionView?.dataSource = self
        collotionView?.register(UINib.init(nibName: String(describing: MainCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MainCollectionViewCell.self))
        if selectIndex == 1 {
            collotionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        }
        collotionView?.backgroundColor = UIColor.white
        self.addSubview(collotionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCollectionViewCell?
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainCollectionViewCell.self), for: indexPath) as? MainCollectionViewCell
        cell?.index = selectIndex!
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header : UICollectionReusableView?
        header = collotionView?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        let headView = MainHeadView(frame: CGRect(x: 0, y: 0, width: Screen().width, height: 110.0/275.0*Screen().width))
        headView.dataSources = ["http://vchat-test.vchat6.com/prod/resource/5kbFyFeDbx.png",
                                "http://vchat-test.vchat6.com/prod/resource/8H3BC3jQCB.jpg",
                                "http://vchat-test.vchat6.com/prod/resource/MG6BbeNMZX.png",
                                "http://vchat-test.vchat6.com/prod/resource/Sk66mJcs2K.png",
                                "http://vchat-test.vchat6.com/prod/resource/skCMwAEFpN.png",
                                "http://vchat-test.vchat6.com/prod/resource/n6TFZpr6Ds.png",
                                "http://vchat-test.vchat6.com/prod/resource/JhnSEb6nHM.jpg"]
        header?.addSubview(headView)
        
        headView.didSelectAdUrl = {(selectIndex: Int) -> Void in
           self.delegate?.didSelectAdUrl(url: selectIndex)
            
        }
        
        return header!
        
    }

}
