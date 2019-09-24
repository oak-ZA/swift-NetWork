//
//  MainCollectionViewCell.swift
//  MoyaStudy
//
//  Created by 张奥 on 2019/8/31.
//  Copyright © 2019年 张奥. All rights reserved.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    var index: Int?{
        
        didSet{
            
            let path = Bundle.main.path(forResource: "huoguo", ofType: "gif")
            
            guard index == index else {return}
            var imgUrl: String?
            switch index {
            case 0:
//                imgUrl = "https://v5oss.vchat6.com/prod/image/default_avatar.jpg"
                photoImageView.kf.setImage(with: ImageResource(downloadURL: URL(fileURLWithPath: path!)), placeholder: UIImage(named: "default_image"), options: nil, progressBlock: nil, completionHandler: nil)
            case 1:
                imgUrl = "https://v5oss.vchat6.com/prod/image/64JcnMJtiY.jpg"
            case 2:
                imgUrl = "https://v5oss.vchat6.com/prod/image/532872_1564120234000_kzbl2jtgn9jqrh1cta3x"
            case 3:
                imgUrl = "https://v5oss.vchat6.com/prod/image/66071_1553679341947_3co9y0boap7filtf8veg"
            case 4:
                imgUrl = "https://v5oss.vchat6.com/prod/image/1169597_1552253867000_1qntbhsqhwxhplbqvey4"
            case 5:
                imgUrl = "https://v5oss.vchat6.com/prod/image/1095236_1566147991000_o7r53oq4e71wd2wx1yp0"
            default:
                imgUrl = ""
            }
            if index != 0 {
               photoImageView.kf.setImage(with: ImageResource(downloadURL: URL(string: imgUrl!)!), placeholder: UIImage(named: "default_image"), options: nil, progressBlock: nil, completionHandler: nil)
            }
        }
    }
    

}
