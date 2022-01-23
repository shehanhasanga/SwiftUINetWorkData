//
//  DetailsView.swift
//  HackerNews
//
//  Created by shehan karunarathna on 2022-01-22.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    let url:String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "google.com")
    }
}

struct WebView: UIViewRepresentable{
    let urlString:String?
    func makeUIView(context: Context) ->  WebView.UIViewType {
        return WKWebView()
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
