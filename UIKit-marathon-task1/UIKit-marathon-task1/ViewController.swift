//
//  ViewController.swift
//  UIKit-marathon-task1
//
//  Created by Руслан Сабиров on 01/07/2023.
//

import UIKit

class ViewController: UIViewController {

    private let squareView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(squareView)
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addGradient()
        addShadow()
    }
    
    private func makeConstraints() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.heightAnchor.constraint(equalToConstant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = squareView.bounds
        gradient.cornerRadius = 6
        squareView.layer.addSublayer(gradient)
    }
    
    private func addShadow() {
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 6
        shadowLayer.shadowPath = UIBezierPath(rect: squareView.bounds).cgPath
        squareView.layer.insertSublayer(shadowLayer, at: 0)
    }
}

