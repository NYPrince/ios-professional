//
//  OnboardingViewController.swift
//  Banky
//
//  Created by R on 2/3/24.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  let stackView = UIStackView()
  
  let imageView = UIImageView()
  let label = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
    
  }
  
}

extension OnboardingViewController {
  
  func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    //image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "delorean")
    
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hey Rick"
    label.font = UIFont.preferredFont(forTextStyle: .title3)
    label.adjustsFontForContentSizeCategory = false
    label.numberOfLines = 0
    label.text = "Banky is the fastest , easiest to use, and as a brand look and feel that will make you feel like you're back in 1989"
  }
  func layout(){
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(label)
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
    
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
    
    ])
    
  }
  
}
