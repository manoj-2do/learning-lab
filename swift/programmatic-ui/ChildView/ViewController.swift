//
//  ViewController.swift
//  ChildView
//
//  Created by Manoj 2DO on 05/03/26.
//

import UIKit

class ViewController: UIViewController {
    let secondChildVC = SecondChildVC()
    
    enum Segues {
        static let toFirstChild = "ToFirstChild"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSecondChildVC()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toFirstChild {
            let destVC = segue.destination as! FirstChildVC
            destVC.view.backgroundColor = .blue
        }
    }
    
    //Adding child view -> Programmatically
    func addSecondChildVC() {
        addChild(secondChildVC)
        view.addSubview(secondChildVC.view)
        
        secondChildVC.view.backgroundColor = .systemCyan
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints()
    }
    
    func setSecondChildVCConstraints() {
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints                                                        = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive  = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive                     = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive                  = true
        secondChildVC.view.heightAnchor.constraint(equalToConstant: 200).isActive                                           = true
    }
    
    
}
