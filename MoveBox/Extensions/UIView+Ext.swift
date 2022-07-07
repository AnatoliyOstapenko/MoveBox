//
//  UIView+Ext.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

private let size: CGFloat = 100

extension UIView {
 
    // MARK: - MoveBoxVC
    
    func moveBoxSet(superview: UIView, view: UIImageView) {
        view.isUserInteractionEnabled = true
        superview.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: size),
            view.widthAnchor.constraint(equalToConstant: size)
        ])
    }
    
    // MARK: - PopUpVC
    
    func setPopUpImage(view: UIView, image: UIImageView) {
        view.addSubview(image)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            image.heightAnchor.constraint(equalToConstant: size / 3.5),
            image.widthAnchor.constraint(equalToConstant: size / 3.5)
            
        ])
    }
    
    func setPopUpView(superView: UIView, popUpView: UIView, recognizer: UITapGestureRecognizer) {
        superView.addSubview(popUpView)
        popUpView.addGestureRecognizer(recognizer)
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popUpView.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            popUpView.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -80),
            popUpView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // MARK: - PublisherVC
    
    func setTableView(superview: UIView, tableView: UITableView, vc: UIViewController) {
        superview.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.frame = superview.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CustomCell.publisherCell)
        tableView.dataSource = vc as? PublisherVC
    }
}
