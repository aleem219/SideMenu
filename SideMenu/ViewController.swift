//
//  ViewController.swift
//  SideMenu
//
//  Created by Abdul Aleem on 08/09/26.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Oulets
    @IBOutlet weak var sidemenuView: UIView!
    @IBOutlet weak var sidemenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private var isMenuOpen = false
    let myArray = ["row 1", "row 2", "row 3"]
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbalViewDelegates()
        setupTableViewCell()
    }
    
    // MARK: - Button's Action
    @IBAction func btnSidelMenu(_ sender: UIBarButtonItem) {
        handleSideMenuToggle()
    }
}

// MARK: - Extension for ViewController
extension ViewController  {
    func setupTbalViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupTableViewCell() {
       self.tableView.register(UINib(nibName: "UserProfileTVC", bundle: nil), forCellReuseIdentifier: "UserProfileTVC")
    }
    
    func handleSideMenuToggle() {
        isMenuOpen.toggle()
        sidemenuLeadingConstraint.constant = isMenuOpen ? 0 : -225
        tableView.showsVerticalScrollIndicator = false
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Extension for UITableViewDataSource & UITableViewDelegate
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileTVC",  for: indexPath) as! UserProfileTVC
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = myArray[indexPath.row]
            cell.textLabel?.textColor = #colorLiteral(red: 0.2207712233, green: 0.295751214, blue: 0.4040987492, alpha: 1)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected index is: \(indexPath.row)")
    }
}

// MARK: - ends here
