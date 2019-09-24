//
//  AppDelegate.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        createUI()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func createUI() {
        let vc1 = MainViewController()
        let vc2 = DiscoveViewController()
        let vc3 = MessageViewController()
        let vc4 = MeViewController()
        let imageS1 = UIImage(named: "home_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageN1 = UIImage(named: "home_un_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageS2 = UIImage(named: "discover_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageN2 = UIImage(named: "discover_un_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageS3 = UIImage(named: "message_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageN3 = UIImage(named: "message_un_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageS4 = UIImage(named: "me_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let imageN4 = UIImage(named: "me_un_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc1.tabBarItem.selectedImage = imageS1
        vc1.tabBarItem.image = imageN1
        vc2.tabBarItem.selectedImage = imageS2
        vc2.tabBarItem.image = imageN2
        vc3.tabBarItem.selectedImage = imageS3
        vc3.tabBarItem.image = imageN3
        vc4.tabBarItem.selectedImage = imageS4
        vc4.tabBarItem.image = imageN4
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nav1,nav2,nav3,nav4]
        self.window = UIWindow()
        self.window?.frame = CGRect(x: 0.0, y: 0.0, width: Screen().width, height: Screen().height)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = tabBarController
    }
}

