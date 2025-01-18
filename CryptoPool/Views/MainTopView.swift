//
//  MainTopView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 18.01.2025.
//

import Foundation
import UIKit

class MainTopView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private var logo = UIImageView()
	
	private let label = UILabel()
	
	private let button = UIButton()
	
	private func setupLogo() {
		logo.image = UIImage(named: "logo")
		logo.translatesAutoresizingMaskIntoConstraints = false
		addSubview(logo)
	}
	
	private func setupLabel() {
		label.text = "Minerity\nProtocol"
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = UIFont(name: "GillSans-Bold", size: 12)!
		addSubview(label)
	}
	
	private func setupButton() {
		button.setTitle("Launch App", for: .normal)
		button.layer.cornerCurve = .continuous
		button.layer.cornerRadius = 13
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = UIFont(name: "Galvji-Bold", size: 12)!
		button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
		addSubview(button)
	}
	
	
	
	private func setup() {
		setupLogo()
		setupLabel()
		setupButton()
		backgroundColor = .customDark
		layer.cornerCurve = .continuous
		layer.cornerRadius = 22
		
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			
						logo.centerYAnchor.constraint(equalTo: centerYAnchor),
						logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
						logo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
						logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 0.6),
			
						label.centerYAnchor.constraint(equalTo: centerYAnchor),
						label.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 10),
			
						button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
						button.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
						button.widthAnchor.constraint(equalTo: button.titleLabel!.widthAnchor, constant: 20),
						button.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}
}
