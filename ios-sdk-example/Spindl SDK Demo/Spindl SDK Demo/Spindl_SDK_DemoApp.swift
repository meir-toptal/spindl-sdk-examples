//
//  Spindl_SDK_DemoApp.swift
//  Spindl SDK Demo
//
//  Created by מאיר רדנוביץ׳ on 21/11/2023.
//

import SwiftUI
import SpindlSDK


@main
struct Spindl_SDK_DemoApp: App {
    
    @StateObject var demoViewModel = DemoViewModel()
    
    init() {
        Spindl.initialize(apiKey: "9662ea01-769c-4a5b-8126-9e2647493846")
        Task {
            do {
                try await Spindl.shared.identify(customerUserId: "sdkdemo@spindl.xyz")
            } catch {
                print("Couldn't initialise Spindl SDK: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(demoViewModel)
        }
    }
}
