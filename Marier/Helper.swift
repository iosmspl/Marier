//
//  Helper.swift
//  Marier
//
//  Created by MacBook M1 on 22/03/23.
//

import Foundation
import UIKit


class GrayBorderView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp(){
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        self.layer.borderWidth = 1
    }
}


class ThemeBorderButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp(){
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        self.layer.borderWidth = 1
    }
}

class ThemeButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp(){
        self.layer.cornerRadius = self.frame.height/2
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor(named: "buttonColor")
    }
}
