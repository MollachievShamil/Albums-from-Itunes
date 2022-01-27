//
//  SecondVCPresenter.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation

protocol SecondViewProtocol {
    func viewDoSomething()
}

protocol SecondPresenterProtocol{
    init(view: SecondViewProtocol, router: RouterProtocol)
    func presenterDoSomething()
    func popToRoot()
}


class SecondPresenter: SecondPresenterProtocol {
    
    let view: SecondViewProtocol
    let router: RouterProtocol
    
    required init(view: SecondViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func presenterDoSomething() {
        
        view.viewDoSomething()
    }
    
    
    func popToRoot() {
        router.popToRoot()
    }
    
    
    
    
}
