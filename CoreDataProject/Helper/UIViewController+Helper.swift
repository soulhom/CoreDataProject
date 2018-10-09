//
//  UIViewController+Helper.swift
//  CoreDataProject
//
//  Created by GetHired on 10/2/18.
//  Copyright © 2018 GetHired. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupPlusButtonInNavBar(selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: selector)
    }
    
    func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelModal))
    }
    
    @objc func handleCancelModal() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLightBlueBackgorundview(height: CGFloat) -> UIView{
        let lightBlueBackgroudView = UIView()
        lightBlueBackgroudView.backgroundColor = UIColor.lightBlue
        lightBlueBackgroudView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroudView)
        lightBlueBackgroudView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroudView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroudView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroudView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        return lightBlueBackgroudView
    }
}
