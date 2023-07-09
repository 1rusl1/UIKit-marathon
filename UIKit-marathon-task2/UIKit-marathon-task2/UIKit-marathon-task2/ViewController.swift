//
//  ViewController.swift
//  UIKit-marathon-task2
//
//  Created by Руслан Сабиров on 05/07/2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    private lazy var button1 = UIButton()
    private lazy var button2 = UIButton()
    private lazy var button3 = UIButton()
    
    private lazy var buttons = [button1, button2, button3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtonsLayout()
        setupButtonsAppearance()
    }
    
    private func setupButtonsLayout() {
        buttons.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        buttons.forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 50),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 50),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupButtonsAppearance() {
        buttons.forEach { button in
            button.configuration = .filled()
            button.configuration?.buttonSize = .medium
            button.configuration?.image = UIImage.init(systemName: "arrow.forward.circle")
            button.configuration?.imagePlacement = .trailing
            button.configuration?.imagePadding = 8
            button.configuration?.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
            button.configurationUpdateHandler = { button in
                if button.state == .highlighted || button.state == .selected {
                    UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
                        button.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                    }
                } else {
                    UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
                        button.transform = CGAffineTransformIdentity
                    }
                }
            }
        }
     
        button1.setTitle("First name", for: .normal)
        button2.setTitle("Second long name", for: .normal)
        button3.setTitle("Third", for: .normal)
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
}

