//
//  API.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/9/24.
//  Copyright © 2019 张奥. All rights reserved.
//

import Foundation
import Moya

enum API {
    case updateAPi(parameters:[String:Any])
    case register(email:String,password:String)
    case uploadHeadImage(parameters:[String:Any],imageData:Data)
    case easyRequset
}

extension API:TargetType{
    
    var baseURL: URL {
        switch self {
        case .easyRequset:
            return URL.init(string: "interface.release.vliao9.com:8668/")!
        default:
            return URL.init(string:(Moya_baseURL))!
        }
    }
    
    var path: String{
        switch self {
        case .register:
            return "register"
        case .easyRequset:
            return "4/news/latest"
        case .updateAPi:
            return "public/scroll-list"
        case .uploadHeadImage:
            return "/file/user/upload.jhtml"
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .easyRequset:
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data{
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task{
        
        switch self {
        case let .register(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .easyRequset:
            return .requestPlain
        case let .updateAPi(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        //图片上传
        case .uploadHeadImage(let parameters, let imageDate):
            ///name 和fileName 看后台怎么说，   mineType根据文件类型上百度查对应的mineType
            let formData = MultipartFormData(provider: .data(imageDate), name: "file",
                                             fileName: "hangge.png", mimeType: "image/png")
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
        }
    }
    
    var headers: [String : String]?{
        var additionalParameters : [String:String] = Dictionary()
        additionalParameters["phoneBrand"] = PhoneInfo().deviceModel
        additionalParameters["phoneSystem"] = "iOS"
        additionalParameters["phoneModels"] = PhoneInfo().sysVersion
        additionalParameters["appMarket"] = PhoneInfo().channel
        additionalParameters["appVersionName"] = PhoneInfo().appVersionName
        additionalParameters["appVersionCode"] = PhoneInfo().versioncode
        additionalParameters["packageName"] = PhoneInfo().packageName
        additionalParameters["apiVersion"] = PhoneInfo().apiVersion
        
        return additionalParameters
    }
    
}
