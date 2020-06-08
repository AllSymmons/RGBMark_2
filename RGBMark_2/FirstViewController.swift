//
//  ViewController.swift
//  RGBMark_2
//
//  Created by Александр Бехтер on 07.06.2020.
//  Copyright © 2020 Alexander Bekhter. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! SecondViewController
         viewController.viewColor = self.view.backgroundColor
         viewController.colorDelegate = self
                
            }
        }

//MARK: EXTENSION

        extension FirstViewController : CurrentColorDelegate {
            func setCurrentColor(_ color: UIColor) {
            view.backgroundColor = color
            }
        }
