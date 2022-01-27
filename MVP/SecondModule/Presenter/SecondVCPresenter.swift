//
//  SecondVCPresenter.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation

protocol SecondViewProtocol: AnyObject {
    func showResultOfRegistration(text: String)
    func showAlert()
}

protocol SecondPresenterProtocol: AnyObject {
    init(view: SecondViewProtocol, router: RouterProtocol)
    func singUpTapped(firstNameText: String, secondNameText: String, emailText: String, passwordText: String, phoneText: String)
   
}

class SecondPresenter: SecondPresenterProtocol {
    
    weak var view: SecondViewProtocol?
    let router: RouterProtocol?
    
    required init(view: SecondViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    let nameValidType: String.ValidTypes = .name
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password
   
    func singUpTapped(firstNameText: String, secondNameText: String, emailText: String, passwordText: String, phoneText: String){
        
        if firstNameText.isValid(validType: nameValidType)
            && secondNameText.isValid(validType: nameValidType)
            && emailText.isValid(validType: emailValidType)
            && passwordText.isValid(validType: passwordValidType)
            && phoneText.count == 18 {
            
            // add in data base
            view?.showResultOfRegistration(text: "Registration complite")
            
            print("+")
        } else {
            view?.showAlert()
        }
        
    }
 
    

}
