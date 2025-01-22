//
//  MainViewProtocol.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 18.01.2025.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
	
}

class MainViewController: UIViewController, MainViewProtocol {
	
	var presenter: MainPresenterProtocol!
	
	private let scrollView = UIScrollView()
	
	private let contentView = UIView()
	
	private let mainTopView = MainTopView()
	
	private let infoView = InfoView()
	
	private let depositView = DepositView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewLoaded()
		setupViews()
	}
	
	private func setupViews() {
		
		setupScrollView()
		setupConstraints()
	}
	
	private func setupScrollView() {
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		scrollView.isScrollEnabled = true
		scrollView.showsHorizontalScrollIndicator = true
		scrollView.contentInsetAdjustmentBehavior = .never
		contentView.addSubview(infoView)
		contentView.addSubview(depositView)
		contentView.addSubview(mainTopView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		contentView.translatesAutoresizingMaskIntoConstraints = false
		mainTopView.translatesAutoresizingMaskIntoConstraints = false
		depositView.translatesAutoresizingMaskIntoConstraints = false
		infoView.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
		])

		NSLayoutConstraint.activate([
			mainTopView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
			mainTopView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			mainTopView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
			mainTopView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.06)
			
		])
		
		NSLayoutConstraint.activate([
			infoView.topAnchor.constraint(equalTo: contentView.topAnchor),
			infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			infoView.heightAnchor.constraint(equalToConstant: view.frame.height)
		])
		
		NSLayoutConstraint.activate([
			depositView.topAnchor.constraint(equalTo: infoView.bottomAnchor),
			depositView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			depositView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			depositView.heightAnchor.constraint(equalToConstant: view.frame.height),
			depositView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
	
}
