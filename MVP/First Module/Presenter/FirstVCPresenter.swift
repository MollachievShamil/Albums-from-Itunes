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
    func tapOnGoToSecondVC()
}


class FirstPresenter: FirstPresenterProtocol {
    
    
    weak var view: FirstViewProtocol?
    let router: RouterProtocol?
    let user1 = User(firstName: "1", secondName: "1", phone: "1", email: "1", password: "1")
    var users = [User]()
    
    required init(view: FirstViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func checkUser(mail: String?, password: String?) {

        users.append(user1)

        for user in users{
            if user.email == mail && user.password == password{
                view?.setPlaceholders(login: "ok")
            } else if user.email == mail && user.password != password{
                view?.setPlaceholders(login: "wrong password")
            } else {
                view?.setPlaceholders(login: "not found")
            }

//        if user == nil {
//            loginLabel.text = "user not found"
//            loginLabel.textColor = .red
//        } else if user?.password == password {
//            let navVC = UINavigationController(rootViewController: AlbumsViewController())
//            navVC.modalPresentationStyle = .fullScreen
//
//            guard let activeUser = user else { return }
//            DataBase.shared.saveActiveUser(user: activeUser)
//            self.present(navVC, animated: true)
//        } else {
//            loginLabel.text = "Wrong password"
//            loginLabel.textColor = .red
//        }
    }
    }
    func tapOnGoToSecondVC() {
        router?.secondVC()
    }
    
    
    
    
}
