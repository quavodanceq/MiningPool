//
//  DiamondView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 22.01.2025.
//

import Foundation
import UIKit

class DiamondView: UIView {
	
	private let nameLabel = UILabel()
	
	private let infoLabel = UILabel()
	
	private let percentageLabel = UILabel()
	
	private let imageView = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setup() {
		layer.cornerCurve = .continuous
		layer.cornerRadius = 15
		backgroundColor = .red
		alpha = 1
		//setupBackround()
		setupNameLabel()
		setupInfoLabel()
		setupPercentageLabel()
		setupImageView()
		setupConstraints()
	}
	
	private func setupBackround() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
		gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
		gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
		gradientLayer.frame = bounds
		layer.addSublayer(gradientLayer)
	}
	
	private func setupNameLabel() {
		nameLabel.textColor = .white
		nameLabel.text = "DIAMOND"
		nameLabel.font = UIFont(name: "Georgia-Bold", size: 30)!
		nameLabel.textAlignment = .left
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(nameLabel)
	}
	
	private func setupInfoLabel() {
		
		let text = "48 months Lock-up"
		
		// Create an NSMutableAttributedString
		let attributedString = NSMutableAttributedString(string: text)
		
		// Apply a color to the first word
		let range1 = (text as NSString).range(of: "48 months")
		attributedString.addAttribute(.foregroundColor, value: UIColor.green, range: range1)
		
		// Apply a different color to the second word
		let range2 = (text as NSString).range(of: "Lock-up")
		attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: range2)
		
		// Set the attributed string to the label
		infoLabel.attributedText = attributedString
		
		infoLabel.font = UIFont(name: "Georgia-Bold", size: 20)!
		infoLabel.textAlignment = .left
		
		infoLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(infoLabel)

	}
	
	private func setupPercentageLabel() {
		
	}
	
	private func setupImageView() {
		
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
		
		NSLayoutConstraint.activate([
			infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
			infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
	}
	
}
