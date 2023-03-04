//
//  FormTableController.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

public protocol FormTableSectionHeaderTheme: class {
    func sectionHeaderBackgroundColor() -> UIColor
    func sectionHeaderTextColor() -> UIColor
}

open class ThemeableSectionTableController: KeyboardDismissTableController {
    public weak var sectionHeaderThemeDelegate : FormTableSectionHeaderTheme?
    
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = sectionHeaderThemeDelegate?.sectionHeaderBackgroundColor()
        headerView.textLabel?.textColor = sectionHeaderThemeDelegate?.sectionHeaderTextColor()
        headerView.textLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
}

open class FormTableController: ThemeableSectionTableController {
    public var rowSelectionHandler: RowSelectionHandler!
    public var nonSelectableSections = [Int]()
    open var viewModel: FormTableViewModel!
    
    override open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if nonSelectableSections.contains(indexPath.section) {
            return false
        }
        return true
    }
    
    override open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if rowSelectionHandler.showSelected(for: indexPath) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (select, previouslySelectedIndexPath) = rowSelectionHandler.shouldAllowSelection(for: indexPath)
        if let shouldSelect = select {
            if shouldSelect {
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                viewModel.storeValue(for: indexPath)
            }
            if let deselectCellAtIndexPath = previouslySelectedIndexPath {
                tableView.cellForRow(at: deselectCellAtIndexPath)?.accessoryType = .none
                
                if deselectCellAtIndexPath == indexPath {
                    viewModel.removeValue(for: indexPath)
                }
            }
        }
    }
}
