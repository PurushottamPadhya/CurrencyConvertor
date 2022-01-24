//
//  CurrencyViewController.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 25/1/22.
//


import UIKit
import DropDown


class CurrencyViewController: UIViewController {

    @IBOutlet weak var currencyFromLabel: UILabel!
    @IBOutlet weak var currencyFromDropDownBtn: UIButton!
    @IBOutlet weak var currencyFromInputField: UITextField!
    
    @IBOutlet weak var currencyInterchangeBtn: UIButton!
    
    
    @IBOutlet weak var currencyToLabel: UILabel!
    @IBOutlet weak var currencyToDropDownBtn: UIButton!
    @IBOutlet weak var currencyToOutputLabel: UILabel!
    
    @IBOutlet weak var convertBtn: UIButton!
    
    let dropDown = DropDown()
    
    var viewModel: CurrencyViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.viewModel = APICurrencyViewModel()
        self.bindUI()
        self.viewModel?.getRates()
    }
    private func bindUI(){
        self.viewModel?.isLoaderHidden.bind({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel?.alertMessage.bind({ [weak self] in
            self?.showAlertWith(message: $0)
        })
        self.viewModel?.rates.bind({ [weak self] in
            if let rate = $0 {
//                print(rate.data.brands.wbc.portfolios.fx.products.usd.productID)
                let p_id = rate.data.brands.wbc.portfolios.fx.products.usd.productID
                let buyingRate = rate.data.brands.wbc.portfolios.fx.products.usd.rates.usd.buyTC
                let sellingRate = rate.data.brands.wbc.portfolios.fx.products.usd.productID
                let test = rate.data.brands.wbc.portfolios.fx.products.usd.productID
                self?.currencyFromLabel.text = "\(p_id)"
                self?.currencyToOutputLabel.text = "\(test)"

        
            }
        })
//        self.viewModel?.products.bind({ [weak self] in
//            if let product = $0 {
////                print(rate.data.brands.wbc.portfolios.fx.products.usd.productID)
//                let p_id = product.usd.productID
//                let buyingRate = product.usd.rates.usd.buyTC
//                let sellingRate = product.usd.productID
//                print("buying price is \(buyingRate)   Selling Price \(sellingRate)")
//                self?.currencyFromLabel.text = "\(p_id)"
//                self?.currencyToOutputLabel.text = "\(buyingRate)"
//            }
//        })
        
    }
    @IBAction func dropDownFromBtnAction(_ sender: UIButton) {
//        if let products = viewModel?.products.value{
//            print(products.allKey)
//            dropDown.dataSource = products.allKeys
//        }
//        dropDown.dataSource = viewModel?.products.value?.allKeys
        dropDown.dataSource = ["AU", "US", "NP", "NZ"]
        dropDown.anchorView = sender
        dropDown.bottomOffset = CGPoint(x:0, y:sender.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = {[weak self](index: Int, item: String) in
            guard let _ = self else{return}
//            sender.setTitle(item, for: .normal)
            self?.currencyFromLabel.text = item
        }
                                        
    }
    
    @IBAction func currencyConvertBtnAction(_ sender: Any) {
        
        
    }
    

}
