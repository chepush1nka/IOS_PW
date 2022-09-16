//
//  ViewController.swift
//  pvvyaltsevPW1
//
//  Created by Павел Вяльцев on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsColors()
    }

    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        var set = getViewsColors()
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = set.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
        }
    }
    
    func getViewsColors() -> Set<UIColor> {
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        return set
    }
    
    func setViewsColors() {
        var set = getViewsColors()
        for view in self.views {
            view.layer.cornerRadius = 10
            view.backgroundColor = set.popFirst()
        }
    }
}

