//
//  InfoView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 19.01.2025.
//

import Foundation
import UIKit

class InfoView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private let autoScrollView = SmoothHorizontalScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
	
	private let background = UIImageView()
	
	private let majorLabel = UILabel()
	
	private let minorLabel = UILabel()
	
	private let stakedView = StakedView()
	
	private let trustedView = TrustedView()
	
	private func setupBackground() {
		background.image = UIImage(named: "mainBG")
		background.translatesAutoresizingMaskIntoConstraints = false
		addSubview(background)
	}
	
	private func setupMajorLabel() {
		majorLabel.font = UIFont(name: "HoeflerText-Black", size: 45)!
		majorLabel.textColor = .white
		majorLabel.numberOfLines = 2
		majorLabel.text = "MINE YOUR\nYIELD TODAY"
		majorLabel.textAlignment = .center
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
		addSubview(minorLabel)
	}
	
	private func setup() {
		setupBackground()
		setupMajorLabel()
		setupMinorLabel()
		addSubview(autoScrollView)
		autoScrollView.translatesAutoresizingMaskIntoConstraints = false
		stakedView.translatesAutoresizingMaskIntoConstraints = false
		trustedView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(trustedView)
		addSubview(stakedView)
		setupConstraints()
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			background.heightAnchor.constraint(equalTo: heightAnchor),
			background.widthAnchor.constraint(equalTo: widthAnchor)
		])
		
		NSLayoutConstraint.activate([
			majorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			majorLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			majorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			majorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
		
		NSLayoutConstraint.activate([
			minorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			minorLabel.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 5),
			minorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
			minorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
		])
		
		NSLayoutConstraint.activate([
			autoScrollView.topAnchor.constraint(equalTo: minorLabel.bottomAnchor, constant: 70),
			autoScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
			autoScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
			autoScrollView.heightAnchor.constraint(equalToConstant: 50)
		])
		
		NSLayoutConstraint.activate([
			stakedView.topAnchor.constraint(equalTo: autoScrollView.bottomAnchor, constant: 50),
			stakedView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stakedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
			stakedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
		])
		
		NSLayoutConstraint.activate([
			trustedView.topAnchor.constraint(equalTo: autoScrollView.bottomAnchor, constant: 50),
			trustedView.trailingAnchor.constraint(equalTo: trailingAnchor),
			trustedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
			trustedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
		])
	}
	
}




