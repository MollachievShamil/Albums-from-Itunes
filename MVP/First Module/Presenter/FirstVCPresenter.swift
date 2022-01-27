//
//  FirstVCPresenter.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation

protocol FirstViewProtocol: AnyObject {
    func setPlaceholders(login: String)
    
}

protocol FirstPresenterProtocol: AnyObject{
    init(view: FirstViewProtocol, router: RouterProtocol)
    func checkUser(mail: String?, password: String?)
    func goToRegistrationVC()
}


class FirstPresenter: FirstPresenterProtocol {
    
    
    weak var view: FirstViewProtocol?
    let router: RouterProtocol?
    let user1 = User(firstName: "1", secondName: "1", phone: "1", email: "1", password: "1", age: "1")
    var users = [User]()
    
    required init(view: FirstViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func checkUser(mail: String?, password: String?) {

        users.append(user1)

        for user in users{
            if user.email == mail && user.password == password{
                view?.setPlaceholders(login: "Ok")
            } else if user.email == mail && user.password != password{
                view?.setPlaceholders(login: "Wrong password")
            } else {
                view?.setPlaceholders(login: "User not found")
            }
    }
    }
    
    
    func goToRegistrarionVC() {
        router?.secondVC()
    }
    
    
    
    
}
