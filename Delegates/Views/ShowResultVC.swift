//
//  ShowResultVC.swift
//  Delegates
//
//  Created by Esmeralda Angeles on 2/6/19.
//  Copyright © 2019 Profuturo. All rights reserved.
//

import UIKit

class ShowResultVC: UIViewController {
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func acShowOperations(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OperationVC") as! OperationVC
        vc.delegateToUse = self
        present(vc, animated: true, completion: nil)
    }
    
}

extension ShowResultVC: OperationVCDelegate{
    func operationFinished(result: Int) {
        lblResult.text = "\(result)"
        dismiss(animated: true, completion: nil)
    }
}

