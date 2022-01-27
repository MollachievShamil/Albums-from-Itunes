//
//  AlertOk.swift
//  MVP
//
//  Created by Шамиль Моллачиев on 27.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertOk(title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
