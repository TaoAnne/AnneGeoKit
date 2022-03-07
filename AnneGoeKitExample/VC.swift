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
}

class VC: UIViewController, VCDI {

    typealias SomeV = Child_V
    typealias SomeVM = Child_VM
    
    var v: Child_V = Child_V()
    var vm: Child_VM = Child_VM()
    
    required init() {
        super.init(nibName: nil, bundle: nil)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
}

