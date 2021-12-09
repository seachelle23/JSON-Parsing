//
//  ContentView.swift
//  JSON Parsing
//
//  Created by Michelle Kelly (student LM) on 12/9/21.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
    let input = """
        {
            "name": "Billy Bob"
            "address": {
                "street": "555 Happy Street"
                "city": "Nashville"
            }
        }
        """
    
    @State var text = " "
    
    var body: some View {
        VStack{
            Button(action:{
                    let data = Data(input.utf8)
                    let decoder = JSONDecoder()
                    if let user = try? decoder.decode(User.self, from: data) {
                        self.text = user.address.street
                    }}, label: {
                        Text("Click me")
                    })
            Text(text)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
