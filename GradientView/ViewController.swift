//
//  ViewController.swift
//  GradientView
//
//  Created by Yernar Masujima on 01.05.2023.
//

import UIKit

final class ViewController: UIViewController {
	
	private let gradientLayer = CAGradientLayer()
	private let gradientView = UIView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
		
		setupGradientLayer()
		setupGradientView()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		gradientLayer.frame = gradientView.bounds
	}
	
	private func setupGradientLayer() {
		gradientLayer.colors = [UIColor.systemMint.cgColor, UIColor.systemOrange.cgColor]
		gradientLayer.cornerRadius = 13
		gradientLayer.startPoint = .init(x: 0.0, y: 0.0)
		gradientLayer.endPoint = .init(x: 1.0, y: 1.0)
	}
	
	private func setupGradientView() {
		gradientView.layer.shadowColor = UIColor.black.cgColor
		gradientView.layer.shadowOpacity = 0.3
		gradientView.layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
		gradientView.layer.shadowRadius = 10
		gradientView.layer.insertSublayer(gradientLayer, at: 0)
		gradientView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(gradientView)
		NSLayoutConstraint.activate([
			gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			gradientView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
			gradientView.widthAnchor.constraint(equalToConstant: 100),
			gradientView.heightAnchor.constraint(equalToConstant: 100)
		])
	}
}
