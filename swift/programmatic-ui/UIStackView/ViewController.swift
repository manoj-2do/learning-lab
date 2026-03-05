//
//  ViewController.swift
//  UIStackView
//
//  Created by Manoj 2DO on 05/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    var titleLabel  = UILabel()
    var stackView   = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureStackView()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis          = .vertical
        stackView.distribution  = .fillEqually
        stackView.spacing       = 20
        
        addButtonsToStackView()
        setStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 5
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(button)
        }
    }

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints                                                            = false
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive                        = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive     = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive  = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive      = true
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text                         = "UI Stack View Tutorial"
        titleLabel.font                         = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment                = .center
        titleLabel.numberOfLines                = 0
        titleLabel.adjustsFontSizeToFitWidth    = true
        
        setTitleLabelConstraints()
    }
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints                                                            = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive             = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive     = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive  = true
    }

}

