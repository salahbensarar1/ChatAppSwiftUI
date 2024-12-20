//
//  UIApplication+RootViewController.swift
//  ChatApp
//
//  Created by Salah Ben Sarar on 2024. 12. 12..
//


import Foundation
import UIKit

extension UIApplication {
  var currentKeyWindow: UIWindow? {
    UIApplication.shared.connectedScenes
      .compactMap { ($0 as? UIWindowScene)?.keyWindow }
      .first
  }

  var rootViewController: UIViewController? {
    currentKeyWindow?.rootViewController
  }
}
