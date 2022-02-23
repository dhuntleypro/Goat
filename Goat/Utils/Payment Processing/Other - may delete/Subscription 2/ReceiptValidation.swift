//
//  ReceiptValidation.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//

//
//import Foundation
//
//class ReceiptValidation: IAPService {
//    
//    func validateAppReceipt(_ receipt: Data) {
//        let receiptString = receipt.base64EncodedString(options: [])
//        //create a dictonary with receipt data and app secret
//        let requestDictionary = ["receipt-data":receiptString,"password": appSecret]
//        
//        let jsonData = try! JSONSerialization.data(withJSONObject: requestDictionary, options: [])
//        var request = URLRequest(url: URL(string: testUrl)!)
//        
//        let session = URLSession.shared
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
//        
//        let task = session.dataTask(with: request, completionHandler: { data, response, error  in
//            if let dataR = data
//            {
//                self.handleData(responseDatas: dataR as Data)
//            }
//            else{
//                print(error?.localizedDescription ?? "")
//            }
//        })
//        task.resume()
//    }
//    
//    func handleData(responseDatas : Data) {
//        
//        if let json = try? JSONSerialization.jsonObject(with: responseDatas as Data, options: JSONSerialization.ReadingOptions.mutableLeaves) as? NSDictionary
//        {
//            print(json)
//            //get recipt valuse from json
//            let Receipt = json.value(forKeyPath: "receipt") as? [String:Any]
//            if let hasRecept = Receipt{
//                let id = hasRecept["bundle_id"] as? String
//                if let hasID = id {
//                    let result = validateBunldeID(productID: hasID)
//                    if result {
//                        //valide that is rereipt valid
//                        if let value = json.value(forKeyPath: "status") as? Int{
//                            ReceiptValidation(statusValue: value)
//                        }
//                        //check subcriptio  status in case of auto renewal
//                        let renewal_info = json.value(forKeyPath: "pending_renewal_info") as? [[String:Any]]
//                        if let ReceiptData = renewal_info{
//                            let ReceiptValues = ReceiptData[0]
//                            let status = ReceiptValues["auto_renew_status"] as? String
//                            if let hasStatus = status {
//                                ValideActiveSubcription(status_: hasStatus)
//                            }
//                        } //end renewal info
//                    }//validate receipt
//                }
//            }
//        }
//    }
//    
//    
//    func UpdatePrimierUser(status:Bool) {
//        UserDefaults.standard.set(status, forKey: "PremiumUser")
//        UserDefaults.standard.synchronize()
//    }
//    
//   
//    
//    func validateBunldeID(productID:String)->Bool{
//        if productID == "com.languages.translator.photo.voice.speak.translate" {
//            return true
//        }
//        else{
//            return false
//        }
//    }
//    
//    func ReceiptValidation(statusValue:Int) {
//        if statusValue == 0{
//            //UpdatePrimierUser(status: true)
//            print("valid receipt")
//        }
//        if statusValue == 1{
//           // UpdatePrimierUser(status: false)
//            print("valid receipt")
//        }
//    }
//    
//    func ValideActiveSubcription(status_:String){
//        if status_ == "1" {
//            UpdatePrimierUser(status: true)
//            print("Subcription active")
//        }
//         if status_ == "0"{
//            UpdatePrimierUser(status: false)
//            print("Subcription expired")
//        }
//    }
//}
//
