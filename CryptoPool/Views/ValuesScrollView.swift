//
//  ValuesScrollView.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 20.01.2025.
//

import Foundation
import UIKit

class ValuesScrollView: UIScrollView {
	
	private var scrollSpeed: CGFloat = 50.0
	private var isScrolling: Bool = false
	private var displayLink: CADisplayLink?
	private var views: [UIView] = [StakedView()]
	
	private let images = [StakedView()]
	
	let numberOfViews = 1
	let imageWidth: CGFloat = 400
	let imageHeight: CGFloat = 120
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
			width: CGFloat(numberOfViews) * imageWidth + CGFloat(numberOfViews - 1) * spacing,
			height: imageHeight
		)
		for i in 0..<numberOfViews {
			let view = views[i]
			view.frame = CGRect(
				x: CGFloat(i) * (imageWidth + spacing),
				y: 0,
				width: imageWidth,
				height: imageHeight
			)
			addSubview(view)
		}
		views = Array(subviews.compactMap { $0 as? UIView })
	}
	
	func startAutoScrolling(speed: CGFloat = 50.0) {
		guard !isScrolling else { return }
		scrollSpeed = speed
		isScrolling = true
		displayLink = CADisplayLink(target: self, selector: #selector(handleScroll))
		displayLink?.add(to: .main, forMode: .common)
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
		let currentImageViews = views
		var offsetX: CGFloat = contentSize.width
		
		for imageView in currentImageViews {
			let newImageView = imageView
			addSubview(newImageView)
			
			offsetX += newImageView.frame.width + 10
		}
		contentSize = CGSize(width: offsetX, height: bounds.height)
	}
	
	deinit {
		stopAutoScrolling()
	}
}
