//
//  MainNavView.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
import SnapKit

protocol MainNavViewDelegate {
    func offSetScrollIndex(index: Int)
}
typealias Number = (_: Int) -> (Int)

class MainNavView: UIView {
   
    var delegate: MainNavViewDelegate?
    
    
    var buttonItems = [UIButton]()
    var selectButton: UIButton?
    var line: UIView?
    
//    let addCloser: (Int, Int) -> (Int) = {(num1,num2) in
//
//        return num1 + num2
//    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createUI() {
        let bgView = UIView()
        self.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalTo(self)
            make.height.equalTo(44)
        }
        //搜索
        let searchBtn = UIButton.init(type: UIButtonType.custom)
        searchBtn.setImage(UIImage(named: "search_img"), for: UIControlState.normal)
        searchBtn.addTarget(self, action: #selector(clickSearchBtn(button:)), for: .touchUpInside)
        bgView.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(bgView)
            make.centerY.equalTo(bgView)
            make.width.equalTo(48)
        }
        let datas : Array = ["关注","推荐","限免","三星","四星","五星"]
        let itemWidth = (Screen().width - 48.0) / CGFloat(datas.count)
        
        //指示条
        line = UIView()
        line?.backgroundColor = UIColor.hex(hexString: "FF2E79")
        line?.layer.masksToBounds = true
        line?.layer.cornerRadius = 3.0/2.0
        bgView .addSubview(line!)
        
        //item
        for i in 0..<datas.count{
            let item = UIButton.init(frame: CGRect(x: 48.0+CGFloat(i%(datas.count))*itemWidth, y: 0, width: itemWidth, height: 44))
            item.setTitle(datas[i], for: UIControlState.normal)
            item.setTitleColor(UIColor.hex(hexString: "FF2E79"), for: UIControlState.selected)
            item.setTitleColor(UIColor.hex(hexString: "878787"), for: UIControlState.normal)
            item.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            item.addTarget(self, action: #selector(clickItem(item:)), for: .touchUpInside)
            item.tag = i
            bgView.addSubview(item)
            if i == 1{
               item.isSelected = true
                line?.frame = CGRect(x: 0, y: 0, width: 15.0, height: 3.0)
                line?.center = CGPoint(x: item.center.x, y: self.frame.maxY - 20.0 - 6)
                selectButton = item
            }
            buttonItems.append(item)
        }
    }
    
    func offSetIndex(index: Int) {
        let item = buttonItems[index]
        changeSelectBtn(item: item)
    }
    
   @objc func clickSearchBtn(button: UIButton) {
    //点击搜索
    
    }
   @objc  func clickItem(item: UIButton) {
        //点击item
        changeSelectBtn(item: item)
        delegate?.offSetScrollIndex(index: item.tag)
    }
    
    func changeSelectBtn(item :UIButton) {
        item.isSelected = true
        selectButton?.isSelected = false
        selectButton = item
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.line?.center = CGPoint(x: item.center.x, y: (self.line?.center.y)!)
        }) { (Bool) in
            
        }
    }
}
