//
//  File.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 19.01.2025.
//

import Foundation

class AutoScrollingScrollView: UIScrollView {
	
	private var scrollSpeed: CGFloat = 1.0 // Adjust the speed of scrolling
	private var isScrolling: Bool = false
	private var displayLink: CADisplayLink?
	private let images = ["kas", "launchpad", "bybit", "dao","kas", "launchpad", "bybit", "dao","kas", "launchpad","bybit","dao"]
	let numberOfElements = 12
	let elementWidth: CGFloat = 50
	let elementHeight: CGFloat = 50
	let spacing: CGFloat = 10
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupScrollView()
		for i in 0..<numberOfElements {
			let image = UIImageView(frame: CGRect(x: CGFloat(i) * (elementWidth + spacing), y: 0, width: elementWidth, height: elementHeight))
			image.image = UIImage(named: images[i])
			addSubview(image)
		}
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupScrollView()
	}
	
	private func setupScrollView() {
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		contentSize = CGSize(width: CGFloat(numberOfElements) * elementWidth + CGFloat(numberOfElements - 1) * spacing, height: elementHeight)
	}
	
	/// Start auto-scrolling horizontally
	func startAutoScrolling(speed: CGFloat = 1.0) {
		guard !isScrolling else { return }
		scrollSpeed = speed
		isScrolling = true
		
		// Use CADisplayLink for smooth scrolling
		displayLink = CADisplayLink(target: self, selector: #selector(handleScroll))
		displayLink?.add(to: .main, forMode: .default)
	}
	
	/// Stop auto-scrolling
	func stopAutoScrolling() {
		isScrolling = false
		displayLink?.invalidate()
		displayLink = nil
	}
	
	@objc private func handleScroll() {
		var newOffset = contentOffset
		newOffset.x += scrollSpeed
		
		// Reset to the start if we reach the end
		if newOffset.x >= contentSize.width - bounds.width {
			newOffset.x = 0
		}
		
		contentOffset = newOffset
	}
	
	deinit {
		stopAutoScrolling()
	}
}
