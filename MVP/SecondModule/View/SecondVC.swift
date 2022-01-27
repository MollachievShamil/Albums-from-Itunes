//
//  SecondVC.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import UIKit

class SecondVC: UIViewController {

    var presenter: SecondPresenterProtocol!
    
    let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("dfdfd", for: .normal)
        button.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(button1)
        button1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
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

