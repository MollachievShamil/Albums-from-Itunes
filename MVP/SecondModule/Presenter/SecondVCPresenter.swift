//
//  SecondVCPresenter.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation
import UIKit

protocol SecondViewProtocol: AnyObject {
    func showResultOfRegistration(text: String)
    func showAlert()
    func setPhoneLabeText(text: String, color: UIColor)
}

protocol SecondPresenterProtocol: AnyObject {
    init(view: SecondViewProtocol, router: RouterProtocol)
    func singUpTapped(firstNameText: String, secondNameText: String, emailText: String, passwordText: String, phoneText: String)
    func setTextFieald(textField: UITextField, label: UILabel, validType: String.ValidTypes , validMassege: String, wrongMassege: String, string: String, range: NSRange)
    func setPhoneMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String 
   
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
            // router go to next VC

        } else {
            view?.showAlert()
        }
        
    }
 
    func setTextFieald(textField: UITextField, label: UILabel, validType: String.ValidTypes , validMassege: String, wrongMassege: String, string: String, range: NSRange){
       
//        if string.isValid(validType: validType){
//            print("+")
//        } else {
//            print("-")
//        }
//
       let text = (textField.text ?? "") + string
       let result: String
       
       if range.length == 1 {
           let end = text.index(text.startIndex, offsetBy: text.count - 1)
           result = String(text[text.startIndex..<end])
           print(result)
       } else{
           result = text
       }
       
       textField.text = result
       print(result)
       
       if result.isValid(validType: validType) {
           label.text = validMassege
           label.textColor = .green
       }else{
           label.text = wrongMassege
           label.textColor = .red
           label.numberOfLines = 0
       }

   }
    

    func setPhoneMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        
        let text = textField.text ?? ""
        
        let phone = (text as! NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        
        if result.count == 18 {
            view?.setPhoneLabeText(text: "Phone is valid", color: .green)

        } else {
            view?.setPhoneLabeText(text: "Phone is not valid", color: .red)

        }
        return result
    }
    
}
