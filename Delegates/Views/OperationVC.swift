//
//  OperationVC.swift
//  Delegates
//
//  Created by Esmeralda Angeles on 2/6/19.
//  Copyright © 2019 Profuturo. All rights reserved.
//

import UIKit

class OperationVC: UIViewController {
    
    @IBOutlet weak var tfFistNumber: UITextField!
    @IBOutlet weak var tfSecondNumber: UITextField!
    
    @IBOutlet var arrOperation: [UIButton]!
    
    
    var delegateToUse: OperationVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkOperation()->Int{
        
        var result: Int!
        let n1 = Int(tfFistNumber.text!)
        let n2 = Int(tfSecondNumber.text!)
        
        for btn in arrOperation{
            if btn.isSelected{
                switch btn.tag {
                case 1:
                    result = n1! + n2!
                case 2:
                    result = n1! - n2!
                case 3:
                    result = n1! * n2!
                case 4:
                   result = n1! / n2!
                default:
                    break
                }
            }
        }
        return result
    }

    @IBAction func acSelectButton(_ sender: UIButton) {
        for btn in arrOperation{
            if btn.tag == sender.tag{
                btn.isSelected = true
            }else{
                btn.isSelected = false
            }
        }
    }
    
    @IBAction func acReturnResult(_ sender: UIButton) {
        let result = checkOperation()
        delegateToUse?.operationFinished(result: result)
        
    }
}

protocol OperationVCDelegate{
    func operationFinished(result: Int)
}
