//
//  ProductListController.swift
//
//
//  Created by Ezhil Ananthavel on 03/05/24.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class ProductListController {
    func handleProductListRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            try response.setBody(json: getProducts())
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
}
