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
	
	private let mainTopView = MainTopView()
	
	private let infoView = InfoView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewLoaded()
		view.backgroundColor = .green
		setupViews()
		setupConstraints()
	}
	
	private func setupNavigationBar() {
		let view = UIView()
		view.backgroundColor = .red
		
	}
	
	private func setupViews() {
		mainTopView.translatesAutoresizingMaskIntoConstraints = false
		infoView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(infoView)
		view.addSubview(mainTopView)
		
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			mainTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainTopView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
			mainTopView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
			mainTopView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
		NSLayoutConstraint.activate([
			infoView.topAnchor.constraint(equalTo: view.topAnchor),
			infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			infoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
		])
	}
	
}
