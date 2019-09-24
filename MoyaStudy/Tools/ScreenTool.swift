//
//  ScreenTool.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import Foundation
import UIKit

struct Screen {
    var width : CGFloat = UIScreen.main.bounds.size.width
    var height : CGFloat = UIScreen.main.bounds.size.height
}
struct PhoneInfo {
    var deviceModel = UIDevice.current.localizedModel
    var sysName = UIDevice.current.systemName
    var sysVersion = UIDevice.current.systemVersion
    var channel = "VL001"
    var appVersionName = "5.5.0"
    var versioncode = "5200"
    var packageName = "com.aozhang.MoyaStudy"
    var apiVersion = "test"

}
