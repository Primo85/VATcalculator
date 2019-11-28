//
//  ViewController.swift
//  VATcalculator
//
//  Created by Przemyslaw Biskup on 05/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var bruttoTextField: UITextField!
    @IBOutlet private weak var vatTextField: UITextField!
    @IBOutlet private weak var nettoTextField: UITextField!
    @IBOutlet private weak var rekaTextField: UITextField!
    @IBOutlet private weak var texTextField: UITextField!
    @IBOutlet private weak var zusTextField: UITextField!
    @IBOutlet private weak var hoursTextField: UITextField!
    @IBOutlet private weak var rateTextField: UITextField!
    
    lazy var presenter: BTBPresenter = {
        return BTBPresenter(view: self)
    }()
    
    @IBAction func bruttoAction(_ sender: UITextField) {
        presenter.brutto = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func vatttoAction(_ sender: UITextField) {
        presenter.VAT = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func nettoAction(_ sender: UITextField) {
        presenter.netto = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func rekaAction(_ sender: UITextField) {
        presenter.reka = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func texAction(_ sender: UITextField) {
        presenter.TEX = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func zusAction(_ sender: UITextField) {
        presenter.ZUS = Double(sender.text ?? "0") ?? 0.0
    }
    @IBAction func hoursAction(_ sender: UITextField) {
        presenter.hours = Double(sender.text ?? "0") ?? 0.01
    }
    @IBAction func rateAction(_ sender: UITextField) {
        presenter.hourlyRate = Double(sender.text ?? "0") ?? 0.01
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension ViewController: ViewProtocol {
    func reload() {
        bruttoTextField.text = "\(presenter.brutto.intiger)"
        vatTextField.text = "\(presenter.VAT.intiger)"
        nettoTextField.text = "\(presenter.netto.intiger)"
        rekaTextField.text = "\(presenter.reka.intiger)"
        texTextField.text = "\(presenter.TEX.intiger)"
        zusTextField.text = "\(presenter.ZUS.intiger)"
        hoursTextField.text = "\(presenter.hours.intiger)"
        rateTextField.text = "\(presenter.hourlyRate.intiger)"
    }
}
