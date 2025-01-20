//
//  TrustedView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 20.01.2025.
//

import Foundation
import UIKit

class TrustedView: UIView {
	
	private let imageView = UIImageView()
	
	private let nameLabel = UILabel()
	
	private let valueLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setup() {
		setupImageView()
		setupNameLabel()
		setupValueLabel()
		setupConstraints()
	}
	
	private func setupImageView() {
		imageView.image = UIImage(named: "trusted")
		addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupNameLabel() {
		nameLabel.textColor = .white
		nameLabel.textAlignment = .left
		nameLabel.text = "TRUSTED VALUE:"
		nameLabel.font = UIFont(name: "GillSans-Bold", size: 12)!
		addSubview(nameLabel)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupValueLabel() {
		valueLabel.textColor = .white
		valueLabel.textAlignment = .left
		valueLabel.text = "$2000"
		valueLabel.font = UIFont(name: "GillSans-Bold", size: 20)!
		addSubview(valueLabel)
		valueLabel.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupConstraints() {
		
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
			imageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
			
		])
		
		NSLayoutConstraint.activate([
			nameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -10),
			nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
		
		NSLayoutConstraint.activate([
			valueLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 10),
			valueLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
			valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
	}
	
}
