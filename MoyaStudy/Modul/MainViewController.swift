//
//  MainViewController.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
import SnapKit
class MainViewController: UIViewController,MainContentDelegate,MainNavViewDelegate {
    
    
    var contentView: MainContentView?
    var navView: MainNavView?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        createUI()
        
        testAPI()
        
    }
    
    func testAPI() {
        var paraDict: [String:Any] = Dictionary()
        paraDict["userId"] = NSNumber(value: 4261180)
        paraDict["userKey"] = "a5f4385611a95a3a5cceb665d397b60f"
        
        NetWorkRequest(.updateAPi(parameters: paraDict)) { (responseString) -> (Void) in
            print(responseString)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createUI() {
        
        //navView
        navView = MainNavView(frame: CGRect(x: 0, y: 0, width: Screen().width, height: 64))
        navView?.delegate = self
        view.addSubview(navView!)
        
        contentView = MainContentView(frame: CGRect(x: 0, y: 64, width: Screen().width, height: Screen().height - 64.0 - 49.0))
        contentView?.delegate = self
        view.addSubview(contentView!)
        
    }
    
    func offSet(offSet: Int) {
        navView?.offSetIndex(index: offSet)
    }
    func didSelectUrl(index: Int) {
        let ads = ["http://interface.release.vliao9.com:8668/html/center/index.html?{para}#/weekStarBlueGiftNew/66/66",
                   "http://interface.release.vliao9.com:8668/html/center/index.html?{para}#/starAnchor",
                   "http://interface.release.vliao9.com:8668/html/center/index.html?{para}#/recruitAnchor",
                   "http://interface.release.vliao9.com:8668/html/v5module/index.html#/dividedPlan/home",
                   "http://interface.release.vliao9.com:8668/html/guide/index.html",
                   "http://interface.release.vliao9.com:8668/html/usernotice/jw2019.html",
                   "http://www.sina.com.cn"]
        
        let webVC = BaseWebViewController()
        print("adsStr\(ads[index])")
        webVC.loadWebViewUrl(url: ads[index])
        self.navigationController?.pushViewController(webVC, animated: true)
    }
   
    func offSetScrollIndex(index: Int) {
        contentView?.offSetInde(index: index)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
