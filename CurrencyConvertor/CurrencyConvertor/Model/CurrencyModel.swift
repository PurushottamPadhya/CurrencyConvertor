//
//  CurrencyModel.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 24/1/22.
//

import Foundation


enum CurrencyModel{


    // MARK: - Rate
    struct CurrencyRate: Codable {
        let apiVersion: String
        let status: Int
        let data: DataClass
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let brands: Brands

        enum CodingKeys: String, CodingKey {
            case brands = "Brands"
        }
    }

    // MARK: - Brands
    struct Brands: Codable {
        let wbc: Wbc

        enum CodingKeys: String, CodingKey {
            case wbc = "WBC"
        }
    }

    // MARK: - Wbc
    struct Wbc: Codable {
        let brand: String
        let portfolios: Portfolios

        enum CodingKeys: String, CodingKey {
            case brand = "Brand"
            case portfolios = "Portfolios"
        }
    }

    // MARK: - Portfolios
    struct Portfolios: Codable {
        let fx: Fx

        enum CodingKeys: String, CodingKey {
            case fx = "FX"
        }
    }

    // MARK: - Fx
    struct Fx: Codable {
        let portfolioID: String
        let products: Products

        enum CodingKeys: String, CodingKey {
            case portfolioID = "PortfolioId"
            case products = "Products"
        }
    }

    // MARK: - Products
    struct Products: Codable {
        let usd: Usd
        let eur: Eur
        let gbp: Gbp
        let nzd: Nzd
        let cny: Cny
        let aed: Aed
        let ars: Ars
        let bdt: Bdt
        let bnd: Bnd
        let brl: Brl
        let cad: CAD
        let chf: Chf
        let clp: Clp
        let dkk: Dkk
        let fjd: Fjd
        let hkd: Hkd
        let idr: Idr
        let inr: Inr
        let jpy: Jpy
        let krw: Krw
        let lkr: Lkr
        let myr: Myr
        let nok: Nok
        let pgk: Pgk
        let php: PHP
        let pkr: Pkr
        let sar: Sar
        let sbd: Sbd
        let sek: Sek
        let sgd: Sgd
        let thb: Thb
        let top: Top
        let twd: Twd
        let vnd: Vnd
        let vuv: Vuv
        let wst: Wst
        let xpf: Xpf
        let zar: Zar
        let xau: Xau
        let cnh: Cnh

        enum CodingKeys: String, CodingKey, CaseIterable {
            case usd = "USD"
            case eur = "EUR"
            case gbp = "GBP"
            case nzd = "NZD"
            case cny = "CNY"
            case aed = "AED"
            case ars = "ARS"
            case bdt = "BDT"
            case bnd = "BND"
            case brl = "BRL"
            case cad = "CAD"
            case chf = "CHF"
            case clp = "CLP"
            case dkk = "DKK"
            case fjd = "FJD"
            case hkd = "HKD"
            case idr = "IDR"
            case inr = "INR"
            case jpy = "JPY"
            case krw = "KRW"
            case lkr = "LKR"
            case myr = "MYR"
            case nok = "NOK"
            case pgk = "PGK"
            case php = "PHP"
            case pkr = "PKR"
            case sar = "SAR"
            case sbd = "SBD"
            case sek = "SEK"
            case sgd = "SGD"
            case thb = "THB"
            case top = "TOP"
            case twd = "TWD"
            case vnd = "VND"
            case vuv = "VUV"
            case wst = "WST"
            case xpf = "XPF"
            case zar = "ZAR"
            case xau = "XAU"
            case cnh = "CNH"
        }
        var allKeys: [String] {
                CodingKeys.allCases.map { $0.stringValue }
        }
    }

    // MARK: - Aed
    struct Aed: Codable {
        let productID: String
        let rates: AEDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - AEDRates
    struct AEDRates: Codable {
        let aed: ARSClass

        enum CodingKeys: String, CodingKey {
            case aed = "AED"
        }
    }

