//
//  ViewController.swift
//  SideMenu
//
//  Created by Abdul Aleem on 08/09/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sidemenuView: UIView!
    @IBOutlet weak var sidemenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    private var isMenuOpen = false
    let myArray = ["row 1", "row 2", "row 3"]
    
    @IBAction func btnSidelMenu(_ sender: UIBarButtonItem) {
        tableView.dataSource = self
        tableView.delegate = self
        isMenuOpen.toggle()
        sidemenuLeadingConstraint.constant = isMenuOpen ? 0 : -225
        tableView.showsVerticalScrollIndicator = false
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
