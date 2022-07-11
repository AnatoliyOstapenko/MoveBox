//
//  CombineVC.swift
//  MoveBox
//
//  Created by AnatoliiOstapenko on 10.07.2022.
//

import UIKit
import Combine

extension Notification.Name {
    static let newBlogPost = Notification.Name("newPost")
}

struct BlogPost { let title: String }

class CombineVC: UIViewController {
    
    var blogTextField = CustomTextField(placeholder: "New Blog Post")
    let publishButton = ActionButton(text: "Publish")
    var subscribeLabel = CustomLabel(text: "Subsrcibe")
    private let topStackView = CustomStackView(frame: .zero)
    private let bottomStackView = CustomStackView(frame: .zero)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
        setPublishButton()
        subscriberHandling()
    }
    
    func subscriberHandling() {
        // Create Publisher
        let publisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil)
            .map { (notification) -> String? in // Combine with operator
                return (notification.object as? BlogPost)?.title ?? ""
            }
        // Create Subscriber
        let subscriber = Subscribers.Assign(object: subscribeLabel, keyPath: \.text)
        publisher.subscribe(subscriber)
    }
    
    func setPublishButton() {
        publishButton.addTarget(self, action: #selector(publishButtonPressed(_:)), for: .primaryActionTriggered)
    }
    
    @objc func publishButtonPressed(_ sender: UIButton) {
        let title = blogTextField.text ?? "Comming soon"
        let blogPost = BlogPost(title: title)
        NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        view.setTopStackView(superview: view, stackView: topStackView, textField: blogTextField, label: subscribeLabel)
        view.setBottomStackView(superview: view, stackView: bottomStackView, button: publishButton, label: subscribeLabel, topStackView: topStackView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    @objc func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

}
