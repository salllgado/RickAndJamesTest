//
//  Colors.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

enum Colors {
    case navBarTitleColor
    case tableViewBackgroundColor
    
    var uiColor: UIColor {
        switch self {
        case .navBarTitleColor:
            return UIColor(named: "nav_bar_title") ?? UIColor.white
        case .tableViewBackgroundColor:
            return UIColor(named: "table_view_bg") ?? UIColor.darkGray
        }
    }
}
