//
//  TableViewPagination.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 08/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

public protocol TableViewPagination {
    
    var currentPage: Int { get set }
    var numberOfPages: Int { get set }
    var shouldShowLoadingCell: Bool { get set }
    
    func canSetLoading(when indexPath: IndexPath, reach value: Int, default cell: UITableViewCell) -> UITableViewCell
    func isLoadingIndexPath(_ indexPath: IndexPath, reach value: Int) -> Bool
    func fetchNextData()
}

public extension TableViewPagination {
    
    func canSetLoading(when indexPath: IndexPath, reach value: Int, default cell: UITableViewCell) -> UITableViewCell {
        guard shouldShowLoadingCell else { return cell }
        return indexPath.row == value ? LoadingTableViewCell() : cell
    }
    
    func isLoadingIndexPath(_ indexPath: IndexPath, reach value: Int) -> Bool {
        return shouldShowLoadingCell ? indexPath.row == value : false
    }
}
