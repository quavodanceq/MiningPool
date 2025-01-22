//
//  DepositView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 22.01.2025.
//

import Foundation
import UIKit

class DepositView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private let background = UIImageView()
	
	private let majorLabel = UILabel()
	
	private let diamondView = DiamondView()
	
	private let minorLabel = UILabel()
	
	private func setupBackground() {
		background.image = UIImage(named: "depositBackground")
		background.translatesAutoresizingMaskIntoConstraints = false
		addSubview(background)
	}
	
	private func setupMajorLabel() {
		majorLabel.font = UIFont(name: "HoeflerText-Black", size: 45)!
		majorLabel.textColor = .white
		majorLabel.numberOfLines = 3
		majorLabel.text = "CHOOSE\nTHE BEST\nDEPOSIT"
		majorLabel.textAlignment = .left
		majorLabel.translatesAutoresizingMaskIntoConstraints = false
		addSubview(majorLabel)
	}
	
	private func setupMinorLabel() {
		minorLabel.font = UIFont(name: "Georgia", size: 15)!
		minorLabel.textColor = .gray
		minorLabel.numberOfLines = 0
		minorLabel.text = "You can invest your funds in Minerity Protocol via\nMinerity app, based on a shared mining power\nand AI system, which help to determine the most\nprofitable pools."
		minorLabel.textAlignment = .center
		minorLabel.translatesAutoresizingMaskIntoConstraints = false
//		addSubview(minorLabel)
	}
	
	private func setup() {
		setupBackground()
		setupMajorLabel()
		setupMinorLabel()
		diamondView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(diamondView)
		bringSubviewToFront(diamondView)
		diamondView.layer.zPosition = 1
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			background.heightAnchor.constraint(equalTo: heightAnchor),
			background.widthAnchor.constraint(equalTo: widthAnchor)
		])
		
		NSLayoutConstraint.activate([
			majorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			majorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			majorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
		
		NSLayoutConstraint.activate([
			diamondView.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 10),
			diamondView.centerXAnchor.constraint(equalTo: centerXAnchor),
			diamondView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			diamondView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
			diamondView.widthAnchor.constraint(equalToConstant: 150),
			diamondView.heightAnchor.constraint(equalToConstant: 150)
		])
	}
}
