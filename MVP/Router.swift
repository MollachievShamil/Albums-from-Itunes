//
//  Router.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func firstVC()
    func secondVC()
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol){
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func firstVC() {
        if let navigationController = navigationController {
            guard let firstVC = assemblyBuilder?.createFirst(router: self) else {return}
            navigationController.viewControllers = [firstVC]
        }
    }
    
    func secondVC() {
        if let navigationController = navigationController {
            guard let secondVC = assemblyBuilder?.createSecond(router: self) else {return}
            navigationController.pushViewController(secondVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
   
}
