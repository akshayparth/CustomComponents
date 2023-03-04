//
//  KeyboardDismissController.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

open class KeyboardDismissTableController: UITableViewController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KeyboardDismissTableController.dismissKeyboard))
        // Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // Remove empty cells from tableview
        tableView.tableFooterView = UIView(frame: .zero)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
