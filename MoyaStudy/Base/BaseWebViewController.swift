//
//  BaseWebViewController.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/9/3.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
import WebKit
class BaseWebViewController: UIViewController,WKScriptMessageHandler,WKUIDelegate,WKNavigationDelegate{
    
    var webView: WKWebView!
    var config: WKWebViewConfiguration!
    var preference: WKPreferences!
    var userControll: WKUserContentController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 80.0, y: 20.0, width: 44, height: 44);
        button.addTarget(self, action: #selector(clickButton(button:)), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        
    }

    @objc func clickButton(button:UIButton){
      self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebViewUrl(url: String) -> Void {
        setWebView(url: url)
    }
    
    func setWebView(url: String) {
        
        config = WKWebViewConfiguration()
        preference = WKPreferences()
        preference.javaScriptEnabled = true
        preference.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = preference
        
        webView = WKWebView(frame: CGRect(x: 0, y: 64, width: Screen().width, height: Screen().height), configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: url.urlEncoded())!))
        view.addSubview(webView)
        self.edgesForExtendedLayout = UIRectEdge.all
        
        if #available(iOS 11.0, *) {
            
        } else {
            
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
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
