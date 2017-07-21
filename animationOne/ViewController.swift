//
//  ViewController.swift
//  animationOne
//
//  Created by pari on 21/07/17.
//  Copyright © 2017 pari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewObject: UIView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    var effect = UIVisualEffect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effect=visualEffectView.effect!
        visualEffectView.effect=nil
        
        viewObject.layer.cornerRadius=5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func animateIn(){
        self.view.addSubview(viewObject)
        viewObject.center=self.view.center
        viewObject.transform=CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        viewObject.alpha=0
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.viewObject.alpha=1
            self.viewObject.transform=CGAffineTransform.identity
            self.visualEffectView.effect=self.effect
        })
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewObject.transform=CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.viewObject.alpha=0
            self.visualEffectView.effect=nil
            
        }){(sucess:Bool)in
            self.viewObject.removeFromSuperview()
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        animateIn()
    }

    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

