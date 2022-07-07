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
            image.heightAnchor.constraint(equalToConstant: size / 3),
            image.widthAnchor.constraint(equalToConstant: size / 3)
            
        ])
    }
    
    func setPopUpView(superView: UIView, popUpView: UIView, recognizer: UIPanGestureRecognizer) {
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
    
    func setLockImageView(superview: UIView, imageView: UIImageView) {
        superview.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: size),
            imageView.widthAnchor.constraint(equalToConstant: size)
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
    
    // MARK: - KVObserving
    
    func setSwiftImageView(superview: UIView, imageView: UIImageView) {
        imageView.backgroundColor = .yellow
        superview.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 80),
            imageView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
}
