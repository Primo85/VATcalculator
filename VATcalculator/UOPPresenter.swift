//
//  UOPPresenter.swift
//  VATcalculator
//
//  Created by Przemyslaw Biskup on 13/07/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

final class UOPPresenter {
    
    private weak var view: ViewProtocol?
    
    init(view: ViewProtocol) {
        self.view = view
    }
    
    var CKP: Double {
        return brutto * (1 + 0.0976 + 0.065 + 0.0193 + 0.0245 + 0.001)
    }
    
    var brutto: Double = 0.0 {
        didSet {
            view?.reload()
            print(skl," ",sklZdr," ",ZnPD)
        }
    }
    
    var netto: Double {
        return brutto - skl - sklZdr - ZnPD
    }
    
    var naMiejscu: Bool = true
    
    
    
    
    
    private var doch: Double {
        return brutto - skl
    }
    private var dochP: Double {
        return doch - kosztyUzysk
    }
    
    private var kosztyUzysk: Double {
        return naMiejscu ? 111.25 : 139.06
    }
    private var skl: Double {
        return brutto * (0.0976 + 0.015 + 0.0245)
    }
    private var sklZdr: Double {
        return doch * 0.09
    }
    private var ZnPD: Double {
        return dochP * 0.18 - 46.33 - doch * 0.0775
    }
}
