//
//  UIView+Ext.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

private let size: CGFloat = 100
var origin: CGFloat!

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
            image.heightAnchor.constraint(equalToConstant: size / 2),
            image.widthAnchor.constraint(equalToConstant: size / 2)
            
        ])
    }
    
    func setPopUpView(superView: UIView, view: UIView) {
        view.isUserInteractionEnabled = true // user interaction doesn't work by default 🤯
        view.backgroundColor = UIColor(white: 0, alpha: 0) // make view transparent
        superView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -80),
            view.heightAnchor.constraint(equalToConstant: 80),
            view.widthAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func setLockImageView(superview: UIView, imageView: UIImageView) {
        superview.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
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
