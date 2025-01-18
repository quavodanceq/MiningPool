//
//  MainPresenter.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 18.01.2025.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
	func viewLoaded()
}

class MainPresenter: MainPresenterProtocol {
	weak var view: MainViewProtocol?
	var dataManager: MainDataManagerProtocol
	
	init(view: MainViewProtocol, dataManager: MainDataManagerProtocol) {
		self.view = view
		self.dataManager = dataManager
	}
	
	func viewLoaded() {
		
	}
}
