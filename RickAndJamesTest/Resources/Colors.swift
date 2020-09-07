//
//  Colors.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

enum Colors {
    case tableViewBackgroundColor
    
    var uiColor: UIColor {
        switch self {
        case .tableViewBackgroundColor:
            return UIColor(named: "table_view_bg") ?? UIColor.darkGray
        }
    }
}