    // MARK: - ARSClass
    struct ARSClass: Codable {
        let currencyCode, currencyName, country, buyTT: String
        let sellTT: String
        let buyTC, buyNotes, sellNotes: BuyNotes
        let spotRateDateFmt: String
        let effectiveDateFmt, updateDateFmt: EDateFmt
        let lastupdated: Lastupdated

        enum CodingKeys: String, CodingKey {
            case currencyCode, currencyName, country, buyTT, sellTT, buyTC, buyNotes, sellNotes
            case spotRateDateFmt = "SpotRate_Date_Fmt"
            case effectiveDateFmt = "effectiveDate_Fmt"
            case updateDateFmt = "updateDate_Fmt"
            case lastupdated = "LASTUPDATED"
        }
    }

    enum BuyNotes: String, Codable {
        case empty = ""
        case nA = "N/A"
    }

    enum EDateFmt: String, Codable {
        case the20160901T080001841000 = "20160901T080001,84+10:00"
        case the20160901T085002111000 = "20160901T085002,11+10:00"
        case the20161011T151205921100 = "20161011T151205,92+11:00"
        case the20220125T080908671100 = "20220125T080908,67+11:00"
    }

    enum Lastupdated: String, Codable {
        case the0310PM11Oct2016 = "03:10 PM 11 Oct 2016"
        case the0801AM25Jan2022 = "08:01 AM 25 Jan 2022"
        case the0809AM01Sep2016 = "08:09 AM 01 Sep 2016"
    }

    // MARK: - Ars
    struct Ars: Codable {
        let productID: String
        let rates: ARSRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - ARSRates
    struct ARSRates: Codable {
        let ars: ARSClass

        enum CodingKeys: String, CodingKey {
            case ars = "ARS"
        }
    }

    // MARK: - Bdt
    struct Bdt: Codable {
        let productID: String
        let rates: BDTRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - BDTRates
    struct BDTRates: Codable {
        let bdt: ARSClass

        enum CodingKeys: String, CodingKey {
            case bdt = "BDT"
        }
    }

    // MARK: - Bnd
    struct Bnd: Codable {
        let productID: String
        let rates: BNDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - BNDRates
    struct BNDRates: Codable {
        let bnd: ARSClass

        enum CodingKeys: String, CodingKey {
            case bnd = "BND"
        }
    }

    // MARK: - Brl
    struct Brl: Codable {
        let productID: String
        let rates: BRLRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - BRLRates
    struct BRLRates: Codable {
        let brl: ARSClass

        enum CodingKeys: String, CodingKey {
            case brl = "BRL"
        }
    }

    // MARK: - CAD
    struct CAD: Codable {
        let productID: String
        let rates: CADRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - CADRates
    struct CADRates: Codable {
        let cad: ARSClass

        enum CodingKeys: String, CodingKey {
            case cad = "CAD"
        }
    }

    // MARK: - Chf
    struct Chf: Codable {
        let productID: String
        let rates: CHFRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - CHFRates
    struct CHFRates: Codable {
        let chf: ARSClass

        enum CodingKeys: String, CodingKey {
            case chf = "CHF"
        }
    }

    // MARK: - Clp
    struct Clp: Codable {
        let productID: String
        let rates: CLPRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - CLPRates
    struct CLPRates: Codable {
        let clp: ARSClass

        enum CodingKeys: String, CodingKey {
            case clp = "CLP"
        }
    }

    // MARK: - Cnh
    struct Cnh: Codable {
        let productID: String
        let rates: CNHRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - CNHRates
    struct CNHRates: Codable {
        let cnh: ARSClass

        enum CodingKeys: String, CodingKey {
            case cnh = "CNH"
        }
    }

    // MARK: - Cny
    struct Cny: Codable {
        let productID: String
        let rates: CNYRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - CNYRates
    struct CNYRates: Codable {
        let cny: ARSClass

        enum CodingKeys: String, CodingKey {
            case cny = "CNY"
        }
    }

    // MARK: - Dkk
    struct Dkk: Codable {
        let productID: String
        let rates: DKKRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - DKKRates
    struct DKKRates: Codable {
        let dkk: ARSClass

