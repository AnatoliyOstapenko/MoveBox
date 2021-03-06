//
//  UIView+Ext.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 02.07.2022.
//

import UIKit

private let size: CGFloat = 100
private let padding: CGFloat = 12

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
    
    // MARK: - UnlockVC
    
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

    func setTopStackView(superview: UIView, stackView: UIStackView, textField: UITextField, label: UILabel) {
        superview.addSubview(stackView)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: padding * 6)
            
        ])
    }
    
    func setBottomStackView(superview: UIView, stackView: UIStackView, button: UIButton, label: UILabel, topStackView: UIStackView) {
        superview.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: padding * 6)
            
        ])
    }
    
    func setSwiftView(superview: UIView, view: UIView, stackView: UIStackView) {
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
    
    func setSwiftImageView(superview: UIView, imageView: UIImageView) {
        superview.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: size),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    func setSecretButton(superview: UIView, button: UIButton, imageView: UIImageView) {
        button.backgroundColor = .systemPink
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        superview.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - PatternVC
    
    func setPatternStackView(superview: UIView, label: UILabel, stack: UIStackView, topButton: UIButton, bottomButton: UIButton) {
        superview.addSubview(stack)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(topButton)
        stack.addArrangedSubview(bottomButton)
        stack.axis = .vertical
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding * 4),
            stack.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding * 4),
            stack.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 200)

        ])
    }
    
    func setQuestionImage(superview: UIView, imageView: UIImageView, stackView: UIStackView) {
        superview.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    // MARK: - AbstractPatternVC
    
    func setAbstractPatternVC(superview: UIView, stackView: UIStackView, topImageView: UIImageView, bottomImageView: UIImageView) {
        superview.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.addArrangedSubview(topImageView)
        stackView.addArrangedSubview(bottomImageView)
        bottomImageView.isUserInteractionEnabled = true
        topImageView.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding * 4),
            stackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding * 4),
            stackView.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 300)

        ])
    }
    
}
