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

    var v: SomeV! {get set}
    var vm: SomeVM {get set}
    
    init()
    
    func bind()
}

extension VCDI{
    func setView(){
        self.view.addSubview(v)
    }
    
    func setupAlertBinder() {
        self.vm.showAlerts.bind { [weak self] alertKind in

            switch alertKind{
            case .one(let desc, let btnText, let action):
//                self?.showAlertViewForOneButton(title: "", message: desc, btnText: btnText, handler: action)
                break
            case .two(let desc, let btnText, let actionBtnText, let action1, let acttion2):
//                self?.showAlertView(title: "", message: desc, btnTextes: [btnText, actionBtnText], handlers: [action1, acttion2])
                break
            case .twoWithTextField(let desc, let btnText, let actionBtnText, let placeHolder, let isSecureTextEntry, let action1, let acttion2):
//                self?.showAlertTextFieldView(title: "", message: desc, btnTextes: [btnText, actionBtnText], handlers: [action1, acttion2], placeHolder: placeHolder, isSecureTextEntry: isSecureTextEntry)
                break
            default:
                break
            }
        }
        
        self.vm.isClearAlerts.bind { [weak self] v in
            if v {
//                self?.removeAlert {}
                
                //update
            }
        }
    }
    
    func bind(){
        self.setupAlertBinder()
    }
}

class VC: UIViewController, VCDI {
//    var v: Child_V!
    

    typealias SomeV = Child_V
    typealias SomeVM = Child_VM
    
    var v: Child_V! = Child_V()
    var vm = Child_VM()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        self.setView()
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//            self.btn.removeFromSuperview()
//            self.btn = nil
            self.v.removeFromSuperview()
            self.v = nil
        }
    }
    
}

class Btn: UIButton{
    deinit{
        print("Btn deinit")
    }
}

class Child_V: UIView, V{
    
    var btn: Btn!
    
    init(){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = UIColor(red: CGFloat(Int.random(in: 0...255)),
                                       green: CGFloat(Int.random(in: 0...255)),
                                       blue: CGFloat(Int.random(in: 0...255)), alpha: 1)
        
        
        btn = Btn()
        btn.agk.make { maker in
            maker.x.equalTo(amount: 100)
            maker.y.equalTo(amount: 100)
            maker.w.equalTo(amount: 100)
            maker.h.equalTo(amount: 100)
        }
        
//        btn.agk.endx
        
        btn.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
        btn.backgroundColor = .yellow
        self.addSubview(btn)
        
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
//            self.btn.removeFromSuperview()
//            self.btn = nil
//            self.removeFromSuperview()
        }
//
//
//        let label = UILabel()
//        label.akg.make { maker in
//            maker.fontData.setText(text: "테스트", isBold: true, fontSize: 10).equalTo(amount: <#T##CGFloat#>)
//        }
    }
    
    @objc private func tapped(sender: UIButton){
        print("tapped")
        
//        self.setv(vc: VC())
        
        btn.agk.make { maker in
            UIView.animate(withDuration: 3) {
                maker.h.equalTo(amount: 200)
            }
        }
    }
    
    private func setv(vc: VC){
        ////
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Child_VM: VM{
    
}

