//
//  SecondVC.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import UIKit

class SecondVC: UIViewController {

    var presenter: SecondPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        view.backgroundColor = .blue
    }
   
    func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("dfdfd", for: .normal)
        button.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        view.addSubview(button)
        button.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
        return button
    }

    @objc func popToRoot(){
        presenter.popToRoot()
    }
    
    func somethingHappend() {
        presenter.presenterDoSomething()
    }
}

extension SecondVC: SecondViewProtocol {
    func viewDoSomething() {
        //do something
    }
    
    
}

