//
//  AppDelegate.swift
//  Banky
//
//  Created by R on 1/28/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
  
  var window: UIWindow?
  
  let loginViewController = LoginViewController()
  let onBoardingContainerViewController = OnboardingContainerViewController()
  let dummyViewController = DummyViewController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    
    loginViewController.delegate = self
    onBoardingContainerViewController.delegate = self
    dummyViewController.logoutDelegate = self
    
    window?.rootViewController = loginViewController
//    window?.rootViewController = OnboardingContainerViewController()
//    window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Banky is faster, easier to use, and has a brand new look ansd feel that will make you feel like you are back in the 80's")
//    
    return true
  }
}


extension AppDelegate{
   
  func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
      guard animated, let window = self.window else {
          self.window?.rootViewController = vc
          self.window?.makeKeyAndVisible()
          return
      }

      window.rootViewController = vc
      window.makeKeyAndVisible()
      UIView.transition(with: window,
                        duration: 0.3,
                        options: .transitionCrossDissolve,
                        animations: nil,
                        completion: nil)
  }

  
}

extension AppDelegate: LoginViewControllerDelegate {
  func didLogin() {
    
    if LocalState.hasOnboarded{
      setRootViewController(dummyViewController)
    } else{
      setRootViewController(onBoardingContainerViewController)
    }
    
  }
  
}
extension AppDelegate: OnboardingContainerViewControllerDelegate {
  func didFinishOnboarding() {
    LocalState.hasOnboarded = true
    
    setRootViewController(dummyViewController)
  }
  
}
extension AppDelegate: LogoutDelegate{
  func didLogou() {
    setRootViewController(loginViewController)
  }
  
}


