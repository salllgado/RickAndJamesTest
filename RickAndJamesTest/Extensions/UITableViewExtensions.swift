//
//  UITableView+Extensions.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

extension UITableView {
    
    static var currentPage: Int = 1
    static var shouldShowLoadingCell: Bool = false
    
    func canSetLoading(when indexPath: IndexPath, reach value: Int, default cell: UITableViewCell) -> UITableViewCell {
        guard UITableView.shouldShowLoadingCell else { return cell }
        return indexPath.row == value ? LoadingTableViewCell() : cell
    }
}