        enum CodingKeys: String, CodingKey {
            case dkk = "DKK"
        }
    }

    // MARK: - Eur
    struct Eur: Codable {
        let productID: String
        let rates: EURRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - EURRates
    struct EURRates: Codable {
        let eur: ARSClass

        enum CodingKeys: String, CodingKey {
            case eur = "EUR"
        }
    }

    // MARK: - Fjd
    struct Fjd: Codable {
        let productID: String
        let rates: FJDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - FJDRates
    struct FJDRates: Codable {
        let fjd: ARSClass

        enum CodingKeys: String, CodingKey {
            case fjd = "FJD"
        }
    }

    // MARK: - Gbp
    struct Gbp: Codable {
        let productID: String
        let rates: GBPRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - GBPRates
    struct GBPRates: Codable {
        let gbp: ARSClass

        enum CodingKeys: String, CodingKey {
            case gbp = "GBP"
        }
    }

    // MARK: - Hkd
    struct Hkd: Codable {
        let productID: String
        let rates: HKDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - HKDRates
    struct HKDRates: Codable {
        let hkd: ARSClass

        enum CodingKeys: String, CodingKey {
            case hkd = "HKD"
        }
    }

    // MARK: - Idr
    struct Idr: Codable {
        let productID: String
        let rates: IDRRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - IDRRates
    struct IDRRates: Codable {
        let idr: ARSClass

        enum CodingKeys: String, CodingKey {
            case idr = "IDR"
        }
    }

    // MARK: - Inr
    struct Inr: Codable {
        let productID: String
        let rates: INRRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - INRRates
    struct INRRates: Codable {
        let inr: ARSClass

        enum CodingKeys: String, CodingKey {
            case inr = "INR"
        }
    }

    // MARK: - Jpy
    struct Jpy: Codable {
        let productID: String
        let rates: JPYRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - JPYRates
    struct JPYRates: Codable {
        let jpy: ARSClass

        enum CodingKeys: String, CodingKey {
            case jpy = "JPY"
        }
    }

    // MARK: - Krw
    struct Krw: Codable {
        let productID: String
        let rates: KRWRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - KRWRates
    struct KRWRates: Codable {
        let krw: ARSClass

        enum CodingKeys: String, CodingKey {
            case krw = "KRW"
        }
    }

    // MARK: - Lkr
    struct Lkr: Codable {
        let productID: String
        let rates: LKRRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - LKRRates
    struct LKRRates: Codable {
        let lkr: ARSClass

        enum CodingKeys: String, CodingKey {
            case lkr = "LKR"
        }
    }

    // MARK: - Myr
    struct Myr: Codable {
        let productID: String
        let rates: MYRRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - MYRRates
    struct MYRRates: Codable {
        let myr: ARSClass

        enum CodingKeys: String, CodingKey {
            case myr = "MYR"
        }
    }

    // MARK: - Nok
    struct Nok: Codable {
        let productID: String
        let rates: NOKRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - NOKRates
    struct NOKRates: Codable {
        let nok: ARSClass

        enum CodingKeys: String, CodingKey {
            case nok = "NOK"
        }
    }

    // MARK: - Nzd
    struct Nzd: Codable {
        let productID: String
        let rates: NZDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - NZDRates
    struct NZDRates: Codable {
        let nzd: ARSClass

        enum CodingKeys: String, CodingKey {
            case nzd = "NZD"
        }
    }

    // MARK: - Pgk
    struct Pgk: Codable {
        let productID: String
        let rates: PGKRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - PGKRates
    struct PGKRates: Codable {
        let pgk: ARSClass

        enum CodingKeys: String, CodingKey {
            case pgk = "PGK"
        }
    }

    // MARK: - PHP
    struct PHP: Codable {
        let productID: String
        let rates: PHPRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - PHPRates
    struct PHPRates: Codable {
        let php: ARSClass

        enum CodingKeys: String, CodingKey {
            case php = "PHP"
        }
    }

    // MARK: - Pkr
    struct Pkr: Codable {
        let productID: String
        let rates: PKRRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - PKRRates
    struct PKRRates: Codable {
        let pkr: ARSClass

