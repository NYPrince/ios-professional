//
//  MainViewController.swift
//  Banky
//
//  Created by R on 2/16/24.
//

import UIKit

class MainViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupTabBar()
    
  }
  
  private func setupView() {
    let summaryVC = AccountSummaryViewController()
    let moneyVC = MoveMoneyViewController()
    let moreVC = MoreViewController()
    
    summaryVC.setTabBarImage(imageName: "list.dash.header.reactangle", title: "Summary")
    moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
    moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")
    
    let summaryNC = UINavigationController(rootViewController: summaryVC)
    let moneyNC = UINavigationController(rootViewController: moneyVC)
    let moreNC = UINavigationController(rootViewController: moreVC)
    
    summaryNC.navigationBar.barTintColor = appColor
    hidesNavigationBarLine(summaryNC.navigationBar)
    
    let tabBarList = [summaryNC, moneyNC, moreNC]
    
    viewControllers = tabBarList
    
  }
  
  private func hidesNavigationBarLine(_ navigationBar: UINavigationBar ){
    let img = UIImage()
    navigationBar.shadowImage = img
    navigationBar.setBackgroundImage(img, for: .default)
    navigationBar.isTranslucent = false
    
  }
  private func setupTabBar() {
    tabBar.tintColor = appColor
    tabBar.isTranslucent = false
  }
}

class AccountSummaryViewController: UIViewController{
  override func viewDidLoad() {
    view.backgroundColor = .systemGreen
  }
}
class MoveMoneyViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemMint
  }
}

class MoreViewController: UIViewController {
  override func viewDidLoad() {
    view.backgroundColor = .systemPurple
  }
  
}
