import SSLCommerzSDK

public class SwiftSslcommerzFlutterPlugin: NSObject, FlutterPlugin {
    var delegate : IDelegate
    
    init(pluginRegistrar: FlutterPluginRegistrar, uiViewController: UIViewController) {
        delegate = SSLCommerzPluginDelegate(registrar: pluginRegistrar, viewController: uiViewController)
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "sslcommerz_flutter_plugin", binaryMessenger: registrar.messenger())
        let viewController: UIViewController =
            (UIApplication.shared.delegate?.window??.rootViewController)!
        let instance = SwiftSslcommerzFlutterPlugin(pluginRegistrar: registrar, uiViewController: viewController)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "openSSLCommerz") {
            let arguments = call.arguments as? Dictionary<String, Any>
            delegate.startSSLCommerzTransaction(result: result, arguments: (arguments as? Dictionary<String, String>))
        }
    }
    
}

protocol IDelegate {
    func startSSLCommerzTransaction(result: @escaping FlutterResult, arguments: Dictionary<String, String>?)
}

class SSLCommerzPluginDelegate : IDelegate, SSLCommerzDelegate {
    static let TRANSACTION_SUCCESS_CODE = 0
    static let TRANSACTION_FAIL_CODE = 1
    static let MERCHANT_VALIDATION_ERROR_CODE = 2;

    private let flutterRegistrar: FlutterPluginRegistrar
    private var viewController: UIViewController
    private var pendingResult: FlutterResult?
    var sslCom: SSLCommerz?
    
    init(registrar: FlutterPluginRegistrar, viewController: UIViewController) {
        self.flutterRegistrar = registrar
        self.viewController = viewController
    }
    
