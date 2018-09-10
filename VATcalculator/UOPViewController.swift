//
//  UOPViewController.swift
//  VATcalculator
//
//  Created by Przemyslaw Biskup on 13/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

class UOPViewController: UIViewController {

    @IBOutlet private weak var CKPTextField: UITextField!
    @IBOutlet private weak var bruttoTextField: UITextField!
    @IBOutlet private weak var nettoTextField: UITextField!
//    @IBOutlet private weak var rekaTextField: UITextField!
//    @IBOutlet private weak var texTextField: UITextField!
//    @IBOutlet private weak var zusTextField: UITextField!
    
    lazy var presenter: UOPPresenter = {
        return UOPPresenter(view: self)
    }()
    
//    @IBAction func bruttoAction(_ sender: UITextField) {
//        presenter.brutto = Double(sender.text ?? "0") ?? 0.0
//    }
    @IBAction func bruttoAction(_ sender: UITextField) {
        presenter.brutto = Double(sender.text ?? "0") ?? 0.0
    }
//    @IBAction func nettoAction(_ sender: UITextField) {
//        presenter.netto = Double(sender.text ?? "0") ?? 0.0
//    }
//    @IBAction func rekaAction(_ sender: UITextField) {
//        presenter.reka = Double(sender.text ?? "0") ?? 0.0
//    }
//    @IBAction func texAction(_ sender: UITextField) {
//        presenter.TEX = Double(sender.text ?? "0") ?? 0.0
//    }
//    @IBAction func zusAction(_ sender: UITextField) {
//        presenter.ZUS = Double(sender.text ?? "0") ?? 0.0
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension UOPViewController: ViewProtocol {
    func reload() {
        CKPTextField.text = "\(presenter.CKP.intiger)"
        bruttoTextField.text = "\(presenter.brutto.intiger)"
        nettoTextField.text = "\(presenter.netto.intiger)"
    }
}
