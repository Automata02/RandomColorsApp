//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by roberts.kursitis on 27/10/2022.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    @IBOutlet weak var colorLabel: UILabel!
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? UIColor.systemBackground
        
        if (color != nil) {
            colorLabel.isHidden = false
            colorLabel.text = color?.toHexString()
            colorLabel.textColor = color?.inverted
            self.navigationController?.navigationBar.tintColor = color?.inverted
        } else {
            colorLabel.isHidden = true
            self.navigationController?.navigationBar.tintColor = UIColor.label
        }
    }
}

