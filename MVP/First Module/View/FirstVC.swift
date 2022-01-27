//
//  ViewController.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import UIKit

class FirstVC: UIViewController {

    var presenter: FirstPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        view.backgroundColor = .green
       
        
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("dfdfd", for: .normal)
        button.addTarget(self, action: #selector(goToSecondVc), for: .touchUpInside)
        view.addSubview(button)
        button.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
        return button
    }
    
    @objc func goToSecondVc() {
        presenter.tapOnGoToSecondVC()
    }


    func somethingHappend() {
        presenter.presenterDoSomething()
    }
}

extension FirstVC: FirstViewProtocol {
    func viewDoSomething() {
        //do something
    }
    
    
    
}

