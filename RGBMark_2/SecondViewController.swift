//
//  SecondViewController.swift
//  RGBMark_2
//
//  Created by Александр Бехтер on 07.06.2020.
//  Copyright © 2020 Alexander Bekhter. All rights reserved.
//

import UIKit

protocol CurrentColorDelegate {
    func setCurrentColor(_ color: UIColor)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var roundedView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var viewColor: UIColor!
    var colorDelegate: CurrentColorDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slidersValue(color: viewColor)

        self.roundedView.backgroundColor = viewColor
        self.roundedView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }
    
    // Изменение цветов слайдерами
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0: redLabel.text = string(from: sender)
        case 1: greenLabel.text = string(from: sender)
        case 2: blueLabel.text = string(from: sender)
        default: break
        }
        setColor()
    }

    
    private func slidersValue(color: UIColor) {
           redSlider.value = Float(color.components.red)
           greenSlider.value = Float(color.components.green)
           blueSlider.value = Float(color.components.blue)
       }
    
     private func setColor() {
        self.roundedView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        colorDelegate.setCurrentColor(roundedView.backgroundColor ?? .black)
              dismiss(animated: true)
    }
}

extension UIColor {
    var colorsComponents: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let colorValue = self.colorsComponents
        return (colorValue.red, colorValue.green, colorValue.blue, colorValue.alpha)
    }
}
