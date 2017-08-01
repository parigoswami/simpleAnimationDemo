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
    
    @IBOutlet weak var textField: UITextField!
    
    var returnedText : String = " "
    var effect = UIVisualEffect()
    
    var myArr=Array<Any>()
    
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
        returnedText=textField.text!
        animateOut()
        print("_______________rturnedText is : ",(returnedText))
        myArr.append(returnedText)
        print("______myArr is ",myArr)
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.clearsOnBeginEditing = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondvc : myTableViewController = segue.destination as! myTableViewController
        secondvc.tempArr = myArr
        secondvc.tempString=returnedText
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

