//
//  StringTool.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/9/3.
//  Copyright © 2019年 张奥. All rights reserved.
//

import Foundation

extension String{
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}