    func transactionCompleted(withTransactionData transactionData: TransactionDetails?) {
        var response = [String:Any]()
        if transactionData?.apiConnect == "DONE" && (transactionData?.status == "VALID" || transactionData?.status == "VALIDATED") {
            let tranDataDic = ["status": transactionData?.status,
                               "sessionkey": transactionData?.sessionkey,
                               "tran_date": transactionData?.tran_date,
                               "tran_id": transactionData?.tran_id,
                               "val_id": transactionData?.val_id,
                               "amount": transactionData?.amount,
                               "store_amount": transactionData?.store_amount,
                               "bank_tran_id": transactionData?.bank_tran_id,
                               "card_type": transactionData?.card_type,
                               "card_no": transactionData?.card_no,
                               "card_issuer": transactionData?.card_issuer,
                               "card_brand": transactionData?.card_brand,
                               "card_issuer_country": transactionData?.card_issuer_country,
                               "card_issuer_country_code": transactionData?.card_issuer_country_code,
                               "currency_type": transactionData?.currency_type,
                               "currency_amount": transactionData?.currency_amount,
                               "currency_rate": transactionData?.currency_rate,
                               "base_fair": transactionData?.base_fair,
                               "value_a": transactionData?.value_a,
                               "value_b": transactionData?.value_b,
                               "value_c": transactionData?.value_c,
                               "value_d": transactionData?.value_d,
                               "risk_title": transactionData?.risk_title,
                               "risk_level": transactionData?.risk_level,
                               "APIConnect": transactionData?.apiConnect,
                               "validated_on": transactionData?.validated_on,
                               "gw_version": transactionData?.gw_version,
            ]
            let encoder = JSONEncoder()
            var transactionDataJson: String?
            if let jsonData = try? encoder.encode(tranDataDic) {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    transactionDataJson = jsonString
                }
            }
            response["type"] = SSLCommerzPluginDelegate.TRANSACTION_SUCCESS_CODE
            response["data"] = transactionDataJson
            pendingResult!(response as NSDictionary)
        } else if transactionData?.status == "FAILED" {
            response["type"] = SSLCommerzPluginDelegate.TRANSACTION_FAIL_CODE
            response["data"] = "Transaction Failed"
            pendingResult!(response as NSDictionary)
        } else if (transactionData?.apiConnect == "INVALID_REQUEST" || transactionData?.apiConnect == "FAILED" || transactionData?.apiConnect == "INACTIVE") {
            response["type"] = SSLCommerzPluginDelegate.MERCHANT_VALIDATION_ERROR_CODE
            response["data"] = "Merchant Validation Failed"
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
    func startSSLCommerzTransaction(result: @escaping FlutterResult, arguments: Dictionary<String, String>?) {
        pendingResult = result
        
        let sslCommerzInitializationDict = convertStringToDictionary(text: arguments?["sslCommerzInitialization"] ?? "")
        let customerInfoDict = convertStringToDictionary(text: arguments?["customerInfoInitializer"] ?? "")
        let emiInfoDict = convertStringToDictionary(text: arguments?["emiTransactionInitializer"] ?? "")
        let productInfoDict = convertStringToDictionary(text: arguments?["productInitializer"] ?? "")
        let shipmentInfoDict = convertStringToDictionary(text: arguments?["shipmentInfoInitializer"] ?? "")
        let additionalInfoDict = convertStringToDictionary(text: arguments?["additionalInitializer"] ?? "")
        
        // mandatory field to initialize SSLCommerz
        let sslCommerzInitializationObj = IntegrationInformation.init(
            storeID: sslCommerzInitializationDict?["store_id"] as! String,
            storePassword: sslCommerzInitializationDict?["store_passwd"] as! String,
            totalAmount: sslCommerzInitializationDict!["total_amount"] as! Double,
            currency: sslCommerzInitializationDict?["currency"] as! String,
            transactionId: sslCommerzInitializationDict?["tran_id"] as! String,
            productCategory: sslCommerzInitializationDict?["product_category"] as! String)
        //optional params
        sslCommerzInitializationObj.ipnURL = sslCommerzInitializationDict?["ipn_url"] as? String
        sslCommerzInitializationObj.multiCardName = sslCommerzInitializationDict?["multi_card_name"] as? String
        sslCommerzInitializationObj.allowedBIN = sslCommerzInitializationDict?["allowed_bin"] as? String
        
        // optional fields to send additional data to SSLCommerz
        // CustomerInformation
        var customerInfoObj:CustomerInformation?
        if customerInfoDict != nil {
            customerInfoObj = CustomerInformation(
                customerName: customerInfoDict?["customerName"] as! String,
                customerEmail: customerInfoDict?["customerEmail"] as! String,
                customerAddressOne: customerInfoDict?["customerAddress1"] as! String,
                customerCity: customerInfoDict?["customerCity"] as! String,
                customerPostCode: customerInfoDict?["customerPostCode"] as! String,
                customerCountry: customerInfoDict?["customerCountry"] as! String,
                customerPhone: customerInfoDict?["customerPhone"] as! String)
            // optional params
            customerInfoObj?.customerAddressTwo = customerInfoDict?["customerAddress2"] as? String
            customerInfoObj?.customerState = customerInfoDict?["customerState"] as? String
            customerInfoObj?.customerFax = customerInfoDict?["customerFax"] as? String
        } else {
            customerInfoObj = nil
        }
        
        // EMIInformation
        var emiInfoObj:EMIInformation?
        if emiInfoDict != nil {
            emiInfoObj = EMIInformation(emiOption: emiInfoDict?["emi_options"] as! Int == 1 ? .HasEMI : .NoEMI)
            // optional params
            emiInfoObj?.emiMaximumInstallmentOption = emiInfoDict?["emi_max_list_options"] as? NSNumber
            emiInfoObj?.emiSelectedInstallmentOption = emiInfoDict?["emi_selected_inst"] as? NSNumber
        } else {
            emiInfoObj = nil
        }
        
        // ProductInformation
        var productInfoObj:ProductInformation?
        if productInfoDict != nil {
            // find productProfile type
            var productProfileVal:ProductProfile?
            if !(productInfoDict?["general"] is NSNull) {
                productProfileVal = ProductProfileOptions.General.profile
            } else if !(productInfoDict?["physicalGoods"] is NSNull) {
                productProfileVal = ProductProfileOptions.PhysicalGoods.profile
            } else if !(productInfoDict?["nonPhysicalGoods"] is NSNull) {
                productProfileVal = ProductProfileOptions.NonPhysicalGoods.profile
            } else if !(productInfoDict?["airlinesTicket"] is NSNull) {
                productProfileVal = ProductProfileOptions.AirlineTickets(
                    hoursTillDeparture: productInfoDict?["airlinesTicket"]?["hoursTillDeparture"] as! String,
                    flightType: productInfoDict?["airlinesTicket"]?["flightType"] as! String,
                    pnr: productInfoDict?["airlinesTicket"]?["pnr"] as! String,
                    journeyFromTo: productInfoDict?["airlinesTicket"]?["journeyFromTo"] as! String,
                    thirdPartyBooking: productInfoDict?["airlinesTicket"]?["thirdPartyBooking"] as? Bool ?? false).profile
            } else if !(productInfoDict?["travelVertical"] is NSNull) {
                productProfileVal = ProductProfileOptions.TravelVertical(
                    hotelName: productInfoDict?["travelVertical"]?["hotelName"] as! String,
                    lengthOfStay: productInfoDict?["travelVertical"]?["lengthOfStay"] as! String,
                    checkInTime: productInfoDict?["travelVertical"]?["checkInTime"] as! String,
                    hotelCity: productInfoDict?["travelVertical"]?["hotelCity"] as! String).profile
            } else if !(productInfoDict?["telecomVertical"] is NSNull) {
                productProfileVal = ProductProfileOptions.TelecomVertical(
                    productType: productInfoDict?["telecomVertical"]?["productType"] as! String,
                    topupNumber: productInfoDict?["telecomVertical"]?["topUpNumber"] as! String,
                    countryTopup: productInfoDict?["telecomVertical"]?["countryTopUp"] as! String).profile
            }
            productInfoObj = ProductInformation.init(
                productName: productInfoDict?["productName"] as! String,
                productCategory: productInfoDict?["productCategory"] as! String,
                productProfile: productProfileVal!)
            // optional params ("cart" is not included due to param value mismatch in android and iOS ends)
            productInfoObj?.productAmount = productInfoDict?["productAmount"] as? NSNumber
            productInfoObj?.vat = productInfoDict?["vat"] as? NSNumber
            productInfoObj?.discountAmount = productInfoDict?["discountAmount"] as? NSNumber
            productInfoObj?.convenienceFee = productInfoDict?["convenienceFee"] as? NSNumber
        } else {
            productInfoObj = nil
        }
        
        // Shipment Information
        var shimpmentInfoObj:ShipmentInformation?
        if shipmentInfoDict != nil {
            shimpmentInfoObj = ShipmentInformation.init(
                shippingMethod: shipmentInfoDict?["shipmentMethod"] as! String,
                numberOfItem: shipmentInfoDict?["numOfItems"] as! Int,
                shippingName: shipmentInfoDict?["shipmentDetails"]?["shipName"] as! String,
                shippingAddressOne: shipmentInfoDict?["shipmentDetails"]?["shipAddress1"] as! String,
                shippingAddressTwo: shipmentInfoDict?["shipAddress2"] as! String,
                shippingCity: shipmentInfoDict?["shipmentDetails"]?["shipCity"] as! String,
                shippingPostCode: shipmentInfoDict?["shipmentDetails"]?["shipPostCode"] as! String,
                shippingCountry: shipmentInfoDict?["shipmentDetails"]?["shipCountry"] as! String)
            // optional params
            shimpmentInfoObj?.shippingState = shipmentInfoDict?["shipState"] as? String
        } else {
            shimpmentInfoObj = nil
        }
        
        // Additional Information
        var additionalInfoObj:AdditionalInformation?
        if additionalInfoDict != nil {
            additionalInfoObj = AdditionalInformation.init(
                paramA: !(additionalInfoDict?["valueA"] is NSNull) ? additionalInfoDict?["valueA"] as? String : nil,
                paramB: !(additionalInfoDict?["valueB"] is NSNull) ? additionalInfoDict?["valueB"] as? String : nil,
                paramC: !(additionalInfoDict?["valueC"] is NSNull) ? additionalInfoDict?["valueC"] as? String : nil,
                paramD: !(additionalInfoDict?["valueD"] is NSNull) ? additionalInfoDict?["valueD"] as? String : nil)
        } else {
            additionalInfoObj = nil
        }
        
        sslCom = SSLCommerz.init(
            integrationInformation: sslCommerzInitializationObj,
            emiInformation: emiInfoObj,
            customerInformation: customerInfoObj,
            shipmentInformation: shimpmentInfoObj,
            productInformation: productInfoObj,
            additionalInformation: additionalInfoObj)
        
        sslCom?.delegate = self
        sslCom?.start(in: viewController, shouldRunInTestMode: true)
    }
}


