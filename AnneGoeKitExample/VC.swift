//
//  ViewController.swift
//  AnneGoeKitExample
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import UIKit
import AnneGeoKit

protocol VCDI: UIViewController{
    
    associatedtype SomeV: V
    associatedtype SomeVM: VM

    var v: SomeV {get set}
    var vm: SomeVM {get set}
    
    init()
}

extension VCDI{
    func setView(){
        self.view.addSubview(v)
    }
    
    func setupAlertBinder() {
        self.vm.showAlerts.bind { [weak self] alertKind in

            switch alertKind{
            case .one(let desc, let btnText, let action):
                self?.showAlertViewForOneButton(title: "", message: desc, btnText: btnText, handler: action)
                break
            case .two(let desc, let btnText, let actionBtnText, let action1, let acttion2):
                self?.showAlertView(title: "", message: desc, btnTextes: [btnText, actionBtnText], handlers: [action1, acttion2])
                break
            case .twoWithTextField(let desc, let btnText, let actionBtnText, let placeHolder, let isSecureTextEntry, let action1, let acttion2):
                self?.showAlertTextFieldView(title: "", message: desc, btnTextes: [btnText, actionBtnText], handlers: [action1, acttion2], placeHolder: placeHolder, isSecureTextEntry: isSecureTextEntry)
                break
            default:
                break
            }
        }
        
        self.vm.isClearAlerts.bind { [weak self] v in
            if v {
//                self?.removeAlert {}
            }
        }
    }
}

class VC: UIViewController, VCDI {

    typealias SomeV = Child_V
    typealias SomeVM = Child_VM
    
    var v = Child_V()
    var vm = Child_VM()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class Child_V: UIView, V{
    init(){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = UIColor(red: CGFloat(Int.random(in: 0...255)), green: CGFloat(Int.random(in: 0...255)), blue: CGFloat(Int.random(in: 0...255)), alpha: 1)
        
        
        let btn = VTN()
        btn.akg.makeFrame { maker in
            maker.x = 100
            maker.y = 100
            maker.w = 100
            maker.h = 100
            maker.backColor = .yellow
        }
        btn.accessibilityLabel = "btn"
        self.addSubview(btn)
        
        
        
    }
    
    @objc private func tapped(sender: UIButton){
//        let vc = Child_V()
//        vc.alpha = 0
//        self.addSubview(vc)
//
//        UIView.animate(withDuration: 2) {
//            vc.alpha = 1
//        }
        
        print("tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Child_VM: VM{
    
}

