//
//  ProductDetailController.swift
//
//
//  Created by Ezhil Ananthavel on 03/05/24.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class ProductDetailController {
    func handleProductDetailRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            guard let productId: Int = Int(request.urlVariables["id"] ?? "") else {
                response.setBody(string: "Id is missing")
                    .completed(status: .badRequest)
                return
            }
            
            let product = getProducts().filter { items in
                if let id = items["id"] as? Int {
                    return id == productId
                }
                return false
            }.first
            
            guard let product = product else {
                try response.setBody(json: ["message": "No product found"])
                    .setHeader(.contentType, value: "application/json")
                    .completed(status: .ok)
                return
            }
            try response.setBody(json: product)
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
    
}
