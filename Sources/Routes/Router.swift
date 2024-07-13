//
//  Router.swift
//  
//
//  Created by Ezhil Ananthavel on 03/05/24.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


func setupRouter() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "/") { request, response in
        print(request)
        response.setBody(string: "Hello world!").completed(status: .ok)
    }
    
    routes.add(method: .get, uri: "/products") { request, response in
        ProductListController().handleProductListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/products/{id}") { request, response in
        ProductDetailController().handleProductDetailRequest(request: request, response: response)
    }
    
    
    return routes
}
