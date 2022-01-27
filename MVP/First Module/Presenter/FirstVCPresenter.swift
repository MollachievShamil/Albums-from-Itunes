//
//  FirstVCPresenter.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation

protocol FirstViewProtocol {
    func viewDoSomething()
    
}

protocol FirstPresenterProtocol{
    init(view: FirstViewProtocol, router: RouterProtocol)
    func presenterDoSomething()
    func tapOnGoToSecondVC()
}


class FirstPresenter: FirstPresenterProtocol {
    
    let view: FirstViewProtocol
    let router: RouterProtocol
    
    required init(view: FirstViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func presenterDoSomething() {
        // do something
      
        view.viewDoSomething()
    }
    
    func tapOnGoToSecondVC() {
        router.secondVC()
    }
    
    
    
}
