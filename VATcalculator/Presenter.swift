//
//  Presenter.swift
//  VATcalculator
//
//  Created by Przemyslaw Biskup on 05/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

protocol ViewProtocol: class {
    func reload()
}

final class Presenter {
    
    private weak var view: ViewProtocol?
    
    init(view: ViewProtocol) {
        self.view = view
    }
    
    private func reload() {
        view?.reload()
        print(brutto, " ", V, " ", VAT)
        print(netto, " ", P, " ", TEX)
        print(reka, " ", Z, " ", ZUS, "\n\n")
    }
    
    var netto : Double = 0.0 {
        didSet {
            reload()
        }
    }
    
    var brutto: Double {
        get {
            return netto * V
        }
        set {
            netto = newValue / V
        }
    }
    
    var reka: Double {
        get {
            return netto * P - Z
        }
        set {
            netto = (newValue + Z) / P
        }
    }
    
    var stal: Bool = true {
        didSet {
            reload()
        }
    }
    
    private var V: Double = 1.23
    private var P: Double = 0.81
    private var Z: Double {
        return stal ? ZUS : 0
    }
    
    var VAT: Double {
        get {
            return (V - 1) * 100
        }
        set {
            V = newValue / 100 + 1
            reload()
        }
    }
    
    var TEX: Double {
        get {
            return (1 - P) * 100
        }
        set {
            P = 1 - newValue/100
            reload()
        }
    }
    
    var ZUS: Double = 320 {
        didSet {
            reload()
        }
    }
}

extension Double {
    var intiger: Int {
        var x = Int(self)
        if Int(self * 10) % 10 > 5 {
            x += 1
        }
        return x
    }
}
