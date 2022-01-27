//
//  Assembly.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation
import UIKit


protocol AssemblyBuilderProtocol {
    func createFirst(router: RouterProtocol) -> UIViewController
    func createSecond(router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createFirst(router: RouterProtocol) -> UIViewController {
        let view = FirstVC()
        let presenter = FirstPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSecond(router: RouterProtocol) -> UIViewController {
        let view = SecondVC()
        let presenter = SecondPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}
