//
//  MainModuleBuilder.swift
//  CryptoPool
//
//  Created by Куат Оралбеков on 18.01.2025.
//

import Foundation
import UIKit

class MainModuleBuilder {
	
	static func build() -> UIViewController {
		let viewController = MainViewController()
		let dataManager = MainDataManager()
		let presenter = MainPresenter(view: viewController, dataManager: dataManager)
		viewController.presenter = presenter
		return viewController
	}
	
}
