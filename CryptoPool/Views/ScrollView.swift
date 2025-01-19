//
//  ScrollView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 20.01.2025.
//

import Foundation
import UIKit

class SmoothHorizontalScrollView: UIScrollView {
	
	private var scrollSpeed: CGFloat = 50.0
	private var isScrolling: Bool = false
	private var displayLink: CADisplayLink?
	private var imageViews: [UIImageView] = []
	
	private let images = ["kas", "launchpad", "bybit", "dao","kas", "launchpad", "bybit", "dao","kas", "launchpad","bybit","dao"]
	
	let numberOfImages = 12
	let imageWidth: CGFloat = 50
	let imageHeight: CGFloat = 50
	let spacing: CGFloat = 20
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupScrollView()
		startAutoScrolling()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupScrollView()
	}
	
	private func setupScrollView() {
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		isPagingEnabled = false
		contentInsetAdjustmentBehavior = .never
		contentSize = CGSize(
			width: CGFloat(numberOfImages) * imageWidth + CGFloat(numberOfImages - 1) * spacing,
			height: imageHeight
		)
		for i in 0..<numberOfImages {
			let imageView = UIImageView(frame: CGRect(
				x: CGFloat(i) * (imageWidth + spacing),
				y: 0,
				width: imageWidth,
				height: imageHeight
			))
			imageView.image = UIImage(named: images[i])
			imageView.contentMode = .scaleAspectFit
			addSubview(imageView)
		}
		imageViews = Array(subviews.compactMap { $0 as? UIImageView })
	}
	
	func startAutoScrolling(speed: CGFloat = 50.0) {
		guard !isScrolling else { return }
		scrollSpeed = speed
		isScrolling = true
		displayLink = CADisplayLink(target: self, selector: #selector(handleScroll))
		displayLink?.add(to: .main, forMode: .default)
	}
	
	func stopAutoScrolling() {
		isScrolling = false
		displayLink?.invalidate()
		displayLink = nil
	}
	
	@objc private func handleScroll() {
		guard isScrolling else { return }
		let offsetIncrement = scrollSpeed * CGFloat(displayLink?.duration ?? 0)
		var newOffset = contentOffset
		newOffset.x += offsetIncrement
		
		if newOffset.x >= contentSize.width - bounds.width {
			newOffset.x = 0
			duplicateImages()
		}
		
		contentOffset = newOffset
	}
	
	private func duplicateImages() {
		let currentImageViews = imageViews
		var offsetX: CGFloat = contentSize.width
		
		for imageView in currentImageViews {
			let newImageView = UIImageView(frame: CGRect(
				x: offsetX,
				y: imageView.frame.origin.y,
				width: imageView.frame.width,
				height: imageView.frame.height
			))
			newImageView.image = imageView.image
			newImageView.contentMode = imageView.contentMode
			addSubview(newImageView)
			
			offsetX += newImageView.frame.width + 10
		}
		contentSize = CGSize(width: offsetX, height: bounds.height)
	}
	
	deinit {
		stopAutoScrolling()
	}
}