        enum CodingKeys: String, CodingKey {
            case pkr = "PKR"
        }
    }

    // MARK: - Sar
    struct Sar: Codable {
        let productID: String
        let rates: SARRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - SARRates
    struct SARRates: Codable {
        let sar: ARSClass

        enum CodingKeys: String, CodingKey {
            case sar = "SAR"
        }
    }

    // MARK: - Sbd
    struct Sbd: Codable {
        let productID: String
        let rates: SBDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - SBDRates
    struct SBDRates: Codable {
        let sbd: ARSClass

        enum CodingKeys: String, CodingKey {
            case sbd = "SBD"
        }
    }

    // MARK: - Sek
    struct Sek: Codable {
        let productID: String
        let rates: SEKRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - SEKRates
    struct SEKRates: Codable {
        let sek: ARSClass

        enum CodingKeys: String, CodingKey {
            case sek = "SEK"
        }
    }

    // MARK: - Sgd
    struct Sgd: Codable {
        let productID: String
        let rates: SGDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - SGDRates
    struct SGDRates: Codable {
        let sgd: ARSClass

        enum CodingKeys: String, CodingKey {
            case sgd = "SGD"
        }
    }

    // MARK: - Thb
    struct Thb: Codable {
        let productID: String
        let rates: THBRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - THBRates
    struct THBRates: Codable {
        let thb: ARSClass

        enum CodingKeys: String, CodingKey {
            case thb = "THB"
        }
    }

    // MARK: - Top
    struct Top: Codable {
        let productID: String
        let rates: TOPRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - TOPRates
    struct TOPRates: Codable {
        let top: ARSClass

        enum CodingKeys: String, CodingKey {
            case top = "TOP"
        }
    }

    // MARK: - Twd
    struct Twd: Codable {
        let productID: String
        let rates: TWDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - TWDRates
    struct TWDRates: Codable {
        let twd: ARSClass

        enum CodingKeys: String, CodingKey {
            case twd = "TWD"
        }
    }

    // MARK: - Usd
    struct Usd: Codable {
        let productID: String
        let rates: USDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - USDRates
    struct USDRates: Codable {
        let usd: ARSClass

        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }

    // MARK: - Vnd
    struct Vnd: Codable {
        let productID: String
        let rates: VNDRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - VNDRates
    struct VNDRates: Codable {
        let vnd: ARSClass

        enum CodingKeys: String, CodingKey {
            case vnd = "VND"
        }
    }

    // MARK: - Vuv
    struct Vuv: Codable {
        let productID: String
        let rates: VUVRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - VUVRates
    struct VUVRates: Codable {
        let vuv: ARSClass

        enum CodingKeys: String, CodingKey {
            case vuv = "VUV"
        }
    }

    // MARK: - Wst
    struct Wst: Codable {
        let productID: String
        let rates: WSTRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - WSTRates
    struct WSTRates: Codable {
        let wst: ARSClass

        enum CodingKeys: String, CodingKey {
            case wst = "WST"
        }
    }

    // MARK: - Xau
    struct Xau: Codable {
        let productID: String
        let rates: XAURates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - XAURates
    struct XAURates: Codable {
        let xau: ARSClass

        enum CodingKeys: String, CodingKey {
            case xau = "XAU"
        }
    }

    // MARK: - Xpf
    struct Xpf: Codable {
        let productID: String
        let rates: XPFRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - XPFRates
    struct XPFRates: Codable {
        let xpf: ARSClass

        enum CodingKeys: String, CodingKey {
            case xpf = "XPF"
        }
    }

    // MARK: - Zar
    struct Zar: Codable {
        let productID: String
        let rates: ZARRates

        enum CodingKeys: String, CodingKey {
            case productID = "ProductId"
            case rates = "Rates"
        }
    }

    // MARK: - ZARRates
    struct ZARRates: Codable {
        let zar: ARSClass

        enum CodingKeys: String, CodingKey {
            case zar = "ZAR"
        }
    }


}
