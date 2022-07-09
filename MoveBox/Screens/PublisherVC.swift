//
//  PublisherVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 06.07.2022.
//

import UIKit
import Combine

class PublisherVC: UIViewController {
    
    private var users: [User] = []
    var observer: AnyCancellable?
    let customTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        view.setTableView(superview: view, tableView: customTableView, vc: self)
        observerHandling()
    }
    
    private func observerHandling() {
        observer = NetworkManager.shared.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] users in
            guard let self = self else { return }
            self.users = users
            self.customTableView.reloadData()

        })
    }
}

extension PublisherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.publisherCell, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}


