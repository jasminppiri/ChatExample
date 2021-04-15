//
//  GroupDetailViewController.swift
//  ChatExample
//
//  Created by Jasmin Patel on 10/04/21.
//

import UIKit

class GroupDetailViewController: UIViewController {

    //MARK: Variables
    var users: [User] = []
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
//MARK: UITableViewDataSource
extension GroupDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupDetailTableViewCell", for: indexPath) as! GroupDetailTableViewCell
        cell.configureCell(user: users[indexPath.row])
        return cell
    }
    
}
