//
//  Image.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 29/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

enum Images: String {
    case defaultAvatar = "default_avatar_img"
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
