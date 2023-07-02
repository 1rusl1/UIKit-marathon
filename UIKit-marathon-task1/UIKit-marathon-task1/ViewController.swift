//
//  ViewController.swift
//  UIKit-marathon-task1
//
//  Created by Руслан Сабиров on 01/07/2023.
//

import UIKit

class ViewController: UIViewController {
    private let squareView = UIView()
    
    private var gradientLayer: CAGradientLayer?
    private var shadowLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(squareView)
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addLayersToView()
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
    
    private func makeGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = squareView.bounds
        gradient.cornerRadius = 6
        return gradient
    }
    
    private func makeShadowLayer() -> CALayer {
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 6
        shadowLayer.shadowPath = UIBezierPath(rect: squareView.bounds).cgPath
        return shadowLayer
    }
    
    private func addLayersToView() {
        gradientLayer?.removeFromSuperlayer()
        shadowLayer?.removeFromSuperlayer()
        gradientLayer = makeGradientLayer()
        shadowLayer = makeShadowLayer()
        squareView.layer.addSublayer(shadowLayer!)
        squareView.layer.addSublayer(gradientLayer!)
    }
}

